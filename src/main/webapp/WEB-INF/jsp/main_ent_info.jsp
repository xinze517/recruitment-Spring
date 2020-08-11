<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <title>完善企业注册信息</title>
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
<body class="bg-light">
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
    <h5 class="my-0 mr-md-auto font-weight-normal">人才招聘网 <span class="badge badge-success">企业版</span></h5>
    <a class="btn btn-outline-primary" href="mainPage.entDo?tab=info">返回主页</a>
</div>

<div class="container my-5">
    <form action="editInfo.entDo" method="post">
        <label class="sr-only">
            <input name="tab" value="info" hidden>
        </label>
        <div class="col-md-8 order-md-1 mx-auto">
            <h4 class="mb-3">注册信息</h4>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="legal_representative">法人代表</label>
                    <input type="text" name="legal_representative" id="legal_representative" class="form-control"
                           value="${requestScope.entInfo.legal_representative}" required="required"/>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="established_date">成立时间</label>
                    <input type="date" name="established_date" id="established_date" class="form-control"
                           value="${requestScope.entInfo.established_date}" required="required"/>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="email">接收简历邮箱</label>
                    <input type="email" name="email" id="email" class="form-control"
                           value="${requestScope.entInfo.email}" required="required"/>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="name">公司全称</label>
                    <input type="text" name="name" id="name" class="form-control" value="${requestScope.entInfo.name}"
                           required="required"/>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="home_page">公司主页</label>
                    <input type="text" name="home_page" id="home_page" class="form-control"
                           value="${requestScope.entInfo.home_page}" required="required"/>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12 mb-3">
                    <label for="introduction">公司介绍</label>
                    <textarea class="form-control" name="introduction" id="introduction" rows="5"
                              required="required">${requestScope.entInfo.introduction}</textarea>
                </div>
            </div>
            <hr class="md-4">
            <div class="row">
                <div class="col-md-4 mx-auto mt-3">
                    <button class="btn btn-lg btn-primary btn-block" type="submit">提交</button>
                </div>
            </div>
            <p class="mt-5 mb-3 text-muted text-center">&copy; 2020-2021 Power by ChenXinze</p>
        </div>
    </form>
</div>
</body>
</html>