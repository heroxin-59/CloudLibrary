<%--
  Created by IntelliJ IDEA.
  User: hero_
  Date: 2022/3/30
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>借阅书籍</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script>
        function unrecord(record_bookname,record_id,record_remandtime){
            if (record_remandtime == ''){
                if (confirm("您确定要归还 《"+record_bookname+"》 吗？")){
                    location.href="${pageContext.request.contextPath}/record/update/"+record_id;
                }
            }else if(record_remandtime == '等待确认中..'){
                alert("您已归还,等待管理员确认中!")
            }else
                alert("管理员通过,您归还书籍成功!")
        }
        function cimrecord(record_bookname,record_id,record_remandtime){
            if (record_remandtime == '等待确认中..'){
                if (confirm("您确定要归还 《"+record_bookname+"》 吗？")){
                    location.href="${pageContext.request.contextPath}/record/remand/"+record_id;
                }
            }else if (record_remandtime == ''){
                alert("当前书籍还未归还");
            }else
                alert("书籍已归还!")
        }
    </script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-9 column">
            <div class="page-header">
                <h1>
                    <small>书籍页面 —— 借阅图书</small>
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
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>书名</th>
                    <th>ISBN</th>
                    <th>借阅者</th>
                    <th>借阅时间</th>
                    <th>归还时间</th>
                    <th>归还</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${querylist}" var="query">
                    <tr>
                        <td>${query.record_bookname}</td>
                        <td>${query.record_bookisbn}</td>
                        <td>${query.record_borrower}</td>
                        <td>${query.record_borrowtime}</td>
                        <td>${query.record_remandtime}</td>
                        <td>
                            <a class="btn btn-info  btn-sm"
                               onclick="unrecord('${query.record_bookname}','${query.record_id}','${query.record_remandtime}')" >归还</a>
                            <c:if test="${user.user_role == 'admin'}">
                                <a class="btn btn-info  btn-sm"
                                   onclick="cimrecord('${query.record_bookname}','${query.record_id}','${query.record_remandtime}')" >确认归还</a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
