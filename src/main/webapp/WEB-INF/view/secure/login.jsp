<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>로그인</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- CSRF 토큰 -->
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	const login = async ()=>{

		let formData = new URLSearchParams();// accountId=batman&pwd=1234 형식으로 자동 변환
		formData.append("accountId", $("input[name='accountId']").val());
		formData.append("pwd", $("input[name='pwd']").val());

		// 시큐리티는 json 을 인식하지 못하므로 폼 형식으로 전송 + CSRF 토큰을 헤더에 추가
		const headers = {
			"Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"
		};
		const csrfHeader = $("meta[name='_csrf_header']").attr("content");
		const csrfToken = $("meta[name='_csrf']").attr("content");
		if (csrfHeader && csrfToken) {
			headers[csrfHeader] = csrfToken;
		}

		try{
			const response = await fetch("${pageContext.request.contextPath}/login", {
				method:"POST",
				headers:headers,
				body:formData
			});

			const json = await response.json();
			console.log("서버로부터 받은 응답 데이터는", json);
			alert(json.message);

			// 로그인 성공 시 확인 페이지로 이동
			if (json.success) location.href = "${pageContext.request.contextPath}/main";

		}catch(error){
			console.log("로그인 실패", error);
		}
	}

	$(function(){
		$("#bt-login").click(()=>{
			login()
		});
	});
</script>
</head>
<body>

	<div class="container">
		<h2>로그인</h2>
		<form id="form1">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Enter Your Id" name="accountId">
			</div>

			<div class="form-group">
				<input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
			</div>

			<button type="button" class="btn btn-primary" id="bt-login">Submit</button>
		</form>
	</div>

</body>
</html>