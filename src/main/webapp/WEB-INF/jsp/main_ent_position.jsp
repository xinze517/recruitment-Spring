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
    <h5 class="my-0 mr-md-auto font-weight-normal">人才招聘网 <span class="badge badge-success">企业版</span></h5>
    <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/ent/mainPage?tab=position">返回主页</a>
</div>

<div class="container my-5">
    <form action="${pageContext.request.contextPath}/ent/editPosition" method="post">
        <label class="sr-only">
            <input name="tab" value="position" hidden>
        </label>
        <label>
            <input name="position_id"
                   value="${entPosition.position_id}<c:if test="${entPosition == null}">-1</c:if>"
                   hidden>
        </label>
        <div class="col-md-8 order-md-1 mx-auto">
            <%-- 岗位状态通知 --%>
            <c:if test="${entPosition != null}">
                <c:choose>
                    <c:when test="${entPosition.status.equals('屏蔽')}">
                        <div class="alert alert-danger text-center" role="alert">
                            <h4 class="alert-heading">岗位状态</h4>
                            <p>
                                该岗位信息由于不合格或包含违法信息，已被管理员屏蔽<br>
                                该岗位信息现不允许编辑，且不允许重新发布！
                            </p>
                        </div>
                        <hr>
                    </c:when>
                    <c:when test="${entPosition.status.equals('发布')}">
                        <div class="alert alert-success text-center" role="alert">
                            <h4 class="alert-heading">岗位状态</h4>
                            <p>该岗位信息目前处于发布状态，所有应聘者均可见</p>
                        </div>
                        <hr>
                    </c:when>
                    <c:otherwise>
                        <div class="alert alert-warning text-center" role="alert">
                            <h4 class="alert-heading">岗位状态</h4>
                            <p>该岗位信息目前处于关闭状态，仅发布岗位的企业可见</p>
                        </div>
                        <hr>
                    </c:otherwise>
                </c:choose>
            </c:if>

            <h4 class="mb-3">岗位信息填写</h4>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="name">岗位简称</label>
                    <input type="text" name="name" id="name" class="form-control"
                           value="${entPosition.name}" required="required"
                           <c:if test="${entPosition.status.equals('发布')}">readonly</c:if>
                           <c:if test="${entPosition.status.equals('屏蔽')}">readonly</c:if>/>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="description">岗位描述</label>
                    <input type="text" name="description" id="description" class="form-control "
                           value="${entPosition.description}" required="required"
                           <c:if test="${entPosition.status.equals('发布')}">readonly</c:if>
                           <c:if test="${entPosition.status.equals('屏蔽')}">readonly</c:if>/>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="address">工作地址</label>
                    <input type="text" name="address" id="address" class="form-control"
                           value="${entPosition.address}" required="required"
                           <c:if test="${entPosition.status.equals('发布')}">readonly</c:if>
                           <c:if test="${entPosition.status.equals('屏蔽')}">readonly</c:if>/>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="wage">薪水</label>
                    <input type="text" name="wage" id="wage" class="form-control"
                           value="${entPosition.wage}" required="required"
                           <c:if test="${entPosition.status.equals('发布')}">readonly</c:if>
                           <c:if test="${entPosition.status.equals('屏蔽')}">readonly</c:if>/>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 mb-3">
                    <label for="requirements">职位要求</label>
                    <textarea class="form-control" name="requirements" id="requirements" rows="5"
                              required="required"
                              <c:if test="${entPosition.status.equals('发布')}">readonly</c:if>
                              <c:if test="${entPosition.status.equals('屏蔽')}">readonly</c:if>
                    >${entPosition.requirements}</textarea>
                </div>
            </div>

            <c:choose>
                <c:when test="${entPosition.status.equals('屏蔽')}">
                    <%--  当岗位被屏蔽时，不显示任何按钮  --%>
                </c:when>
                <c:otherwise>
                    <%--  当岗位不被屏蔽时，按发布状态确定按钮  --%>
                    <div class="row my-3">
                        <div class="col">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="status" value="发布" id="release"
                                       <c:if test="${entPosition.status.equals('发布')}">checked</c:if>
                                       <c:if test="${entPosition == null}">checked</c:if>/>
                                <label class="form-check-label" for="release">立即发布</label>
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="status" value="关闭" id="close"
                                       <c:if test="${entPosition.status.equals('关闭')}">checked</c:if>/>
                                <label class="form-check-label" for="close">暂时关闭</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 mx-auto mt-3">
                            <button class="btn btn-lg btn-primary btn-block" type="submit">提交</button>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </form>
    <p class="mt-5 mb-3 text-muted text-center">&copy; 2020-2021 Power by ChenXinze</p>
</div>
</body>
</html>