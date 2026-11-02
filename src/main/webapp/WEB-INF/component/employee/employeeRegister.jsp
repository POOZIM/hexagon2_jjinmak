
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>HRMS - 사원 등록</title>

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <!-- AdminLTE -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">

    <!-- 사원 관리 CSS -->
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/css/employee.css?v=12">
                   
          
</head>

<body class="hold-transition sidebar-mini layout-fixed">

<div class="wrapper">



    <!-- 공통 헤더 -->
    <%@ include file="/WEB-INF/component/common/header.jspf" %>

    <!-- 공통 사이드바 -->
    <%@ include file="/WEB-INF/component/common/sidebar.jspf" %>

    <div class="content-wrapper employee-detail-page employee-register-page">

        <main class="employee-detail-container">

            <!-- 페이지 제목 -->
            <div class="employee-detail-heading">
                <div>
                    <h1>사원 등록</h1>
                    <p>사원 관리 / 사원 목록 / 사원 등록</p>
                </div>

                <a href="<%=request.getContextPath()%>/employees"
                   class="employee-detail-button employee-detail-button-outline">
                    <i class="fas fa-arrow-left"></i>
                    목록으로
                </a>
            </div>

            <!-- 신규 사원 등록 폼 -->
            <form id="employeeRegisterForm"
                  onsubmit="return checkEmployeeRegister(event)">

                <section class="employee-detail-card employee-detail-info">

                    <h2>신규 사원 기본 정보</h2>

                    <p class="employee-detail-hint">
                        신규 사원 정보를 입력해 주세요.
                        <span class="employee-register-required">*</span>
                        표시는 필수 입력 항목입니다.
                    </p>

					<div class="employee-detail-grid employee-register-grid">
                    
                        <!-- 사번 -->
                        <div class="employee-detail-field">
                            <label for="empId">사번</label>

                            <input type="text"
                                   id="empId"
                                   class="employee-register-input"
                                   value="등록 시 자동 발급"
                                   readonly>
                        </div>

                        <!-- 성명 -->
                        <div class="employee-detail-field">
                            <label for="name">
                                성명
                                <span class="employee-register-required">*</span>
                            </label>

                            <input type="text"
                                   id="name"
                                   name="name"
                                   class="employee-register-input"
                                   placeholder="사원 이름 입력"
                                   maxlength="50"
                                   required>
                        </div>

                        <!-- 부서 -->
                        <div class="employee-detail-field">
                            <label for="department">
                                소속 부서
                                <span class="employee-register-required">*</span>
                            </label>

                            <select id="department"
                                    name="department"
                                    class="employee-register-input"
                                    required>

                                <option value="">부서 선택</option>
                                <option value="백엔드팀">백엔드팀</option>
                                <option value="프론트엔드팀">프론트엔드팀</option>
                                <option value="경영지원팀">경영지원팀</option>
                                <option value="인사팀">인사팀</option>

                            </select>
                        </div>

                        <!-- 직급 -->
                        <div class="employee-detail-field">
                            <label for="position">
                                직급
                                <span class="employee-register-required">*</span>
                            </label>

                            <select id="position"
                                    name="position"
                                    class="employee-register-input"
                                    required>

                                <option value="">직급 선택</option>
                                <option value="사원">사원</option>
                                <option value="대리">대리</option>
                                <option value="과장">과장</option>

                            </select>
                        </div>

                        <!-- 이메일 -->
                        <div class="employee-detail-field">
                            <label for="email">
                                이메일
                                <span class="employee-register-required">*</span>
                            </label>

                            <input type="email"
                                   id="email"
                                   name="email"
                                   class="employee-register-input"
                                   placeholder="example@hrms.com"
                                   maxlength="100"
                                   required>
                        </div>

                        <!-- 연락처 -->
                        <div class="employee-detail-field">
                            <label for="phone">
                                연락처
                                <span class="employee-register-required">*</span>
                            </label>

                            <input type="tel"
                                   id="phone"
                                   name="phone"
                                   class="employee-register-input"
                                   placeholder="010-1234-5678"
                                   pattern="[0-9-]{9,20}"
                                   title="숫자와 하이픈(-)만 입력해 주세요."
                                   maxlength="20"
                                   required>
                        </div>

                        <!-- 입사일 -->
                        <div class="employee-detail-field">
                            <label for="hireDate">
                                입사일
                                <span class="employee-register-required">*</span>
                            </label>

                            <input type="date"
                                   id="hireDate"
                                   name="hireDate"
                                   class="employee-register-input"
                                   required>
                        </div>

                        <!-- 재직 상태 -->
                        <div class="employee-detail-field">
                            <label for="status">재직 상태</label>

                            <input type="text"
                                   id="status"
                                   class="employee-register-input"
                                   value="재직"
                                   readonly>

                            <input type="hidden"
                                   name="status"
                                   value="재직">
                        </div>

                    </div>

                    <p class="employee-register-notice">
                        <i class="fas fa-info-circle"></i>
                        사번은 DB 연동 후 자동으로 발급됩니다.
                        신규 사원의 기본 상태는 재직입니다.
                    </p>

                </section>

                <!-- 하단 관리자 작업 -->
                <section class="employee-detail-card employee-detail-actions">

                    <div class="employee-detail-actions-text">
                        <span>관리자 작업</span>
                        <p>입력한 사원 정보를 확인해 주세요.</p>
                    </div>

                    <div class="employee-detail-action-buttons">

                        <a href="<%=request.getContextPath()%>/employees"
                           class="employee-detail-button employee-detail-button-outline">
                            취소
                        </a>

                        <button type="submit"
                                class="employee-detail-button employee-detail-button-primary">
                            등록 내용 확인
                        </button>

                    </div>

                </section>

            </form>

        </main>
    </div>
</div>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- AdminLTE -->
<script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>

<script>
    // DB 연결 전: 입력값 검사 및 등록 내용 확인
    function checkEmployeeRegister(event) {
        event.preventDefault();

        const form = document.getElementById("employeeRegisterForm");

        if (!form.reportValidity()) {
            return false;
        }

        const name = document.getElementById("name").value.trim();
        const department = document.getElementById("department").value;
        const position = document.getElementById("position").value;
        const email = document.getElementById("email").value.trim();
        const phone = document.getElementById("phone").value.trim();
        const hireDate = document.getElementById("hireDate").value;

        if (!name || !email || !phone) {
            alert("필수 항목을 입력해 주세요.");
            return false;
        }

        const summary =
            "성명: " + name + "\n" +
            "부서: " + department + "\n" +
            "직급: " + position + "\n" +
            "이메일: " + email + "\n" +
            "연락처: " + phone + "\n" +
            "입사일: " + hireDate + "\n" +
            "재직 상태: 재직";

        alert(
            "[사원 등록 내용 확인]\n\n" +
            summary +
            "\n\n현재 DB 미연결 상태이므로 실제로 저장되지는 않습니다."
        );

        return false;
    }

    // 사이드바 사원 관리 메뉴 활성화
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
