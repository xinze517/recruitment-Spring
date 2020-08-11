<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <title>个人用户注册</title>
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
<body>
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
    <h5 class="my-0 mr-md-auto font-weight-normal">人才招聘网 <span class="badge badge-success">个人版</span></h5>
    <a class="btn btn-outline-primary" href="#" onclick="$('#about').modal('show');">关于网站</a>
</div>

<div class="container">
    <form method="post" action="${pageContext.request.contextPath}/user/register">
        <div class="col-4 text-center mx-auto mt-lg-5">
            <div class="card shadow-sm">
                <div class="card-header">
                    <h1 class="h3 my-auto font-weight-normal">用户注册</h1>
                </div>
                <div class="card-body">
                    <label for="email" class="sr-only">账户</label>
                    <input type="email" id="email" name="account" class="form-control mb-3" placeholder="账户" required
                           autofocus>
                    <label for="password" class="sr-only">密码</label>
                    <input type="password" id="password" name="password" class="form-control mb-3" placeholder="密码"
                           required>
                    <div class="py-2">
                        <button class="btn btn-lg btn-primary btn-block" type="submit">注册</button>
                        <button class="btn btn-lg btn-outline-primary btn-block mb-3" type="button"
                                onclick="window.location.href=''">返回
                        </button>
                    </div>
                </div>
            </div>
            <p class="mt-5 mb-3 text-muted">&copy; 2020-2021 Power by ChenXinze</p>
        </div>
    </form>
</div>
<!-- 提示框 -->
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
</html>
