<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <title>企业资质审核</title>
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
    <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/admin/mainPage?tab=ent-manage">返回主页</a>
</div>
<div class="container my-5">
    <form action="${pageContext.request.contextPath}/admin/editEntStatus" method="post">
        <%--    记录一些必要信息    --%>
        <label>
            <input name="tab" value="ent-manage" hidden>
            <input name="entId" value="${entInfo.ent_id}" hidden>
        </label>
        <%--应聘者基本信息--%>
        <c:choose>
            <c:when test="${entAccount.status.equals('审核通过')}">
                <div class="alert alert-success text-center" role="alert">
                    <h4>企业注册信息</h4>
                    <p>企业已经通过审核</p>
                </div>
            </c:when>
            <c:when test="${entAccount.status.equals('审核不通过')}">
                <div class="alert alert-danger text-center" role="alert">
                    <h4>企业注册信息</h4>
                    <p>企业没有通过审核</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="alert alert-secondary text-center" role="alert">
                    <h4>企业注册信息</h4>
                </div>
            </c:otherwise>
        </c:choose>

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
        <div class="row">
            <c:if test="${entAccount.status.equals('未审核')}">
                <div class="col-md-3 mx-auto mt-3">
                    <button class="btn btn-lg btn-outline-success btn-block" name="status"
                            value="审核通过" type="submit">审核通过
                    </button>
                </div>
                <div class="col-md-3 mx-auto mt-3">
                    <button class="btn btn-lg btn-outline-danger btn-block" name="status"
                            value="审核不通过" type="submit">审核不通过
                    </button>
                </div>
            </c:if>
            <c:if test="${entAccount.status.equals('审核通过')}">
                <div class="col-md-3 mx-auto mt-3">
                    <button class="btn btn-lg btn-outline-danger btn-block" name="status"
                            value="审核不通过" type="submit">取消企业资质
                    </button>
                </div>
            </c:if>
            <c:if test="${entAccount.status.equals('审核不通过')}">
                <div class="col-md-3 mx-auto mt-3">
                    <button class="btn btn-lg btn-outline-success btn-block" name="status"
                            value="审核通过" type="submit">恢复企业资质
                    </button>
                </div>
            </c:if>
        </div>
    </form>
    <p class="mt-5 mb-3 text-muted text-center">&copy; 2020-2021 Power by ChenXinze</p>
</div>
</body>
</html>