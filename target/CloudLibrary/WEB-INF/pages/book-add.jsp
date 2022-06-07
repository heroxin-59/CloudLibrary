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
    <title>新增书籍</title>
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
                    <small>书籍页面 —— 新增书籍</small>
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
            <form class="form-horizontal" action="${pageContext.request.contextPath}/book/insert" method="post" >

                <div class="form-group">
                    <label class="col-sm-2 control-label">书名</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" required name="book_name">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">作者</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" required name="book_author">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">ISBN</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" required name="book_isbn">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">出版商</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" required name="book_press">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">价格</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" required name="book_price">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">上架时间</label>
                    <div class="col-sm-10">
                        <input type="date" class="form-control" required name="book_uploadtime">
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
