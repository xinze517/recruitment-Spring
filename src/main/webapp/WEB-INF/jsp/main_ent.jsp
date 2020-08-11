<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <title>企业用户首页</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
          crossorigin="anonymous">
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
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
    <h5 class="my-0 mr-md-auto font-weight-normal">人才招聘网 <span class="badge badge-success">企业版</span></h5>
    <!-- 选项卡 -->
    <ul class="nav nav-pills mr-2">
        <li class="nav-item">
            <a class="nav-link" id="info-tab" data-toggle="tab" href="#info">注册信息</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="position-tab" data-toggle="tab"
               <c:if test="${!requestScope.entAccount.status.equals('审核通过')}">href="#access_limit"</c:if>
               <c:if test="${requestScope.entAccount.status.equals('审核通过')}">href="#position"</c:if>>岗位信息管理</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="apply-tab" data-toggle="tab"
               <c:if test="${!requestScope.entAccount.status.equals('审核通过')}">href="#access_limit"</c:if>
               <c:if test="${requestScope.entAccount.status.equals('审核通过')}">href="#apply"</c:if>>求职信息查询</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="black-list-tab" data-toggle="tab"
               <c:if test="${!requestScope.entAccount.status.equals('审核通过')}">href="#access_limit"</c:if>
               <c:if test="${requestScope.entAccount.status.equals('审核通过')}">href="#black-list"</c:if>>黑名单管理</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="account-tab" data-toggle="tab" href="#account">账号设置</a>
        </li>
    </ul>
    <a class="btn btn-outline-primary" href="logout.entDo">退出登录</a>
