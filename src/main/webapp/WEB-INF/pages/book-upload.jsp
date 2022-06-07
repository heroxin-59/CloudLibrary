<%--
  Created by IntelliJ IDEA.
  User: hero_
  Date: 2022/3/30
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改书籍信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-9 column">
            <div class="page-header">
                <h1>
                    <small>书籍页面 —— 修改书籍信息</small>
                </h1>
            </div>
        </div>
        <div class="col-md-1 column">
            <div class="page-header">
                <h1>
                    <small><a class="btn btn-success  btn-sm" href="${pageContext.request.contextPath}/book/list">返回</a></small>
                </h1>
            </div>
        </div>
        <div class="col-md-1 column">
            <div class="page-header">
                <h1>
                    <small><a class="btn btn-success  btn-sm" href="${pageContext.request.contextPath}/user/logout">${user.user_name}.注销</a></small>
                </h1>
            </div>
        </div>
        <div class="col-md-1 column" >
            <div class="page-header">
                <h1>
                    <small><a class="btn btn-success  btn-sm" href="${pageContext.request.contextPath}/main.jsp">首页</a></small>
                </h1>
            </div>
        </div>
    </div>

    <hr>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form class="form-horizontal" action="${pageContext.request.contextPath}/book/upload" method="post"  enctype="multipart/form-data" >

              <%--  <div class="form-grou hidden" >
                    <label class="col-sm-2 control-label">图书id</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" readonly name="book_id" value="${query.book_id}">
                    </div>
                </div>--%>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Logo</label>
                    <div class="col-sm-10">
                        <input type="file" class="form-control" name="uploadFile">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-info">提 交</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
