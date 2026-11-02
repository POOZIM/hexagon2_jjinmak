
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
// DB 연결 전 임시 사원 데이터
// 사번, 이름, 부서, 직급, 이메일, 연락처, 입사일, 상태
String[][] sampleEmployees = {{"E1001", "김민지", "백엔드팀", "대리", "minji@hrms.com", "010-1234-5678", "2022-03-14", "재직"},

		{"E1002", "이준호", "경영지원팀", "과장", "junho@hrms.com", "미등록", "2020-07-01", "재직"},

		{"E1003", "박서연", "프론트엔드팀", "사원", "seoyeon@hrms.com", "미등록", "2024-01-08", "휴직"},

		{"E1004", "최유진", "인사팀", "사원", "yujin@hrms.com", "미등록", "2021-09-06", "퇴직"}};

// Controller에서 전달받은 사번
String empId = (String) request.getAttribute("empId");

String[] emp = null;

for (String[] employee : sampleEmployees) {
	if (employee[0].equals(empId)) {
		emp = employee;
		break;
	}
}

String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>HRMS - 사원 상세 정보 조회</title>

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<!-- AdminLTE -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">

<!-- 사원 관리 통합 CSS -->
<link rel="stylesheet" href="<%=contextPath%>/css/employee.css">
</head>

<body class="hold-transition sidebar-mini layout-fixed">

	<div class="wrapper">

		<!-- 공통 헤더 -->
		<%@ include file="/WEB-INF/component/common/header.jspf"%>

		<!-- 공통 사이드바 -->
		<%@ include file="/WEB-INF/component/common/sidebar.jspf"%>

		<!-- 사원 상세 조회 -->
		<div class="content-wrapper employee-detail-page">

			<main class="employee-detail-container">

				<!-- 상단 제목 -->
				<div class="employee-detail-heading">

					<div>
						<h1>사원 상세 정보 조회</h1>
						<p>사원 관리 / 사원 목록 / 사원 상세 정보</p>
					</div>

					<a href="<%=contextPath%>/employees"
						class="employee-detail-button employee-detail-button-outline">

						<i class="fas fa-arrow-left"></i> 목록으로
					</a>

				</div>

				<%
				if (emp == null) {
				%>

				<!-- 사원 정보가 없는 경우 -->
				<section class="employee-detail-card employee-detail-not-found">

					<h2>해당 사원을 찾을 수 없습니다.</h2>

					<p>등록된 사번인지 확인해 주세요.</p>

					<a href="<%=contextPath%>/employees"
						class="employee-detail-button employee-detail-button-primary">
						목록으로 </a>

				</section>

				<%
				} else {
				%>

				<!-- 사원 요약 정보 -->
				<section class="employee-detail-card employee-detail-summary">

					<div class="employee-detail-person">

						<div class="employee-detail-avatar">
							<i class="fas fa-user"></i>
						</div>

						<div>
							<h2><%=emp[1]%></h2>

							<p>
								<%=emp[0]%>
								·
								<%=emp[2]%>
								/
								<%=emp[3]%>
							</p>
						</div>

					</div>

					<!-- 재직 상태 표시 -->
					<span
						class="employee-detail-status
                        <%="재직".equals(emp[7]) ? "is-active" : "휴직".equals(emp[7]) ? "is-leave" : "is-retired"%>">

						<span class="employee-detail-status-dot"></span> <%=emp[7]%>

					</span>

				</section>

				<!-- 사원 기본 정보 -->
				<section class="employee-detail-card employee-detail-info">

					<h2>사원 기본 정보</h2>

					<p class="employee-detail-hint">tb_employee 기준 · 비밀번호는 보안상 표시하지
						않습니다.</p>

					<div class="employee-detail-grid">

						<!-- 사번 -->
						<div class="employee-detail-field">
							<label>사번</label>

							<div class="employee-detail-value">
								<%=emp[0]%>
							</div>
						</div>

						<!-- 성명 -->
						<div class="employee-detail-field">
							<label>성명</label>

							<div class="employee-detail-value">
								<%=emp[1]%>
							</div>
						</div>

						<!-- 부서 -->
						<div class="employee-detail-field">
							<label>소속 부서</label>

							<div class="employee-detail-value">
								<%=emp[2]%>
							</div>
						</div>

						<!-- 직급 -->
						<div class="employee-detail-field">
							<label>직급</label>

							<div class="employee-detail-value">
								<%=emp[3]%>
							</div>
						</div>

						<!-- 이메일 -->
						<div class="employee-detail-field">
							<label>이메일</label>

							<div class="employee-detail-value">
								<%=emp[4]%>
							</div>
						</div>

						<!-- 연락처 -->
						<div class="employee-detail-field">
							<label>연락처</label>

							<div class="employee-detail-value">
								<%=emp[5]%>
							</div>
						</div>

						<!-- 입사일 -->
						<div class="employee-detail-field">
							<label>입사일</label>

							<div class="employee-detail-value">
								<%=emp[6]%>
							</div>
						</div>

						<!-- 재직 상태 -->
						<div class="employee-detail-field">
							<label>재직 상태</label>

							<div class="employee-detail-value">
								<%=emp[7]%>
							</div>
						</div>

					</div>

				</section>

				<!-- 관리자 작업 -->
				<section class="employee-detail-card employee-detail-actions">

					<div class="employee-detail-actions-text">

						<span>관리자 작업</span>

						<p>사원 정보를 확인한 후 수정하거나 퇴직 처리를 진행할 수 있습니다.</p>

					</div>

					<div class="employee-detail-action-buttons">

						<!-- 목록으로 -->
						<a href="<%=contextPath%>/employees"
							class="employee-detail-button employee-detail-button-outline">

							목록으로 </a>

						<!-- 정보 수정 -->
						<button type="button"
							class="employee-detail-button employee-detail-button-primary"
							onclick="editEmployee()">정보 수정</button>

						<!-- 퇴직 처리 -->
						<button type="button"
							class="employee-detail-button employee-detail-button-danger"
							onclick="retireEmployee()">퇴직 처리</button>

					</div>

				</section>

				<%
				}
				%>

			</main>

		</div>

	</div>

	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

	<!-- Bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

	<!-- AdminLTE -->
	<script
		src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>

	<script>
		// 사원 정보 수정
		function editEmployee() {
			location.href="<%=contextPath%>/employees/<%=empId%>/edit";
		}

		// 사원 퇴직 처리
		function retireEmployee() {
			const empId = "<%=empId%>";
			
			const confirmed = confirm("사번" + empId + "사원을 퇴직 처리 하시겠습니까?");
		
			if(confirmed){
				alert("퇴직 처리 요청을 확인했습니다.");
			}		
			
		}
		

		// 사이드바의 사원 관리 메뉴 활성화
		document.addEventListener("DOMContentLoaded", function() {

			const links = document.querySelectorAll(".main-sidebar .nav-link");

			links.forEach(function(link) {

				link.classList.remove("active");

				if (link.textContent.includes("03 사원 관리")) {
					link.classList.add("active");
				}

			});

		});
	</script>



</body>
</html>
