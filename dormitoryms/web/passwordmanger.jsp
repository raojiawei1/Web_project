<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!-- 引入 Bootstrap -->
    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- 引入 font-awesome -->
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>宿舍管理系统</title>
    <script type="application/javascript">
        function accept(url){
            $("iframe").attr("src",url);
        }
    </script>

</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-10">

            <!-- 列表展示-->
            <div class="table-responsive">
                <table class="table table-hover ">
                    <thead>
                    <tr>
                        <th>用户名</th>
                        <th>姓名</th>
                        <th>原密码</th>
                        <th>新密码</th>
                        <th>状态</th>

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="message">
                        <tr>
                            <td>${message.username}</td>
                            <td>${message.name}</td>
                            <td>${message.password}</td>
                            <td>${message.newpassword}</td>
                            <td>${message.state}</td>
                            <td>
                                <div class="btn-group">
                                    <form method="post" action='/password?method=accept&name=${message.name}&newpassword=${message.newpassword}'>
                                      <button type="submit" class="btn btn-default">
                                        <i class="fa fa-check">同意</i>
                                    </button>
                                    </form>
                                    <form method="post" action="/password?method=refuse&name=${message.name}" style="margin-top: 5px;">
                                      <button type="submit" class="btn btn-danger ">
                                        <i class="fa fa-close">拒绝</i>
                                      </button>
                                    </form>


                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>




            </div>
        </div>
    </div>
</div>




</body>

</html>