<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <!-- 引入 Bootstrap -->
  <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <!-- 引入 font-awesome -->
  <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
  <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="application/javascript">
    function change(url,index){
      $(".list-group-item").removeClass("active");
      $(".list-group-item").eq(index).addClass("active");
      $("iframe").attr("src",url);
    }
  </script>
</head>
<body>
<nav class="navbar navbar-inverse" role="navigation" style="border: none">
  <div class="container-fluid" style="background-color: rgb(91,127,215)">
      <a style="color: white;float: left;margin-top: 15px;text-decoration: none;font-size: 15px">宿舍管理系统</a>

    <span style="font-size: 26px;position: relative;top: 5px;"></span>
    <ul class="nav navbar-nav navbar-right">
      <li >
        <a style="color: white;">欢迎${systemAdmin.name}</a>
      </li>
      <li  >
        <a href="/account?method=logout" style="color: white;">退出</a>
      </li>
    </ul>
  </div>
</nav>
<div class="container-fluid">
  <div class="row">
    <div class="col-sm-2" >

      <a href="javascript:void(0)" class="list-group-item active" onclick="change('/dormitoryAdmin?method=list',0)">
						<span class="" aria-hidden="true">
							<i class="fa fa-user-circle-o fa-fw"></i>
						</span>宿管管理
      </a>
      <a href="javascript:void(0)" class="list-group-item" onclick="change('/student?method=list',1)">
						<span class="" aria-hidden="true">
							<i class="fa fa-user-circle fa-fw"></i>
						</span>学生管理
      </a>
      <a href="javascript:void(0)" class="list-group-item" onclick="change('/building?method=list',2)">
						<span class="" aria-hidden="true">
							<i class="fa fa-home fa-fw"></i>
						</span>楼宇管理
      </a>
      <a href="javascript:void(0)" class="list-group-item" onclick="change('/dormitory?method=list',3)">
						<span class="" aria-hidden="true">
							<i class="fa fa-bed fa-fw"></i>
						</span>宿舍管理
      </a>
      <a href="javascript:void(0)" class="list-group-item" onclick="change('/moveout?method=list',4)">
						<span class="" aria-hidden="true">
							<i class="fa fa-address-card-o fa-fw"></i>
						</span>学生迁出登记
      </a>
      <a href="javascript:void(0)" class="list-group-item" onclick="change('/moveout?method=record',5)">
						<span class="" aria-hidden="true">
							<i class="fa fa-bookmark fa-fw"></i>
						</span>学生迁出记录
      </a>
      <a href="javascript:void(0)" class="list-group-item" onclick="change('/absent?method=list',6)">
						<span class="" aria-hidden="true">
							<i class="fa fa-bookmark-o fa-fw"></i>
						</span>学生缺寝记录
      </a>
        <a href="javascript:void(0)" class="list-group-item" onclick="change('/password?method=list',7)">
						<span class="" aria-hidden="true">
							<i class="fa  fa-check-square-o fa-fw"></i>
						</span>审核密码
        </a>



    </div>
    <!--右边内容-->
    <iframe style="width: 81%; height: 600px; border: 0px;" src="/dormitoryAdmin?method=list"></iframe>
  </div>
</div>

</body>
</html>
