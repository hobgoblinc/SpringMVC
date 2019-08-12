<%--
  Created by IntelliJ IDEA.
  User: sjj
  Date: 2015/10/24 0024
  Time: 19:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>SpringMVC 用户管理</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <%--  <link rel="stylesheet" href="/css/bootstrap.min.css">--%>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">


    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        /*翻页*/
        .jump {
            margin: 0px 0;
            float: right;
        }

        .jump_text {
            float: right;
            margin: 0 0 0 5px;
            line-height: 33px;
        }

        .jump_text input {
            width: 40px;
            border: rgba(212, 212, 212, 1.00) 1px solid;
            height: 30px;
            line-height: 33px;
            background: #fff;
        }
    </style>
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="<%= path%>/js/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <%--<script src="/js/bootstrap.min.js"></script>--%>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>

    <script type="text/javascript">
        var page = 1;
        var pageSize = 10;
        function pageTo(pageNumber) {
            var jumpPage = 1;
            if (pageNumber == -1) {
                var curpage = '${pageNumber}';
                jumpPage = Number(curpage) - 1;
            } else if (pageNumber == -2) {
                var curpage = '${pageNumber}';
                jumpPage = Number(curpage) + 1;
            } else {
                jumpPage = Number(pageNumber);
            }
            var flag = $("input[name='pageNumber']");
            flag.remove();
            $("#myForm").append("<input type='hidden' name='page' value='" + jumpPage + "' />");
            $("#myForm").append("<input type='hidden' name='pageSize' value='" + pageSize + "' />");
            $("#myForm").submit();
        }

        function goPage() {
            var jumpPage = document.getElementById("jumpPage").value;
            var totalPage = '${totalPages}';
            if (isNaN(jumpPage)) {
                alert("请输入数字！");
                return;
            } else if (jumpPage.length == 0) {
                alert("请输入页码！");
            } else if (jumpPage <= 0 || Number(jumpPage) > Number(totalPage)) {
                alert("非法的页码【" + jumpPage + "】！");
                document.getElementById("jumpPage").value = "";
                return;
            } else {
                var flag = $("input[name='pageNumber']");
                flag.remove();
                $("#myForm").append("<input type='hidden' name='page' value='" + jumpPage + "' />");
                $("#myForm").append("<input type='hidden' name='pageSize' value='" + pageSize + "' />");
                $("#myForm").submit();
            }
        }

    </script>

