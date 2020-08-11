<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <title>企业招聘信息</title>
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
    <h5 class="my-0 mr-md-auto font-weight-normal">人才招聘网 <span class="badge badge-success">企业版</span></h5>
    <c:if test="${entBlackList == null}">
        <a class="btn btn-outline-danger mr-3" href="#" data-toggle="modal" data-target="#alert-complaint">加入黑名单</a>
    </c:if>
    <c:if test="${entBlackList != null}">
        <a class="btn btn-outline-success mr-3" href="#" data-toggle="modal" data-target="#alert-complaint">取消黑名单</a>
    </c:if>
    <a class="btn btn-outline-primary"
            <c:choose>
                <c:when test="${from.equals('apply')}">
                    href="${pageContext.request.contextPath}/ent/mainPage?tab=apply"
                </c:when>
                <c:when test="${from.equals('black-list')}">
                    href="${pageContext.request.contextPath}/ent/mainPage?tab=black-list"
                </c:when>
            </c:choose>>返回主页</a>
</div>
<div class="container my-5">
    <form action="${pageContext.request.contextPath}/ent/editRecordApply" method="post">
        <%--  必需的参数  --%>
        <label class="sr-only">
            <input name="tab" value="${from}" hidden>
            <input name="applyRecordId" value="${applyRecordId}" hidden>
        </label>
        <%--应聘者基本信息--%>
        <div class="alert alert-primary text-center" role="alert">应聘者基本信息</div>
        <table class="table table-striped table-bordered text-center ">
            <tr>
                <%--suppress HtmlDeprecatedAttribute --%>
                <td width="30%">姓名</td>
                <td>${userInfo.name}</td>
            </tr>
            <tr>
                <td>性别</td>
                <td>${userInfo.sex}</td>
            </tr>
            <tr>
                <td>所在城市</td>
                <td>${userInfo.city}</td>
            </tr>
            <tr>
                <td>联系邮箱</td>
                <td>${userInfo.email}</td>
            </tr>
        </table>
        <%--应聘者简历--%>
        <div class="alert alert-primary text-center" role="alert">应聘者简历</div>
        <table class="table table-striped table-bordered text-center">
            <tr>
                <%--suppress HtmlDeprecatedAttribute --%>
                <td width="30%">个人主页</td>
                <td>${userResume.home_page}</td>
            </tr>
            <tr>
                <td>期望职位</td>
                <td>${userResume.except_position}</td>
            </tr>
            <tr>
                <td>期望工资</td>
                <td>${userResume.except_wage}</td>
            </tr>
            <tr>
                <td>期望城市</td>
                <td>${userResume.except_city}</td>
            </tr>
            <tr>
                <td>自我评价</td>
                <td>${userResume.self_evaluation}</td>
            </tr>
            <tr>
                <td>工作经历</td>
                <td>${userResume.work_experience}</td>
            </tr>
            <tr>
                <td>项目经历</td>
                <td>${userResume.project_experience}</td>
            </tr>
        </table>
        <%--岗位信息--%>
        <div class="alert alert-primary text-center" role="alert">岗位信息</div>
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
            <tr>
                <td>状态</td>
                <td>${position.status}</td>
            </tr>
        </table>
        <div class="row">
            <div class="col-md-3 mx-auto mt-3">
                <button class="btn btn-lg btn-outline-success btn-block" name="status" value="已同意" type="submit">
                    同意
                </button>
            </div>
            <div class="col-md-3 mx-auto mt-3">
                <button class="btn btn-lg btn-outline-danger btn-block" name="status" value="已拒绝" type="submit">
                    拒绝
                </button>
            </div>
        </div>
    </form>
    <p class="mt-5 mb-3 text-muted text-center">&copy; 2020-2021 Power by ChenXinze</p>
</div>

<!-- 加入/解除黑名单弹窗 -->
<div class="modal fade" id="alert-complaint" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    <c:if test="${entBlackList == null}">
                        加入黑名单
                    </c:if>
                    <c:if test="${entBlackList != null}">
                        移出黑名单
                    </c:if>
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <c:if test="${entBlackList == null}">
                    确认将该用户加入黑名单吗？该用户对贵公司的所有应聘记录都会被清除，且无法再次应聘贵公司的岗位，直到您解除其黑名单
                </c:if>
                <c:if test="${entBlackList != null}">
                    确认讲该用户从黑名单中移除吗？
                </c:if>
            </div>
            <div class="modal-footer">
                <form action="${pageContext.request.contextPath}/ent/editBlackList" method="post">
                    <label class="sr-only">
                        <input name="user_id" value="${userInfo.user_id}" hidden>
                        <input name="tab" value="${from}" hidden>
                        <input name="black_list_id"
                        <c:if test="${entBlackList == null}"> value="-1"</c:if>
                        <c:if test="${entBlackList != null}">
                               value="${entBlackList.black_list_id}"</c:if> hidden>
                    </label>
                    <c:if test="${entBlackList == null}">
                        <button type="submit" class="btn btn-outline-danger">确认</button>
                    </c:if>
                    <c:if test="${entBlackList != null}">
                        <button type="submit" class="btn btn-outline-success">确认</button>
                    </c:if>
                </form>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>