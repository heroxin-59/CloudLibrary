<%--
  Created by IntelliJ IDEA.
  User: hero_
  Date: 2022/3/30
  Time: 15:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>书籍列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery.js"></script>
    <script>
        function del(book_name,book_id){
            if (confirm("您确定要删除《"+book_name+"》 吗？")){
                location.href="${pageContext.request.contextPath}/book/delete/"+book_id;
            }
        }
        function record(book_name,book_isbn,book_id,book_borrowtime){
            if (book_borrowtime == ''){
                if (confirm("您确定要借阅 《"+book_name+"》 吗？")){
                    location.href="${pageContext.request.contextPath}/record/insert/"+book_name +"/"+ book_isbn+"/"+book_id;
                }
            }else
                alert("您已借阅!")

        }
        //禁用功能
        $(function () {
            $("ul.pagination li.disabled a").click(function () {
                return false;
            })
        });
    </script>
    <style type="text/css">
        .ding{
            position: absolute;
            bottom: 100px;
            left: 550px;
        }
    </style>
</head>
<body>
    <div class="container">

        <div class="row clearfix">
            <div class="col-md-9 column">
                <div class="page-header">
                    <h1>
                        <small>书籍页面 —— 显示所有图书信息</small>
                    </h1>
                </div>
            </div>
            <div class="col-md-1 column">
                <div class="page-header">
                    <h1>
                        <small><a class="btn btn-success  btn-sm" href="${pageContext.request.contextPath}/main.jsp">返回</a></small>
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

        <div  class="row">
            <div class="col-md-1 column"  >
                <a class="btn btn-info" href="${pageContext.request.contextPath}/record/query">借阅记录</a>
            </div>
            <div class="col-md-1 column"  >
                <c:if test="${user.user_role == 'admin'}">
                    <a class="btn btn-info" href="${pageContext.request.contextPath}/book/toAdd">新增书籍</a>
                </c:if>
            </div>
            <div class="col-md-2 column "  ></div>
            <div class="col-md-8 column">
                <form class="form-inline " action="${pageContext.request.contextPath}/book/select" method="post">
                    <div class="form-group ">
                        <input type="text" class="form-control" name="book_name" placeholder="图书名称" >
                        <input type="text" class="form-control" name="book_author" placeholder="作者">
                        <input type="text" class="form-control" name="book_isbn" placeholder="ISBN">
                        <button  type="submit" class="btn btn-default">搜 索</button>
                    </div>
                </form>
            </div>
        </div>
        <hr>
        <div class="row clearfix">
            <div class="col-md-12 column">
                <table class="table table-hover table-striped">
                    <thead>
                        <tr>
                            <th>Logo</th>
                            <th>书名</th>
                            <th>作者</th>
                            <th>ISBN</th>
                            <th>出版商</th>
                            <th>价格</th>
                            <th>上架时间</th>
                            <th>借阅者</th>
                            <th>借阅时间</th>
                            <th>操作</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${list}" var="booklist">
                            <tr>
                                <td>
                                    <c:if test="${booklist.book_pagination != '' && booklist.book_pagination != null}">
                                        <img src="../imges/${booklist.book_pagination}" width="40px" height="40px" >
                                    </c:if>
                                </td>
                                <td>${booklist.book_name}</td>
                                <td>${booklist.book_author}</td>
                                <td>${booklist.book_isbn}</td>
                                <td>${booklist.book_press}</td>
                                <td>${booklist.book_price}</td>
                                <td>${booklist.book_uploadtime}</td>
                                <td>${booklist.book_borrower}</td>
                                <td>${booklist.book_borrowtime}</td>
                                <td>
                                    <c:if test="${user.user_role == 'admin'}">
                                        <a class="btn btn-success  btn-sm" href="${pageContext.request.contextPath}/book/toUpdate/${booklist.book_id}">更改</a>
                                        <a class="btn btn-success  btn-sm" href="${pageContext.request.contextPath}/book/toUpload/${booklist.book_id}">logo</a>
                                        <a class="btn btn-danger  btn-sm"  onclick="del('${booklist.book_name}','${booklist.book_id}')"  >删除</a>
                                    </c:if>
                                    <a id="recordbook" class="btn btn-info  btn-sm"
                                       onclick="record('${booklist.book_name}','${booklist.book_isbn}','${booklist.book_id}','${booklist.book_borrowtime}')"  >借阅</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <hr>
        <!-- 分页标签 -->
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4 ding">
                <nav class="pageDIV">
                    <ul class="pagination">
                        <li <c:if test="${!page.hasPreviouse}">class="disabled" disabled="disabled"</c:if> >
                            <a href="${pageContext.request.contextPath}/book/list/?page.start=0">   <%-- 首页的开始数据的索引为0 点击后会发现地址栏变为 http://localhost:8080/DemoMVC/getlist?page.start=0  是作为参数显式传递的 --%>
                                <span> 首页 </span>
                            </a>
                        </li>
                        <li <c:if test="${!page.hasPreviouse}">class="disabled" disabled="disabled"</c:if> >
                            <a href="${pageContext.request.contextPath}/book/list?page.start=${page.start-page.count}"> <%--当前页面数据索引 - 每页显示条数 = 上一页的第一条数据索引 --%>
                                <span> 上一页 </span>
                            </a>
                        </li>
                        <c:forEach begin="0" end="${page.totalPage-1}" varStatus="status">
                            <c:if test="${status.count*page.count-page.start<=30 && status.count*page.count-page.start>=-10}">
                                <li <c:if test="${status.index*page.count==page.start}">class="disabled" </c:if>>
                                    <a href="${pageContext.request.contextPath}/book/list?page.start=${status.index*page.count}"
                                       <c:if test="${status.index*page.count==page.start}">class="current"</c:if>
                                    >${status.count}</a>
                                </li>
                            </c:if>
                        </c:forEach>
                        <li <c:if test="${!page.hasNext}">class="disabled" disabled="disabled"</c:if>>
                            <a href="${pageContext.request.contextPath}/book/list?page.start=${page.start+page.count}">
                                <span> 下一页 </span>
                            </a>
                        </li>
                        <li <c:if test="${!page.hasNext}">class="disabled" disabled="disabled"</c:if>>
                            <a href="${pageContext.request.contextPath}/book/list?page.start=${page.last}">
                                <span> 尾页 </span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>

</body>
</html>
