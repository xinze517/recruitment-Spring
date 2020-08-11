<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <title>岗位管理</title>
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
    <a class="btn btn-outline-primary"
       href="${pageContext.request.contextPath}/admin/mainPage?tab=position-manage">返回主页</a>
</div>
<div class="container my-5">
    <form action="${pageContext.request.contextPath}/admin/editPosition" method="post">
        <label class="sr-only">
            <input name="tab" value="position-manage" hidden>
            <input name="positionId" value="${position.position_id}" hidden>
        </label>
        <%-- 岗位状态通知 --%>
        <c:choose>
            <c:when test="${position.status.equals('屏蔽')}">
                <div class="alert alert-danger text-center" role="alert">
                    <h4 class="alert-heading">岗位状态</h4>
                    <p>
                        该岗位信息由于不合格或包含违法信息，已被管理员屏蔽<br>
                        该岗位信息现不允许编辑，且不允许重新发布！
                    </p>
                </div>
                <hr>
            </c:when>
            <c:when test="${position.status.equals('发布')}">
                <div class="alert alert-success text-center" role="alert">
                    <h4 class="alert-heading">岗位状态</h4>
                    <p>该岗位信息目前处于发布状态，所有应聘者均可见</p>
                </div>
                <hr>
            </c:when>
            <c:otherwise>
                <div class="alert alert-secondary text-center" role="alert">
                    <h4 class="alert-heading">岗位状态</h4>
                    <p>该岗位信息目前处于关闭状态，仅发布岗位的企业可见</p>
                </div>
                <hr>
            </c:otherwise>
        </c:choose>
        <%--岗位详情--%>
        <div class="alert alert-primary text-center" role="alert">岗位详情</div>
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

        <c:choose>
            <c:when test="${position.status.equals('屏蔽')}">
                <%--  当岗位被屏蔽时，显示解除屏蔽  --%>
                <div class="row">
                    <div class="col-md-3 mx-auto mt-3">
                        <button class="btn btn-lg btn-outline-success btn-block" name="status"
                                value="关闭" type="submit">解除屏蔽
                        </button>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <%--  当岗位不被屏蔽时，显示屏蔽按钮  --%>
                <div class="row">
                    <div class="col-md-3 mx-auto mt-3">
                        <button class="btn btn-lg btn-outline-danger btn-block" name="status"
                                value="屏蔽" type="submit">屏蔽岗位
                        </button>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </form>
    <p class="mt-5 mb-3 text-muted text-center">&copy; 2020-2021 Power by ChenXinze</p>
</div>
</body>
</html>