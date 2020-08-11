<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <title>完善个人信息</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <%--suppress SpellCheckingInspection --%>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <%--suppress SpellCheckingInspection --%>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.min.js"
            integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
            crossorigin="anonymous"></script>
</head>
<body class="bg-light">
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
    <h5 class="my-0 mr-md-auto font-weight-normal">人才招聘网 <span class="badge badge-success">个人版</span></h5>
    <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/user/mainPage?tab=info">返回主页</a>
</div>

<div class="container my-5">
    <form action="${pageContext.request.contextPath}/user/editInfo" method="post">
        <div class="col-md-8 order-md-1 mx-auto">
            <h4 class="mb-3">基本信息填写</h4>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="name">姓名</label>
                    <input type="text" name="name" id="name" class="form-control" value="${info.name}"
                           required="required"/>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="sex">性别</label>
                    <select class="custom-select d-block w-100" id="sex" name="sex" required>
                        <option value="男" <c:if test="${info.sex.equals('男')}">selected</c:if>>男
                        </option>
                        <option value="女" <c:if test="${info.sex.equals('女')}">selected</c:if>>女
                        </option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="birthday">出生日期</label>
                    <input type="date" name="birthday" id="birthday" class="form-control"
                           value="<fmt:formatDate value="${info.birthday}" pattern="yyyy-MM-dd"/>"
                           required="required"/>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="city">所在城市</label>
                    <input type="text" name="city" id="city" class="form-control" value="${info.city}"
                           required="required"/>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="email">联系邮箱</label>
                    <input type="text" name="email" id="email" class="form-control"
                           value="${info.email}" required="required"/>
                </div>
            </div>
            <hr class="md-4">
            <div class="row">
                <div class="col-md-4 mx-auto mt-3">
                    <button class="btn btn-lg btn-primary btn-block" type="submit">提交</button>
                </div>
            </div>
            <p class="mt-5 mb-3 text-muted text-center">&copy; 2020-2021 Power by ChenXinze</p>
        </div>
    </form>
</div>
</body>
</html>