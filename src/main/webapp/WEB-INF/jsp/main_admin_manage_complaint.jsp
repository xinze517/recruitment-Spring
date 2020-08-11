<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <title>投诉处理页</title>
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
    <h5 class="my-0 mr-md-auto font-weight-normal">人才招聘网 <span class="badge badge-success">管理员</span></h5>
    <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/admin/mainPage?tab=complaint-manage">返回主页</a>
</div>
<div class="container my-5">
    <form action="${pageContext.request.contextPath}/admin/editComplaint" method="post">
        <label class="sr-only">
            <input name="tab" value="complaint-manage" hidden>
            <input name="complaintRecordId" value="${complaint.record_id}" hidden>
        </label>
        <%--显示投诉状态--%>
        <c:choose>
            <c:when test="${complaint.status.equals('未处理')}">
                <div class="alert alert-warning text-center" role="alert">
                    <h4 class="alert-heading">投诉状态</h4>
                    <p>投诉记录尚未处理，该岗位处于${position.status}状态</p>
                </div>
                <hr>
            </c:when>
            <c:when test="${complaint.status.equals('投诉成功')}">
                <div class="alert alert-success text-center" role="alert">
                    <h4 class="alert-heading">投诉状态</h4>
                    <p>该投诉已经被确定为有效，相关岗位已被屏蔽</p>
                </div>
                <hr>
            </c:when>
            <c:otherwise>
                <div class="alert alert-danger text-center" role="alert">
                    <h4 class="alert-heading">投诉状态</h4>
                    <p>该投诉已经被确定为无效</p>
                </div>
                <hr>
            </c:otherwise>
        </c:choose>
        <%--显示投诉人信息--%>
        <div class="alert alert-primary text-center" role="alert">投诉人信息</div>
        <table class="table table-striped table-bordered text-center ">
            <tr>
                <%--suppress HtmlDeprecatedAttribute --%>
                <td width="30%">投诉人</td>
                <td>${userInfo.name}</td>
            </tr>
            <tr>
                <td>用户账号</td>
                <td>${userAccount.account}</td>
            </tr>
        </table>
        <%--显示投诉岗位信息--%>
        <div class="alert alert-primary text-center" role="alert">投诉岗位详情</div>
        <table class="table table-striped table-bordered text-center ">
            <tr>
                <%--suppress HtmlDeprecatedAttribute --%>
                <td width="30%">岗位简称</td>
                <td>${position.name}</td>
            </tr>
            <tr>
                <td>岗位描述</td>
                <td>${position.description}</td>
            </tr>
            <tr>
                <td>岗位要求</td>
                <td>${position.requirements}</td>
            </tr>
            <tr>
                <td>工作地址</td>
                <td>${position.address}</td>
            </tr>
            <tr>
                <td>薪水</td>
                <td>${position.wage}</td>
            </tr>
        </table>
        <%--显示投诉公司信息--%>
        <div class="alert alert-primary text-center" role="alert">投诉公司详情</div>
        <table class="table table-striped table-bordered text-center ">
            <tr>
                <%--suppress HtmlDeprecatedAttribute --%>
                <td width="30%">法人代表</td>
                <td>${entInfo.legal_representative}</td>
            </tr>
            <tr>
                <td>成立时间</td>
                <td>${entInfo.established_date}</td>
            </tr>
            <tr>
                <td>接收简历邮箱</td>
                <td>${entInfo.email}</td>
            </tr>
            <tr>
                <td>公司全称</td>
                <td>${entInfo.name}</td>
            </tr>
            <tr>
                <td>公司主页</td>
                <td>${entInfo.home_page}</td>
            </tr>
            <tr>
                <td>公司介绍</td>
                <td>${entInfo.introduction}</td>
            </tr>
        </table>
        <%--处理状态显示处理按钮--%>
        <c:if test="${complaint.status.equals('未处理')}">
            <div class="row">
                <div class="col-md-3 mx-auto mt-3">
                    <button class="btn btn-lg btn-primary btn-block" type="submit"
                            name="status" value="投诉成功">屏蔽投诉岗位
                    </button>
                </div>
                <div class="col-md-3 mx-auto mt-3">
                    <button class="btn btn-lg btn-outline-danger btn-block" type="submit"
                            name="status" value="投诉失败">投诉无效
                    </button>
                </div>
            </div>
        </c:if>
        <c:if test="${complaint.status.equals('投诉成功')}">
            <div class="col-md-3 mx-auto mt-3">
                <button class="btn btn-lg btn-outline-danger btn-block" type="submit"
                        name="status" value="投诉失败">投诉无效
                </button>
            </div>
        </c:if>
        <c:if test="${complaint.status.equals('投诉失败')}">
            <div class="col-md-3 mx-auto mt-3">
                <button class="btn btn-lg btn-primary btn-block" type="submit"
                        name="status" value="投诉成功">屏蔽投诉岗位
                </button>
            </div>
        </c:if>
    </form>
    <p class="mt-5 mb-3 text-muted text-center">&copy; 2020-2021 Power by ChenXinze</p>
</div>
</body>
</html>