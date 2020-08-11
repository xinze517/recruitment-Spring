<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <title>管理员首页</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
          crossorigin="anonymous">
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
<body>
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
    <h5 class="my-0 mr-md-auto font-weight-normal">人才招聘网 <span class="badge badge-success">管理员</span></h5>
    <!-- 选项卡 -->
    <ul class="nav nav-pills mr-2">
        <li class="nav-item">
            <a class="nav-link" id="ent-manage-tab" data-toggle="tab" href="#ent-manage">企业管理</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="user-manage-tab" data-toggle="tab" href="#user-manage">个人管理</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="position-manage-tab" data-toggle="tab" href="#position-manage">岗位管理</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="complaint-manage-tab" data-toggle="tab" href="#complaint-manage">投诉管理</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="account-tab" data-toggle="tab" href="#account">账号设置</a>
        </li>
    </ul>
    <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/admin/logout">退出登录</a>
</div>
<div class="container my-5">
    <div class="tab-content">
        <!-- 企业管理 -->
        <div class="tab-pane fade" id="ent-manage">
            <div class="my-3 p-3 bg-white rounded shadow-sm">
                <div class="media  pt-3">
                    <div class="media-body pb-3 mb-0 lh-125 border-bottom border-gray">
                        <div class="d-flex justify-content-between align-items-center w-100">
                            <h4>企业会员名单</h4>
                            <button class="btn btn-outline-primary"
                                    onclick="window.location.href='${pageContext.request.contextPath}/admin/mainPage?tab=ent-manage'">
                                <svg class="bi bi-arrow-clockwise" width="1em" height="1em" viewBox="0 0 16 16"
                                     fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                          d="M3.17 6.706a5 5 0 0 1 7.103-3.16.5.5 0 1 0 .454-.892A6 6 0 1 0 13.455 5.5a.5.5 0 0 0-.91.417 5 5 0 1 1-9.375.789z"></path>
                                    <path fill-rule="evenodd"
                                          d="M8.147.146a.5.5 0 0 1 .707 0l2.5 2.5a.5.5 0 0 1 0 .708l-2.5 2.5a.5.5 0 1 1-.707-.708L10.293 3 8.147.854a.5.5 0 0 1 0-.708z"></path>
                                </svg>
                                刷新
                            </button>
                        </div>
                    </div>
                </div>
                <c:forEach items="${entInfos}" var="info">
                    <div class="media text-muted pt-3">
                        <div class="media-body pb-3 mb-0 lh-125 border-bottom border-gray">
                            <div class="d-flex justify-content-between align-items-center w-100">
                                <strong class="text-gray-dark">${info.name}
                                    <c:choose>
                                        <c:when test="${entStatusMap[info.ent_id].equals('未审核')}">
                                            <span class="badge badge-primary">待审核</span></c:when>
                                        <c:when test="${entStatusMap[info.ent_id].equals('审核通过')}">
                                            <span class="badge badge-success">审核通过</span></c:when>
                                        <c:otherwise>
                                            <span class="badge badge-danger">审核不通过</span>
                                        </c:otherwise>
                                    </c:choose>
                                </strong>
                                <input type="button" class="btn btn-outline-primary d-block" value="查看"
                                       onclick="window.location.href='${pageContext.request.contextPath}/admin/entManagePage?entId=${info.ent_id}'"/>
                            </div>
                            <span class="d-block">${info.legal_representative} | <fmt:formatDate value="${info.established_date}" pattern="yyyy-MM-dd"/> 创办 | ${info.email}</span>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!-- 个人管理 -->
        <div class="tab-pane fade" id="user-manage">
            <div class="my-3 p-3 bg-white rounded shadow-sm">
                <div class="media  pt-3">
                    <div class="media-body pb-3 mb-0 lh-125 border-bottom border-gray">
                        <div class="d-flex justify-content-between align-items-center w-100">
                            <h4>个人用户名单</h4>
                            <button class="btn btn-outline-primary"
                                    onclick="window.location.href='${pageContext.request.contextPath}/admin/mainPage?tab=user-manage'">
                                <svg class="bi bi-arrow-clockwise" width="1em" height="1em" viewBox="0 0 16 16"
                                     fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                          d="M3.17 6.706a5 5 0 0 1 7.103-3.16.5.5 0 1 0 .454-.892A6 6 0 1 0 13.455 5.5a.5.5 0 0 0-.91.417 5 5 0 1 1-9.375.789z"></path>
                                    <path fill-rule="evenodd"
                                          d="M8.147.146a.5.5 0 0 1 .707 0l2.5 2.5a.5.5 0 0 1 0 .708l-2.5 2.5a.5.5 0 1 1-.707-.708L10.293 3 8.147.854a.5.5 0 0 1 0-.708z"></path>
                                </svg>
                                刷新
                            </button>
                        </div>
                    </div>
                </div>
                <c:forEach items="${userInfos}" var="item">
                    <div class="media text-muted pt-3">
                        <div class="media-body pb-3 mb-0 lh-125 border-bottom border-gray">
                            <div class="d-flex justify-content-between align-items-center w-100">
                                <strong class="text-gray-dark">${item.name} | ${item.email}</strong>
                                <input type="button" class="btn btn-outline-primary d-block" value="管理"
                                       onclick="window.location.href='${pageContext.request.contextPath}/admin/editUserAccessPage?userId=${item.user_id}'"/>
                            </div>
                            <span class="d-block">${item.sex} | ${item.city}</span>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!-- 岗位管理 -->
        <div class="tab-pane fade" id="position-manage">
            <div class="my-3 p-3 bg-white rounded shadow-sm">
                <div class="media  pt-3">
                    <div class="media-body pb-3 mb-0 lh-125 border-bottom border-gray">
                        <div class="d-flex justify-content-between align-items-center w-100">
                            <h4>岗位列表</h4>
                            <button class="btn btn-outline-primary"
                                    onclick="window.location.href='${pageContext.request.contextPath}/admin/mainPage?tab=position-manage'">
                                <svg class="bi bi-arrow-clockwise" width="1em" height="1em" viewBox="0 0 16 16"
                                     fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                          d="M3.17 6.706a5 5 0 0 1 7.103-3.16.5.5 0 1 0 .454-.892A6 6 0 1 0 13.455 5.5a.5.5 0 0 0-.91.417 5 5 0 1 1-9.375.789z"></path>
                                    <path fill-rule="evenodd"
                                          d="M8.147.146a.5.5 0 0 1 .707 0l2.5 2.5a.5.5 0 0 1 0 .708l-2.5 2.5a.5.5 0 1 1-.707-.708L10.293 3 8.147.854a.5.5 0 0 1 0-.708z"></path>
                                </svg>
                                刷新
                            </button>
                        </div>
                    </div>
                </div>
                <c:forEach items="${positionList}" var="position_item">
                    <div class="media text-muted pt-3">
                        <div class="media-body pb-3 mb-0 lh-125 border-bottom border-gray">
                            <div class="d-flex justify-content-between align-items-center w-100">
                                <strong class="text-gray-dark">${position_item.name}
                                    <c:if test="${position_item.status.equals('发布')}">
                                        <span class="badge badge-success">已发布</span>
                                    </c:if>
                                    <c:if test="${position_item.status.equals('关闭')}">
                                        <span class="badge badge-secondary">已关闭</span>
                                    </c:if>
                                    <c:if test="${position_item.status.equals('屏蔽')}">
                                        <span class="badge badge-danger">已屏蔽</span>
                                    </c:if>
                                </strong>
                                <input type="button" class="btn btn-outline-primary d-block"
                                       onclick="window.location.href='${pageContext.request.contextPath}/admin/editPositionPage?positionId=${position_item.position_id}'"
                                       value="管理"/>
                            </div>
                            <span class="d-block">${position_item.description}/${position_item.wage}/${position_item.address}</span>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!-- 投诉管理 -->
        <div class="tab-pane fade" id="complaint-manage">
            <div class="my-3 p-3 bg-white rounded shadow-sm">
                <div class="media  pt-3">
                    <div class="media-body pb-3 mb-0 lh-125 border-bottom border-gray">
                        <div class="d-flex justify-content-between align-items-center w-100">
                            <h4>投诉记录列表</h4>
                            <button class="btn btn-outline-primary"
                                    onclick="window.location.href='${pageContext.request.contextPath}/admin/mainPage?tab=complaint-manage'">
                                <svg class="bi bi-arrow-clockwise" width="1em" height="1em" viewBox="0 0 16 16"
                                     fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                          d="M3.17 6.706a5 5 0 0 1 7.103-3.16.5.5 0 1 0 .454-.892A6 6 0 1 0 13.455 5.5a.5.5 0 0 0-.91.417 5 5 0 1 1-9.375.789z"></path>
                                    <path fill-rule="evenodd"
                                          d="M8.147.146a.5.5 0 0 1 .707 0l2.5 2.5a.5.5 0 0 1 0 .708l-2.5 2.5a.5.5 0 1 1-.707-.708L10.293 3 8.147.854a.5.5 0 0 1 0-.708z"></path>
                                </svg>
                                刷新
                            </button>
                        </div>
                    </div>
                </div>
                <c:forEach items="${complaintList}" var="item">
                    <div class="media text-muted pt-3">
                        <div class="media-body pb-3 mb-0 lh-125 border-bottom border-gray">
                            <div class="d-flex justify-content-between align-items-center w-100">
                                <strong class="text-gray-dark">
                                    岗位：${positionNameMap[item.position_id]} |
                                    投诉者：${userNameMap[item.user_id]}
                                    <c:if test="${item.status.equals('未处理')}"><span
                                            class="badge badge-secondary">未处理</span></c:if>
                                    <c:if test="${item.status.equals('投诉成功')}"><span
                                            class="badge badge-success">投诉成功</span></c:if>
                                    <c:if test="${item.status.equals('投诉失败')}"><span
                                            class="badge badge-danger">投诉失败</span></c:if>
                                </strong>
                                <input type="button" class="btn btn-outline-primary d-block" value="处理"
                                       onclick="window.location.href='${pageContext.request.contextPath}/admin/editComplaintPage?complaintRecordId=${item.record_id}'">
                            </div>
                            <span class="d-block">岗位所属公司：${entNameMap[item.ent_id]}</span>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!-- 账号设置 -->
        <div class="tab-pane fade" id="account">
            <form action="${pageContext.request.contextPath}/admin/editPassword" method="post">
                <div class="form-group form-inline justify-content-center my-4">
                    <label for="old_password">请输入旧密码：</label>
                    <input type="password" name="old_password" class="form-control col-md-4" id="old_password"
                           placeholder="旧密码">
                </div>
                <div class="form-group form-inline justify-content-center my-4">
                    <label for="new_password">请输入新密码：</label>
                    <input type="password" name="new_password" class="form-control col-md-4" id="new_password"
                           placeholder="新密码">
                </div>
                <div class="form-group form-inline justify-content-center my-4">
                    <label for="confirm_password">请确认新密码：</label>
                    <input type="password" name="confirm_password" class="form-control col-md-4"
                           id="confirm_password"
                           placeholder="确认密码">
                </div>
                <div class="row">
                    <div class="col-md-3 mx-auto mt-3">
                        <button class="btn btn-lg btn-primary btn-block" type="submit">提交修改</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- 信息提示框 -->
<div class="modal fade" id="alert-windows" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">${requestScope.title}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                ${requestScope.body}
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

</body>
<%-- 弹窗检查 --%>
<c:if test="${requestScope.title != null}">
    <script type="text/javascript">
        $('#alert-windows').modal('show');
    </script>
</c:if>
<%-- 设置tab --%>
<c:if test="${requestScope.tab == null}">
    <script>
        $('#ent-manage-tab').tab('show');
    </script>
</c:if>
<c:if test="${requestScope.tab != null}">
    <script>
        $('#${requestScope.tab}-tab').tab('show');
    </script>
</c:if>
</html>
