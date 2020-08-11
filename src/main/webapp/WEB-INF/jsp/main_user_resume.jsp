<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <title>简历信息填写</title>
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
    <h5 class="my-0 mr-md-auto font-weight-normal">人才招聘网 <span class="badge badge-success">个人版</span></h5>
    <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/user/mainPage?tab=resume">返回主页</a>
</div>

<div class="container my-5">
    <form method="post" action="${pageContext.request.contextPath}/user/editResume">
        <label class="sr-only">
            <input name="tab" value="resume" hidden>
        </label>
        <div class="col-md-8 order-md-1 mx-auto">
            <h4 class="mb-3">简历填写</h4>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="home_page">个人主页</label>
                    <input type="text" name="home_page" id="home_page" class="form-control"
                           value="${resume.home_page}" required="required"/>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="except_position">期望职位</label>
                    <input type="text" name="except_position" id="except_position" class="form-control"
                           value="${resume.except_position}" required="required"/>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="except_wage">期望工资水平</label>
                    <input type="text" name="except_wage" id="except_wage" class="form-control"
                           value="${resume.except_wage}"
                           required="required"/>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="except_city">期望工作城市</label>
                    <input type="text" name="except_city" id="except_city" class="form-control"
                           value="${resume.except_city}"
                           required="required"/>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="self_evaluation">自我评价</label>
                    <textarea class="form-control" name="self_evaluation" id="self_evaluation" rows="8"
                              required="required">${resume.self_evaluation}</textarea>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="work_experience">工作经历</label>
                    <textarea class="form-control" name="work_experience" id="work_experience" rows="8"
                              required="required">${resume.work_experience}</textarea>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 mb-3">
                    <label for="project_experience">项目经历</label>
                    <textarea class="form-control" name="project_experience" id="project_experience" rows="5"
                              required="required">${resume.project_experience}</textarea>
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
