<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <title>个人权限设置</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.min.js"
            integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
            crossorigin="anonymous"></script>
</head>
<body class="bg-light">
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
    <h5 class="my-0 mr-md-auto font-weight-normal">人才招聘网 <span class="badge badge-success">管理员</span></h5>
    <a class="btn btn-outline-primary" href="mainPage.adminDo?tab=user-manage">返回主页</a>
</div>
<div class="container my-5">
    <form action="editUserAccess.adminDo" method="post">
        <label class="sr-only">
            <input name="tab" value="user-manage" hidden>
            <input name="userId" value="${requestScope.userAccount.user_id}" hidden>
        </label>
        <%--权限信息--%>
        <div class="alert alert-primary text-center" role="alert">个人用户权限设置</div>
        <table class="table table-striped table-bordered text-center">
            <tr>
                <td width="70%">访问、修改基本信息权限</td>
                <td>
                    <select class="custom-select d-block w-100" name="access_basic_information" required>
                        <option value="true"
                                <c:if test="${requestScope.userAccount.access_basic_information == true}">selected</c:if>>
                            启用
                        </option>
                        <option value="false"
                                <c:if test="${requestScope.userAccount.access_basic_information == false}">selected</c:if>>
                            禁用
                        </option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>访问、修改简历权限</td>
                <td>
                    <select class="custom-select d-block w-100" name="access_resume" required>
                        <option value="true"
                                <c:if test="${requestScope.userAccount.access_resume == true}">selected</c:if>>启用
                        </option>
                        <option value="false"
                                <c:if test="${requestScope.userAccount.access_resume == false}">selected</c:if>>禁用
                        </option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>应聘岗位权限</td>
                <td>
                    <select class="custom-select d-block w-100" name="access_apply" required>
                        <option value="true"
                                <c:if test="${requestScope.userAccount.access_apply == true}">selected</c:if>>启用
                        </option>
                        <option value="false"
                                <c:if test="${requestScope.userAccount.access_apply == false}">selected</c:if>>禁用
                        </option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>求职记录查询、取消权限</td>
                <td>
                    <select class="custom-select d-block w-100" name="access_apply_record" required>
                        <option value="true"
                                <c:if test="${requestScope.userAccount.access_apply_record == true}">selected</c:if>>启用
                        </option>
                        <option value="false"
                                <c:if test="${requestScope.userAccount.access_apply_record == false}">selected</c:if>>禁用
                        </option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>投诉岗位权限</td>
                <td>
                    <select class="custom-select d-block w-100" name="access_complaint" required>
                        <option value="true"
                                <c:if test="${requestScope.userAccount.access_complaint == true}">selected</c:if>>启用
                        </option>
                        <option value="false"
                                <c:if test="${requestScope.userAccount.access_complaint == false}">selected</c:if>>禁用
                        </option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>修改密码权限</td>
                <td>
                    <select class="custom-select d-block w-100" name="access_edit_password" required>
                        <option value="true"
                                <c:if test="${requestScope.userAccount.access_edit_password == true}">selected</c:if>>启用
                        </option>
                        <option value="false"
                                <c:if test="${requestScope.userAccount.access_edit_password == false}">selected</c:if>>
                            禁用
                        </option>
                    </select>
                </td>
            </tr>
        </table>
        <div class="col-md-3 mx-auto mt-3">
            <button class="btn btn-lg btn-primary btn-block" type="submit">提交</button>
        </div>
    </form>
    <p class="mt-5 mb-3 text-muted text-center">&copy; 2020-2021 Power by ChenXinze</p>
</div>
</body>
</html>