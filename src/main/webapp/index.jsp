<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <title>账号登录</title>
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
<body>
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
    <h5 class="my-0 mr-md-auto font-weight-normal">人才招聘网</h5>
    <!-- 选项卡 -->
    <ul class="nav nav-pills mr-2">
        <li class="nav-item">
            <a class="nav-link" id="user-tab" data-toggle="tab" href="#user_login">个人用户登录</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="ent-tab" data-toggle="tab" href="#enterprise_login">企业用户登录</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="admin-tab" data-toggle="tab" href="#admin_login">管理员登录</a>
        </li>
    </ul>
    <a class="btn btn-outline-primary" href="#" onclick="$('#about').modal('show');">关于网站</a>
</div>
<div class="tab-content">
    <!-- 个人用户登录框 -->
    <div class="tab-pane fade container" id="user_login">
        <form method="post" action="${pageContext.request.contextPath}/user/login">
            <div class="col-4 text-center mx-auto mt-lg-5">
                <div class="card shadow-sm">
                    <div class="card-header">
                        <h1 class="h3 my-auto font-weight-normal">个人用户登录</h1>
                    </div>
                    <div class="card-body">
                        <label for="email_user" class="sr-only">账户</label>
                        <input type="email" id="email_user" class="form-control mb-3" name="account" placeholder="账户"
                               required autofocus>
                        <label for="password_user" class="sr-only">密码</label>
                        <input type="password" id="password_user" class="form-control mb-3" name="password"
                               placeholder="密码" required>

                        <div class="py-2">
                            <button class="btn btn-lg btn-primary btn-block mb-3" type="submit">登录</button>
                            <button class="btn btn-lg btn-outline-primary btn-block"
                                    onclick="window.location.href='${pageContext.request.contextPath}/user/registerPage'"
                                    type="button">注册
                            </button>
                        </div>
                    </div>
                </div>
                <p class="mt-5 mb-3 text-muted">&copy; 2020-2021 Power by ChenXinze</p>
            </div>
        </form>
    </div>
    <!-- 企业用户登录框 -->
    <div class="tab-pane fade container" id="enterprise_login">
        <form method="post" action="${pageContext.request.contextPath}/ent/login">
            <div class="col-4 text-center mx-auto mt-lg-5">
                <div class="card shadow-sm">
                    <div class="card-header">
                        <h1 class="h3 my-auto font-weight-normal">企业用户登录</h1>
                    </div>
                    <div class="card-body">
                        <label for="email_enterprise" class="sr-only">账户</label>
                        <input type="email" id="email_enterprise" class="form-control mb-3" name="account"
                               placeholder="账户" required autofocus>
                        <label for="password_enterprise" class="sr-only">密码</label>
                        <input type="password" id="password_enterprise" class="form-control mb-3" name="password"
                               placeholder="密码" required>

                        <div class="py-2">
                            <button class="btn btn-lg btn-primary btn-block mb-3" type="submit">登录</button>
                            <button class="btn btn-lg btn-outline-primary btn-block" type="button"
                                    onclick="window.location.href='${pageContext.request.contextPath}/ent/registerPage'">
                                注册
                            </button>
                        </div>
                    </div>
                </div>
                <p class="mt-5 mb-3 text-muted">&copy; 2020-2021 Power by ChenXinze</p>
            </div>
        </form>
    </div>
    <!-- 管理员登录框 -->
    <div class="tab-pane fade container" id="admin_login">
        <form method="post" action="${pageContext.request.contextPath}/admin/login">
            <div class="col-4 text-center mx-auto mt-lg-5">
                <div class="card shadow-sm">
                    <div class="card-header">
                        <h1 class="h3 my-auto font-weight-normal">管理员登录</h1>
                    </div>
                    <div class="card-body">
                        <label for="email_admin" class="sr-only">账户</label>
                        <input type="email" id="email_admin" class="form-control mb-3" name="account" placeholder="账户"
                               required autofocus>
                        <label for="password_admin" class="sr-only">密码</label>
                        <input type="password" id="password_admin" class="form-control mb-3" name="password"
                               placeholder="密码" required>

                        <div class="py-2">
                            <button class="btn btn-lg btn-primary btn-block mb-3" type="submit">登录</button>
                        </div>
                    </div>
                </div>
                <p class="mt-5 mb-3 text-muted">&copy; 2020-2021 Power by ChenXinze</p>
            </div>
        </form>
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
                <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<!-- 关于本站 -->
<div class="modal fade" id="about" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">关于网站</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                网站前端使用 BootStrap 框架开发<br>
                网站后端使用 Jdbc 等技术开发<br>
                网站作者：陈新泽
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
</body>
<c:if test="${requestScope.title != null}">
    <script type="text/javascript">
        $('#alert-windows').modal('show');
    </script>
</c:if>

<%-- 设置tab --%>
<c:if test="${requestScope.tab == null}">
    <script>
        $('#user-tab').tab('show');
    </script>
</c:if>
<c:if test="${requestScope.tab != null}">
    <script>
        $('#${requestScope.tab}-tab').tab('show');
    </script>
</c:if>

</html>