</div>
<div class="container my-5">
    <div class="tab-content">
        <!-- 注册信息 -->
        <div class="tab-pane fade" id="info">
            <%-- 资质显示  --%>
            <c:choose>
                <c:when test="${requestScope.entAccount.status.equals('审核通过')}">
                    <div class="alert alert-success" role="alert">
                        <div class="d-flex justify-content-between align-items-center w-100">
                            <h3 class="alert-heading">企业资质</h3>
                            <button class="btn btn-outline-primary"
                                    onclick="window.location.href='mainPage.entDo'">
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
                        <p>您的企业资质已经审核通过，您现在可以正常使用招聘相关的功能</p>
                    </div>
                </c:when>

                <c:when test="${requestScope.entAccount.status.equals('未审核')}">
                    <div class="alert alert-warning" role="alert">
                        <div class="d-flex justify-content-between align-items-center w-100">
                            <h3 class="alert-heading">企业资质</h3>
                            <button class="btn btn-outline-primary"
                                    onclick="window.location.href='mainPage.entDo'">
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
                        <p>您的企业资质尚未审核，请等待管理员审核。在您企业资质审核通过前，您无法使用招聘相关的功能</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="alert alert-danger" role="alert">
                        <div class="d-flex justify-content-between align-items-center w-100">
                            <h3 class="alert-heading">企业资质</h3>
                            <button class="btn btn-outline-primary"
                                    onclick="window.location.href='mainPage.entDo'">
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
                        <p>您的企业资质审核没有通过，请修改您的注册信息以重新申请审核。在您企业资质审核通过前，您无法使用招聘相关的功能</p>
                    </div>
                </c:otherwise>
            </c:choose>
            <hr class="my-4">

            <table class="table table-striped table-bordered text-center ">
                <tr>
                    <td width="30%">法人代表</td>
                    <td>${requestScope.entInfo.legal_representative}</td>
                </tr>
                <tr>
                    <td>成立时间</td>
                    <td>${requestScope.entInfo.established_date}</td>
                </tr>
                <tr>
                    <td>接收简历邮箱</td>
                    <td>${requestScope.entInfo.email}</td>
                </tr>
                <tr>
                    <td>公司全称</td>
                    <td>${requestScope.entInfo.name}</td>
                </tr>
                <tr>
                    <td>公司主页</td>
                    <td>${requestScope.entInfo.home_page}</td>
                </tr>
                <tr>
                    <td>公司介绍</td>
                    <td>${requestScope.entInfo.introduction}</td>
                </tr>
            </table>
            <div class="row">
                <div class="col-md-3 mx-auto mt-3">
                    <button class="btn btn-lg btn-primary btn-block" type="button"
                            onclick="window.location.href='editInfoPage.entDo'">
                        <c:if test="${requestScope.entInfo == null}">添加</c:if>
                        <c:if test="${requestScope.entInfo != null}">修改</c:if>
                    </button>
                </div>
            </div>
        </div>

        <!-- 岗位信息管理 -->
        <c:if test="${requestScope.entAccount.status.equals('审核通过')}">
            <div class="tab-pane fade" id="position">
                <div class="my-3 p-3 bg-white rounded shadow-sm">
                    <div class="media  pt-3">
                        <div class="media-body pb-3 mb-0 lh-125 border-bottom border-gray">
                            <div class="d-flex justify-content-between align-items-center w-100">
                                <h4>岗位列表</h4>
                                <div class="d-flex">
                                    <button class="btn btn-outline-primary mr-3"
                                            onclick="window.location.href='mainPage.entDo?tab=position'">
                                        <svg class="bi bi-arrow-clockwise" width="1em" height="1em" viewBox="0 0 16 16"
                                             fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd"
                                                  d="M3.17 6.706a5 5 0 0 1 7.103-3.16.5.5 0 1 0 .454-.892A6 6 0 1 0 13.455 5.5a.5.5 0 0 0-.91.417 5 5 0 1 1-9.375.789z"></path>
                                            <path fill-rule="evenodd"
                                                  d="M8.147.146a.5.5 0 0 1 .707 0l2.5 2.5a.5.5 0 0 1 0 .708l-2.5 2.5a.5.5 0 1 1-.707-.708L10.293 3 8.147.854a.5.5 0 0 1 0-.708z"></path>
                                        </svg>
                                        刷新
                                    </button>
                                    <input type="button" class="btn btn-outline-primary d-block"
                                           onclick="window.location.href='editPositionPage.entDo?position_id=-1'"
                                           value="添加"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 循环列出岗位信息 -->
                    <c:forEach var="position_item" items="${requestScope.entPositions}">
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
                                           onclick="window.location.href='editPositionPage.entDo?position_id=${position_item.position_id}'"
                                           value="管理"/>
                                </div>
                                <span class="d-block">
                                    ${position_item.description}/${position_item.wage}/${position_item.address}
                            </span>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:if>

        <!-- 求职信息查询 -->
        <c:if test="${requestScope.entAccount.status.equals('审核通过')}">
            <div class="tab-pane fade" id="apply">
                <div class="my-3 p-3 bg-white rounded shadow-sm">
                    <div class="media  pt-3">
                        <div class="media-body pb-3 mb-0 lh-125 border-bottom border-gray">
                            <div class="d-flex justify-content-between align-items-center w-100">
                                <h4>求职列表</h4>
                                <button class="btn btn-outline-primary"
                                        onclick="window.location.href='mainPage.entDo?tab=apply'">
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
                        <%-- 开始制作求职列表(排除黑名单) --%>
                    <c:forEach items="${requestScope.applyList}" var="item">
                        <c:if test="${requestScope.isInBlackList[item.user_id] == false}">
                            <div class="media text-muted pt-3">
                                <div class="media-body pb-3 mb-0 lh-125 border-bottom border-gray">
                                    <div class="d-flex justify-content-between align-items-center w-100">
                                        <strong class="text-gray-dark">${requestScope.userInfoMap[item.user_id].name} -
                                            应聘${requestScope.positionNameMap[item.position_id]}
                                            <c:choose>
                                                <c:when test="${item.status.equals('已同意')}">
                                                    <span class="badge badge-success">已同意</span>
                                                </c:when>
                                                <c:when test="${item.status.equals('已拒绝')}">
                                                    <span class="badge badge-danger">已拒绝</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge badge-secondary">未回复</span>
                                                </c:otherwise>
                                            </c:choose></strong>
                                        <input type="button" class="btn btn-outline-primary d-block"
                                               onclick="window.location.href='editApplyPage.entDo?applyRecordId=${item.record_id}&from=apply'"
                                               value="查看"/>
                                    </div>
                                    <span class="d-block">${requestScope.userInfoMap[item.user_id].sex} | ${requestScope.userInfoMap[item.user_id].city} | ${requestScope.userInfoMap[item.user_id].email}
                                </span>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </c:if>

        <!-- 黑名单管理 -->
        <c:if test="${requestScope.entAccount.status.equals('审核通过')}">
            <div class="tab-pane fade" id="black-list">
                <div class="my-3 p-3 bg-white rounded shadow-sm">
                    <div class="media  pt-3">
                        <div class="media-body pb-3 mb-0 lh-125 border-bottom border-gray">
                            <div class="d-flex justify-content-between align-items-center w-100">
                                <h4>黑名单列表</h4>
                            </div>
                        </div>
                    </div>
                    <c:forEach var="item" items="${requestScope.blackLists}">
                        <form method="post" action="editBlackList.entDo">
                            <label>
                                <input name="userId" value="${item.user_id}" hidden>
                                <input name="blackListId" value="${item.black_list_id}" hidden>
                                <input name="tab" value="black-list" hidden>
                            </label>
                            <div class="media text-muted pt-3">
                                <div class="media-body pb-3 mb-0 lh-125 border-bottom border-gray">
                                    <div class="d-flex justify-content-between align-items-center w-100">
                                        <strong class="text-gray-dark">${requestScope.userInfoMap[item.user_id].name}</strong>
                                        <input type="submit" class="btn btn-outline-primary d-block" value="解除"/>
                                    </div>
                                    <span class="d-block">${requestScope.userInfoMap[item.user_id].sex} | ${requestScope.userInfoMap[item.user_id].city} | ${requestScope.userInfoMap[item.user_id].email}</span>
                                </div>
                            </div>
                        </form>
                    </c:forEach>
                </div>
            </div>
        </c:if>

        <!-- 账号设置 -->
        <div class="tab-pane fade" id="account">
            <form action="editPassword.entDo" method="post">
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
                    <input type="password" name="confirm_password" class="form-control col-md-4" id="confirm_password"
                           placeholder="确认密码">
                </div>
                <div class="row">
                    <div class="col-md-3 mx-auto mt-3">
                        <button class="btn btn-lg btn-primary btn-block" type="submit">提交修改</button>
                    </div>
                </div>
            </form>
        </div>

        <%-- 权限受限页面 --%>
        <div class="tab-pane fade" id="access_limit">
            <div class="jumbotron">
                <div class="d-flex justify-content-between align-items-center w-100">
                    <h1 class="display-3">访问权限不足！</h1>
                    <button class="btn btn-outline-primary" onclick="window.location.href='mainPage.entDo'">
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
<%-- 弹窗检查 --%>
<c:if test="${requestScope.title != null}">
    <script type="text/javascript">
        $('#alert-windows').modal('show');
    </script>
</c:if>

<%-- 设置tab --%>
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