</head>
<body>
<div class="container">
    <h1 class="text-center">SpringMVC 用户管理</h1>
    <hr/>

    <h3>所有用户 <a href="<%= path%>/addUser" type="button" class="btn btn-default btn-sm">添加</a></h3>

    <!-- 如果用户列表为空 -->
    <c:if test="${empty userList}">
        <p class="bg-warning">
            <br/>
            User表为空，请<a href="<%= path%>/addUser" type="button" class="btn btn-default btn-sm">添加</a>
            <br/>
            <br/>
        </p>
    </c:if>

    <!-- 如果用户列表非空 -->
    <c:if test="${!empty userList}">
        <table class="table table-striped table-bordered">
            <tr style="text-align: center">
                <th>机会号#</th>
                <th>公司名称</th>
                <th>联系人</th>
                <th>联系电话</th>
                <th>状态</th>
                <th>业务</th>
                <th>来源</th>
                <th>销售顾问</th>
                <th>创建时间</th>
                <th>销售金额</th>
                <th>操作</th>
            </tr>

            <c:forEach items="${userList}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.company}</td>
                    <td>${user.name}</td>
                    <td>${user.phone}</td>
                    <td>${user.state}</td>
                    <td>${user.business}</td>
                    <td>${user.source}</td>
                    <td>${user.counselor}</td>
                    <td>${user.createTime}</td>
                    <td>${user.income}</td>
                    <td>
                        <a href="<%= path%>/showUser/${user.id}" type="button" class="btn btn-sm btn-success">详情</a>
                        <a href="<%= path%>/updateUser/${user.id}" type="button" class="btn btn-sm btn-warning">修改</a>
                        <a href="<%= path%>/deleteUser/${user.id}" type="button" class="btn btn-sm btn-danger">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <%--        <nav aria-label="Page navigation" class="text-right">--%>
        <%--            <ul class="pagination">--%>
        <%--                    &lt;%&ndash;                <li>第${at}页</li>&ndash;%&gt;--%>
        <%--                <li>--%>
        <%--                    <a href="#" aria-label="Previous">--%>
        <%--                        <span aria-hidden="true">&laquo;</span>--%>
        <%--                    </a>--%>
        <%--                </li>--%>
        <%--                <li class="active"><a href="#">1</a></li>--%>
        <%--                <li><a href="#">2</a></li>--%>
        <%--                <li><a href="#">3</a></li>--%>
        <%--                <li><a href="#">4</a></li>--%>
        <%--                <li><a href="#">5</a></li>--%>
        <%--                <li>--%>
        <%--                    <a href="#" aria-label="Next">--%>
        <%--                        <span aria-hidden="true">&raquo;</span>--%>
        <%--                    </a>--%>
        <%--                </li>--%>
        <%--                    &lt;%&ndash;                <li>共${pageNum}页</li>&ndash;%&gt;--%>
        <%--            </ul>--%>
        <%--        </nav>--%>
    </c:if>
    <nav aria-label="Page navigation" class="text-right">
        <ul class="pagination">
            <!-- 上一页  -->
            <!-- 当当前页码为1时，隐藏上一页按钮  -->
            <li <c:if test="${currentPage==1 }">class="disabled"</c:if>>
                <!-- 当当前页码不等于1时，跳转到上一页  -->
                <a
                        <c:if test="${currentPage==1 }">href="javaScript:void(0)"</c:if>
                        <c:if test="${currentPage!=1 }">href="javaScript:pageTo('${currentPage-1 }')"</c:if>
                >上一页</a>
            </li>

            <!-- 页码  -->
            <!-- 当总页数小于等于7时，显示页码1...7页 -->
            <c:if test="${totalPages<=7}">
                <c:forEach begin="1" end="${totalPages}" var="i">
                    <li <c:if test="${currentPage==i }">class="active"</c:if>>
                        <a href="javaScript:pageTo('${i}')">${i}</a>
                    </li>
                </c:forEach>
            </c:if>
            <!-- 当总页数大于7时 -->
            <c:if test="${totalPages>7}">
                <!-- 当前页数小于等于4时，显示1到5...最后一页 -->
                <c:if test="${currentPage<=4}">
                    <c:forEach begin="1" end="5" var="i">
                        <li <c:if test="${currentPage==i }">class="active"</c:if>>
                            <a href="javaScript:pageTo('${i}')">${i}</a>
                        </li>
                    </c:forEach>
                    <li><a href="#">...</a></li>
                    <li <c:if test="${currentPage==totalPages }">class="active"</c:if>>
                        <a href="javaScript:pageTo('${totalPages}')">${totalPages}</a>
                    </li>
                </c:if>
                <!-- 当前页数大于4时，如果当前页小于总页码书-3，则显示1...n-1,n,n+1...最后一页 -->
                <c:if test="${currentPage>4}">
                    <c:if test="${currentPage<totalPages-3}">
                        <li><a href="javaScript:pageTo('${1}')">${1}</a>
                        </li>
                        <li><a href="#">...</a></li>
                        <c:forEach begin="${currentPage-1 }" end="${currentPage+1 }" var="i">
                            <li <c:if test="${currentPage==i }">class="active"</c:if>>
                                <a href="javaScript:pageTo('${i}')">${i}</a>
                            </li>
                        </c:forEach>
                        <li><a href="#">...</a></li>
                        <li <c:if test="${currentPage==totalPages }">class="active"</c:if>>
                            <a href="javaScript:pageTo('${totalPages}')">${totalPages}</a>
                        </li>
                    </c:if>
                </c:if>
                <!-- 当前页数大于4时，如果当前页大于总页码书-4，则显示1...最后一页-3，最后一页-2，最后一页-1，最后一页 -->
                <c:if test="${currentPage>totalPages-4}">
                    <li><a href="javaScript:pageTo('${1}')">${1}</a>
                    </li>

                    <li><a href="#">...</a></li>
                    <c:forEach begin="${totalPages-3 }" end="${totalPages }" var="i">
                        <li <c:if test="${currentPage==i }">class="active"</c:if>>
                            <a href="javaScript:pageTo('${i}')">${i}</a>
                        </li>
                    </c:forEach>
                </c:if>
            </c:if>
            <!-- 下一页  -->
            <!-- 当当前页码为最后一页或者最后一页为0时，隐藏下一页按钮
                               当当前页码不等于总页码时，跳转下一页  -->
            <li <c:if test="${currentPage==totalPages || totalPages==0}">class="disabled"</c:if>>
                <a
                        <c:if test="${currentPage==totalPages || totalPages==0 }">href="javaScript:void(0)"</c:if>
                        <c:if test="${currentPage!=totalPages }">href="javaScript:pageTo('${currentPage+1 }')"</c:if>>下一页</a>
            </li>
        </ul>

        <!-- 跳转页 -->
        <div class="pagination">
        <span class="jump_text">共有${totalPages }页，${totalElements }条记录，跳到
            <input type="text" name="jumpPage" id="jumpPage" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');">页
            <button type="button" class="btn btn-sm btn-success" onclick="goPage()">GO</button>
        </span>
        </div>
    </nav>
    <form:form id="myForm" action="#" method="get" commandName="userP" role="form" cssStyle="display: none">
        <div class="form-group">
            <button type="submit" class="btn btn-sm btn-success"></button>
        </div>
    </form:form>
</div>
<!--  分页页码     -->

</body>
</html>
