<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <title>个人用户主页</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <!-- Bootstrap core js -->
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
<!-- 页面顶栏 -->
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
    <h5 class="my-0 mr-md-auto font-weight-normal">人才招聘网 <span class="badge badge-success">个人版</span></h5>
    <!-- 选项卡 -->
    <ul class="nav nav-pills mr-2">
        <li class="nav-item">
            <a class="nav-link" id="info-tab" data-toggle="tab"
               <c:if test="${account.access_basic_information == false}">href="#access_limit"</c:if>
               <c:if test="${account.access_basic_information == true}">href="#info"</c:if>>基本信息</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="resume-tab" data-toggle="tab"
               <c:if test="${account.access_resume == false}">href="#access_limit"</c:if>
               <c:if test="${account.access_resume == true}">href="#resume"</c:if>>简历</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="recruit-tab" data-toggle="tab"
               <c:if test="${account.access_apply == false}">href="#access_limit"</c:if>
               <c:if test="${account.access_apply == true}">href="#recruit"</c:if>>应聘</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="apply-tab" data-toggle="tab"
               <c:if test="${account.access_apply_record == false}">href="#access_limit"</c:if>
               <c:if test="${account.access_apply_record == true}">href="#apply"</c:if>>求职记录管理</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="complaint-tab" data-toggle="tab"
               <c:if test="${account.access_complaint == false}">href="#access_limit"</c:if>
               <c:if test="${account.access_complaint == true}">href="#complaint"</c:if>>岗位投诉管理</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="account-tab" data-toggle="tab"
               <c:if test="${account.access_edit_password == false}">href="#access_limit"</c:if>
               <c:if test="${account.access_edit_password == true}">href="#account"</c:if>>账号设置</a>
        </li>
    </ul>
    <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/user/logout">退出登录</a>
