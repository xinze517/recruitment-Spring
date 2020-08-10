<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <title>岗位信息</title>
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
    <c:if test="${complaint == null}">
        <a class="btn btn-outline-danger mr-3" href="#" data-toggle="modal" data-target="#alert-complaint">投诉岗位</a>
    </c:if>
    <c:if test="${complaint != null}">
        <c:if test="${complaint.status.equals('投诉成功')}">
            <a class="btn btn-outline-success mr-3 disabled" href="#" data-toggle="modal"
               data-target="#alert-complaint">取消投诉</a>
        </c:if>
        <c:if test="${!complaint.status.equals('投诉成功')}">
            <a class="btn btn-outline-success mr-3" href="#" data-toggle="modal" data-target="#alert-complaint">取消投诉</a>
        </c:if>
    </c:if>
    <a class="btn btn-outline-primary"
            <c:choose>
                <c:when test="${from.equals('recruit')}">href="${pageContext.request.contextPath}/user/mainPage?tab=recruit"</c:when>
                <c:when test="${from.equals('complaint')}">href="${pageContext.request.contextPath}/user/mainPage?tab=complaint"</c:when>
                <c:otherwise>href="${pageContext.request.contextPath}/user/mainPage?tab=apply"</c:otherwise>
            </c:choose>>返回主页</a>
</div>
<div class="container my-5">
    <form action="${pageContext.request.contextPath}/user/editRecordApply" method="post">
        <label>
            <input name="tab" value="${from}" hidden>
        </label>
        <c:if test="${complaint != null}">
            <c:choose>
                <c:when test="${complaint.status.equals('投诉成功')}">
                    <div class="alert alert-success text-center" role="alert">
                        <h4 class="alert-heading">岗位投诉成功</h4>
                        <p>投诉已经被管理员确定为有效，相关岗位已经被屏蔽，投诉状态已锁定！</p>
                    </div>
                </c:when>
                <c:when test="${complaint.status.equals('投诉失败')}">
                    <div class="alert alert-danger text-center" role="alert">
                        <h4 class="alert-heading">岗位投诉失败</h4>
                        <p>您的投诉已经被管理员确定为无效，投诉状态保持原样，你也可以取消投诉</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="alert alert-warning text-center" role="alert">
                        <h4 class="alert-heading mt-3">岗位投诉中</h4>
                        <p>
                            管理员尚未处理你的投诉请求，请耐心等待，你也可以随时取消投诉；<br>
                            请注意，在投诉期间，你无法应聘该岗位
                        </p>

                    </div>
                </c:otherwise>
            </c:choose>
            <hr class="my-4">
        </c:if>
        <%--    必需的参数    --%>
        <label class="sr-only">
            <input name="record_apply_id" value="${applyRecordId}" hidden>
        </label>
        <label class="sr-only">
            <input name="ent_id" value="${entInfo.ent_id}" hidden>
        </label>
        <label class="sr-only">
            <input name="position_id" value="${position.position_id}" hidden>
        </label>

        <div class="alert alert-primary text-center" role="alert">
            企业信息列表
        </div>
        <table class="table table-striped table-bordered text-center ">
            <tr>
                <%--suppress HtmlDeprecatedAttribute --%>
                <td width="30%">公司全称</td>
                <td>${entInfo.name}</td>
            </tr>
            <tr>
                <td>公司介绍</td>
                <td>${entInfo.introduction}</td>
            </tr>
            <tr>
                <td>公司主页</td>
                <td>${entInfo.home_page}</td>
            </tr>
            <tr>
                <td>接收简历邮箱</td>
                <td>${entInfo.email}</td>
            </tr>
        </table>
        <div class="alert alert-primary text-center" role="alert">
            岗位信息列表
        </div>
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
            <%--      如果存在投诉记录，则不显示按钮      --%>
            <c:if test="${complaint == null}">
                <div class="col-md-3 mx-auto mt-3">
                    <c:if test="${applyRecordId == -1}">
                        <button class="btn btn-lg btn-outline-primary btn-block" type="submit">投放简历</button>
                    </c:if>
                    <c:if test="${applyRecordId != -1}">
                        <button class="btn btn-lg btn-outline-danger btn-block" type="submit">取消简历投放</button>
                    </c:if>
                </div>
            </c:if>
        </div>
        <p class="mt-5 mb-3 text-muted text-center">&copy; 2020-2021 Power by ChenXinze</p>
    </form>
</div>
<!-- 投诉岗位弹窗 -->
<div class="modal fade" id="alert-complaint" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    <c:if test="${complaint == null}">
                        投诉岗位
                    </c:if>
                    <c:if test="${complaint != null}">
                        取消投诉岗位
                    </c:if>
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <c:if test="${complaint == null}">
                    确认投诉这个岗位吗？请注意如果你已经向这个岗位投出了简历，则该记录将会自动隐藏；在投诉取消前，你无法更改该岗位的应聘状态
                </c:if>
                <c:if test="${complaint != null}">
                    确认取消投诉这个岗位吗？
                </c:if>
            </div>
            <div class="modal-footer">
                <form action="${pageContext.request.contextPath}/user/editRecordComplaint" method="post">
                    <label class="sr-only">
                        <input name="ent_id" value="${position.ent_id}" hidden>
                        <input name="position_id" value="${position.position_id}" hidden>
                        <input name="tab" value="${from}" hidden>
                        <input name="complaintRecordId"
                        <c:if test="${complaint == null}"> value="-1"</c:if>
                        <c:if test="${complaint != null}">
                               value="${complaint.record_id}"</c:if> hidden>
                    </label>
                    <c:if test="${complaint == null}">
                        <button type="submit" class="btn btn-outline-danger">确认</button>
                    </c:if>
                    <c:if test="${complaint != null}">
                        <button type="submit" class="btn btn-outline-success">确认</button>
                    </c:if>
                </form>
                <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>