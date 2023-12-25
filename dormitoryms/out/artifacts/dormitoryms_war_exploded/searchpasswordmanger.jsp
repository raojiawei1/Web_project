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
</head>
<script>
    function check(username) {
        if (username.equals("")){
            alert("已经提交，无法重复提交");
        }
    }

</script>


<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-10">
            <!-- 顶部搜索部分 -->
            <div class="panel panel-default">
                <div class="panel-heading" >提交</div>
                <div class="panel-body">
                    <form role="form" class="form-inline" action='/searchpassword?method=adminsearch&name=${dormitoryAdmin.name}' method="post">

                        <div class="form-group " style="margin-left: 48px">
                            <c:if test="${list.size()==0}">
                            <button type="button" class="btn btn-default"  data-username="${dormitoryAdmin.username}" data-name="${dormitoryAdmin.name}"
                                    data-toggle="modal" data-target="#addUserModal" style="margin-left: 300px" onclick="check(${list.size()})">
										<span style="margin-right: 5px" class="" aria-hidden="true" >
											<i class="fa fa-user-plus">提交信息</i>
											</span>
                            </button>
                            </c:if>

                            <c:if test="${list.size()>=1}">
                                <button type="button" class="btn btn-default"
                                      style="margin-left: 300px" onclick="check(${list.size()})">
										<span style="margin-right: 5px" class="" aria-hidden="true" >
											<i class="fa fa-user-plus">提交信息</i>
											</span>
                                </button>
                            </c:if>



                        </div>
                    </form>
                </div>
            </div>
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
                        <th>操作</th>
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
                                    <button type="button" class="btn btn-danger "

                                            data-newpassword="${message.newpassword}"

                                            data-toggle="modal"
                                            onclick="" data-target="#delUserModal">
                                        <i class="fa fa-user-times">删除</i>
                                    </button>
                                </div>
                            </td>

                        </tr>

                    </c:forEach>
                    </tbody>
                </table>
                <!-- add框示例（Modal） -->
                <form method="post" action='/searchpassword?method=save&name=${dormitoryAdmin.name}' class="form-horizontal" style="margin-top: 0px" role="form"
                      id="form_data" style="margin: 20px;">
                    <div class="modal fade" id="addUserModal" tabindex="-1"
                         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-hidden="true">x</button>
                                    <h4 class="modal-title" id="myModalLabel">提交信息</h4>
                                </div>
                                <div class="modal-body">
                                    <form class="form-horizontal" role="form">


                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">用户名</label>
                                            <div class="col-sm-9">
                                                <input type="text" readonly required class="form-control" id="username"
                                                       name="username"  value="${dormitoryAdmin.username}">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">姓名</label>
                                            <div class="col-sm-9">
                                                <input type="text" readonly required class="form-control" id="name"
                                                       name="name" placeholder="请输入密码">
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">原密码</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control" id="password"
                                                       name="password" placeholder="请输入原密码">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">新密码</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control" id="newpassword"
                                                       name="newpassword" placeholder="请输入新密码">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">状态</label>
                                            <div class="col-sm-9">
                                                <input type="text" readonly required class="form-control" id="state"
                                                       name="state" value="审核中">

                                            </div>
                                        </div>


                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                    <button type="submit" class="btn btn-primary">提交</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

                <!-- 删除模态框示例（Modal） -->
                <form method="post" action='/searchpassword?method=delete&name=${dormitoryAdmin.name}'
                      class="form-horizontal" style="margin-top: 0px" role="form"
                      id="form_data" style="margin: 20px;">
                    <div class="modal fade" id="delUserModal" tabindex="-1"
                         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-hidden="true">×</button>
                                    <h4 class="modal-title" id="myModalLabel">信息</h4>
                                </div>
                                <div class="modal-body">
                                    <form class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <div class="col-sm-9">
                                                <h3 class="col-sm-18 control-label" id="deleteLabel">删除信息</h3>
                                                <input type="hidden" class="form-control" id="tab"
                                                       name="tab" placeholder="" value="dor_admin"> <input
                                                    type="hidden" class="form-control" id="newpassword"
                                                    name="newpassword" placeholder="">
                                                <input type="hidden" name="dormitoryId" id="dormitoryId"/>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                    <button type="submit" class="btn btn-danger">删除</button>
                                    <span id="tip"> </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>

<script>
    $('#addUserModal').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget)
        var username= button.data('username')
        var name = button.data('name')

        var modal = $(this)


        modal.find('#username').val(username)
        modal.find('#name').val(name)


    })
    function  check(len) {
        if(len>=1 )
        {
            alert("已有信息无法添加，您已经有一条信息" )
        }


    }
    $('#delUserModal').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget)
        var newpassword= button.data('newpassword')
        var modal = $(this)
        modal.find('.modal-title').text('删除成绩信息')
        modal.find('#deleteLabel').text('将删除申请修改新密码为 ' + newpassword + '的信息')
        modal.find('#newpassword').val(newpassword)
    })


</script>

</body>

</html>