</div>
<!-- 页面内容 -->
<div class="container my-5">
    <div class="tab-content">
        <!-- 基本信息 -->
        <c:if test="${account.access_basic_information == true}">
            <div class="tab-pane fade" id="info">
                <table class="table table-striped table-bordered text-center ">
                    <tr>
                            <%--suppress HtmlDeprecatedAttribute --%>
                        <td width="30%">姓名</td>
                        <td>${info.name}</td>
                    </tr>
                    <tr>
                        <td>性别</td>
                        <td>${info.sex}</td>
                    </tr>
                    <tr>
                        <td>年龄</td>
                        <td>${info.age}</td>
                    </tr>
                    <tr>
                        <td>所在城市</td>
                        <td>${info.city}</td>
                    </tr>
                    <tr>
                        <td>联系邮箱</td>
                        <td>${info.email}</td>
                    </tr>
                </table>
                <div class="row">
                    <div class="col-md-3 mx-auto mt-3">
                        <button class="btn btn-lg btn-primary btn-block"
                                onclick="window.location.href='${pageContext.request.contextPath}/user/editInfoPage'">
                            <c:if test="${info == null}">添加</c:if>
                            <c:if test="${info != null}">修改</c:if>
                        </button>
                    </div>
                </div>
            </div>
        </c:if>

        <!-- 简历 -->
        <c:if test="${account.access_resume == true}">
            <div class="tab-pane fade" id="resume">
                <table class="table table-striped table-bordered text-center">
                    <tr>
                            <%--suppress HtmlDeprecatedAttribute --%>
                        <td width="30%">个人主页</td>
                        <td>${resume.home_page}</td>
                    </tr>
                    <tr>
                        <td>期望职位</td>
                        <td>${resume.except_position}</td>
                    </tr>
                    <tr>
                        <td>期望工资</td>
                        <td>${resume.except_wage}</td>
                    </tr>
                    <tr>
                        <td>期望城市</td>
                        <td>${resume.except_city}</td>
                    </tr>
                    <tr>
                        <td>自我评价</td>
                        <td>${resume.self_evaluation}</td>
                    </tr>
                    <tr>
                        <td>工作经历</td>
                        <td>${resume.work_experience}</td>
                    </tr>
                    <tr>
                        <td>项目经历</td>
                        <td>${resume.project_experience}</td>
                    </tr>
                </table>
                <div class="row">
                    <div class="col-md-3 mx-auto mt-3">
                        <button class="btn btn-lg btn-primary btn-block" type="button"
                                onclick="window.location.href='${pageContext.request.contextPath}/user/editResumePage'">
                            <c:if test="${resume == null}">添加</c:if>
                            <c:if test="${resume != null}">修改</c:if>
                        </button>
                    </div>
                </div>
            </div>
        </c:if>

        <!-- 应聘 -->
        <c:if test="${account.access_apply == true}">
            <div class="tab-pane fade" id="recruit">
                <div class="my-3 p-3 bg-white rounded shadow-sm">
                    <div class="media pt-3">
                        <div class="media-body pb-3 mb-0 lh-125 border-bottom border-gray">
                            <div class="d-flex justify-content-between align-items-center w-100">
                                <h4>岗位列表</h4>
                                <button class="btn btn-outline-primary"
                                        onclick="window.location.href='${pageContext.request.contextPath}/user/mainPage?tab=recruit'">
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
                    <!-- 岗位列表不显示被用户应聘的、被用户投诉的、用管理员屏蔽的、被公司关闭 -->
                    <c:forEach var="item" items="${positionFulls}">
                        <%--   只显示处于发布状态的   --%>
                        <c:if test="${item.positionStatus.equals('发布')}">
                            <!-- 不显示被当前用户投诉的的岗位(投诉状态为空) -->
                            <c:if test="${empty item.complaintStatus}">
                                <!-- 不显示被当前用户应聘的的岗位(应聘状态为空) -->
                                <c:if test="${empty item.applyStatus}">
                                    <div class="media text-muted pt-3">
                                        <div class="media-body pb-3 mb-0 lh-125 border-bottom border-gray">
                                            <div class="d-flex justify-content-between align-items-center w-100">
                                                <strong class="text-gray-dark">
                                                        ${item.positionName}| ${item.entName}
                                                </strong>
                                                <input type="button" class="btn btn-outline-primary d-block" value="查看"
                                                       onclick="window.location.href='${pageContext.request.contextPath}/user/editApplyPage?positionId=${item.positionId}&from=recruit'"/>
                                            </div>
                                            <span class="d-block">${item.description}/${item.wage}/${item.address}</span>
                                        </div>
                                    </div>
                                </c:if>
                            </c:if>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </c:if>

        <!-- 求职记录管理 -->
        <c:if test="${account.access_apply_record == true}">
            <div class="tab-pane fade" id="apply">
                <div class="my-3 p-3 bg-white rounded shadow-sm">
                    <div class="media pt-3">
                        <div class="media-body pb-3 mb-0 lh-125 border-bottom border-gray">
                            <div class="d-flex justify-content-between align-items-center w-100">
                                <h4>求职记录</h4>
                                <button class="btn btn-outline-primary"
                                        onclick="window.location.href='${pageContext.request.contextPath}/user/mainPage?tab=apply'">
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
                    <!-- 求职记录列表不显示被用户投诉的、用管理员屏蔽的、被公司关闭 -->
                    <c:forEach var="item" items="${positionFulls}">
                        <%--   只显示处于发布状态的   --%>
                        <c:if test="${item.positionStatus.equals('发布')}">
                            <%-- 只显示当前处于应聘状态的 --%>
                            <c:if test="${not empty item.applyStatus}">
                                <%--  不显示被当前用户投诉的的岗位(投诉状态为空)  --%>
                                <c:if test="${empty item.complaintStatus}">
                                    <div class="media text-muted pt-3">
                                        <div class="media-body pb-3 mb-0 lh-125 border-bottom border-gray">
                                            <div class="d-flex justify-content-between align-items-center w-100">
                                                <strong class="text-gray-dark">${item.positionName}| ${item.entName}
                                                    <c:choose>
                                                        <c:when test="${item.applyStatus.equals('已同意')}">
                                                            <span class="badge badge-success">已同意</span>
                                                        </c:when>
                                                        <c:when test="${item.applyStatus.equals('已拒绝')}">
                                                            <span class="badge badge-danger">已拒绝</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="badge badge-secondary">未回复</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </strong>
                                                <input type="button" class="btn btn-outline-primary d-block" value="查看"
                                                       onclick="window.location.href='${pageContext.request.contextPath}/user/editApplyPage?position_id=${item.positionId}&from=apply'"/>
                                            </div>
                                            <span class="d-block">${item.description}/${item.wage}/${item.address}</span>
                                        </div>
                                    </div>
                                </c:if>
                            </c:if>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </c:if>

        <!-- 岗位投诉管理 -->
        <c:if test="${account.access_complaint == true}">
            <div class="tab-pane fade" id="complaint">
                <div class="my-3 p-3 bg-white rounded shadow-sm">
                    <div class="media pt-3">
                        <div class="media-body pb-3 mb-0 lh-125 border-bottom border-gray">
                            <div class="d-flex justify-content-between align-items-center w-100">
                                <h4>投诉记录</h4>
                                <button class="btn btn-outline-primary"
                                        onclick="window.location.href='${pageContext.request.contextPath}/user/mainPage?tab=complaint'">
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
                    <c:forEach var="item" items="${positionFulls}">
                        <!-- 投诉记录列表只显示处于投诉状态的(投诉状态不为null) -->
                        <c:if test="${not empty item.complaintStatus}">
                            <div class="media text-muted pt-3">
                                <div class="media-body pb-3 mb-0 lh-125 border-bottom border-gray">
                                    <div class="d-flex justify-content-between align-items-center w-100">
                                        <strong class="text-gray-dark">${item.positionName}| ${item.entName}
                                            <c:choose>
                                                <c:when test="${item.complaintStatus.equals('投诉成功')}">
                                                    <span class="badge badge-success">投诉成功</span>
                                                </c:when>
                                                <c:when test="${item.complaintStatus.equals('投诉失败')}">
                                                    <span class="badge badge-danger">投诉失败</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge badge-secondary">未处理</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </strong>
                                        <input type="button" class="btn btn-outline-primary d-block" value="查看"
                                               onclick="window.location.href='${pageContext.request.contextPath}/user/editApplyPage?position_id=${item.positionId}&from=complaint'"/>
                                    </div>
                                    <span class="d-block">${item.description}/${item.wage}/${item.address}</span>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </c:if>

        <!-- 账号设置 -->
        <c:if test="${account.access_edit_password == true}">
            <div class="tab-pane fade" id="account">
                <form action="${pageContext.request.contextPath}/user/editPassword" method="post">
                    <div class="form-group form-inline justify-content-center my-4">
                        <label for="old_password">请输入旧密码：</label>
                        <input type="password" name="old_password" class="form-control col-md-4" id="old_password"
                               placeholder="旧密码" required>
                    </div>
                    <div class="form-group form-inline justify-content-center my-4">
                        <label for="new_password">请输入新密码：</label>
                        <input type="password" name="new_password" class="form-control col-md-4" id="new_password"
                               placeholder="新密码" required>
                    </div>
                    <div class="form-group form-inline justify-content-center my-4">
                        <label for="confirm_password">请确认新密码：</label>
                        <input type="password" name="confirm_password" class="form-control col-md-4"
                               id="confirm_password"
                               placeholder="确认密码" required>
                    </div>
                    <div class="row">
                        <div class="col-md-3 mx-auto mt-3">
                            <button class="btn btn-lg btn-primary btn-block" type="submit">提交修改</button>
                        </div>
                    </div>
                </form>
            </div>
        </c:if>

        <%-- 权限受限页面 --%>
        <div class="tab-pane fade" id="access_limit">
            <div class="jumbotron">
                <div class="d-flex justify-content-between align-items-center w-100">
                    <h1 class="display-3">访问权限不足！</h1>
                    <button class="btn btn-outline-primary"
                            onclick="window.location.href='${pageContext.request.contextPath}/user/mainPage'">
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
                <p class="lead">由于某些原因，你已被禁止使用该功能。请联系管理员以解除权限禁用</p>
                <hr class="my-4">
            </div>
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
<!-- 弹窗控制 -->
<c:if test="${requestScope.title != null}">
    <script type="text/javascript">
        $('#alert-windows').modal('show');
    </script>
</c:if>
<!-- tab设置 -->
<c:if test="${requestScope.tab == null}">
    <script>
        $('#info-tab').tab('show');
    </script>
</c:if>
<c:if test="${requestScope.tab != null}">
    <script>
        $('#${requestScope.tab}-tab').tab('show');
    </script>
</c:if>
</html>
