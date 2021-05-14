<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>欢迎进入图书管理系统</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="./view/assets/bookstrap/css/bootstrap.css">
  <script type="text/javascript" src="./view/assets/jquery-3.2.1/jquery.min.js"></script>
  <script type="text/javascript" src="./view/assets/bookstrap/js/bootstrap.js"></script>
  <script>
    $(function () {
      //修改密码
      $("#pwdButton").click(function() {
        let $oPwd = $("#oPwd").val();
        let $n1Pwd = $("#n1Pwd").val();
        let $n2Pwd = $("#n2Pwd").val();
        let $accountName = "${account.accountName}";
        //判空和两遍新密码比对
        if ($oPwd === "" ||$n1Pwd === ""
             || $n2Pwd === "" || $n1Pwd !== $n2Pwd ) {
          //显示提示信息
          $("#checkPwd").show();
          return false;
        }else {
          //组合json字符串
          /*let v={"accountName":$accountName,
            "accountPassword":$oPwd,
            "atPassword":$n1Pwd
          }*/
          /*let v={"accountPassword":$oPwd,
                 "atPassword":$n1Pwd
          }*/
          //调用Ajax
          // ajax(v);

          if(confirm("确定修改？")){
            let v={"accountPassword":$oPwd,
                   "atPassword":$n1Pwd
            }
            ajax(v);
          }
        }
        //提示密码修改成功
        // $("#pwdButton").val("密码修改成功！").removeClass("btn-info").addClass("btn-success")
        // .attr("disabled","disabled");
        return false;
      })
      //focusin可以在父元素上检测子元素获得焦点的情况(
      $("#pwdForm").focusin(function() {
        //隐藏提示信息
        $("#checkPwd").hide();
      })


      function ajax(json){
        $.ajax({
          type: "POST",
          //如果控制层的mapping路径直接写路径名（selAt），则Ajax的url要写全
          //如果控制层的mapping路径名前加/（/selAt），则Ajax的url直接写路径名
          // url: "http://localhost:8080/SSM/selAt",
          // url: "selAt",
          url: "updataAccount",
          data:JSON.stringify(json), //转成json字符串
          contentType:"application/json;charset=utf-8",//请求后台的数据类型
          dataType: 'json',  //预期服务器返回的数据类型
          //async: true,   // 默认是异步
          cache: true,   // 默认是true
          timeout:5000,  // 设置请求超时
          success : function(data) {
           /* //不管后台返回什么值，先把错误提示信息隐藏
            $("#cPwd").hide();
            //接收后台传的值
            var index = data;
            //修改成功
            if(index == "-1"){
              $("#pwdButton").val("密码修改成功！").removeClass("btn-info").addClass("btn-success")
               .attr("disabled","disabled");
            }
            //提示原密码错误
            if(index == "1"){
              $("#cPwd").show();
            }*/
            if(data.result === "true"){
              $("#pwdButton").val("密码修改成功！3秒后自动跳转！").removeClass("btn-info").addClass("btn-success")
               .attr("disabled","disabled");
              setTimeout(function(){
                window.location.href="exit";
                }, 3000);

              $("#cPwd").hide();
            }else {
              $("#cPwd").show();
            }
          },
          error : function(xhr,textStatus,error){
            // xhr包含 XMLHttpRequest 对象
            console.log("xhr"+xhr)
            // textStatus - 包含调用的状态
            console.log("textStatus"+textStatus)
            // error - 错误信息
            console.log("error"+error)
          }
        })
      }

    });
    function startTime(){
      var today=new Date();
      var f=today.getFullYear();//年
      var mo=today.getMonth()+1;//月
      var d=today.getDate();//日
      var h=today.getHours();//时
      var m=today.getMinutes();//分
      var s=today.getSeconds();//秒 在小于10的数字前加一个‘0’
      m=checkTime(m);
      s=checkTime(s);
      time=f+"年"+mo+"月"+d+"日"+" "+h+":"+m+":"+s;
      $("#time").html(time);
      t=setTimeout(function(){startTime()},500);
    }
    function checkTime(i){
      if (i<10){
        i="0" + i;
      }
      return i;
    }
  </script>
</head>
<body onload="startTime()">
<!-- 小屏幕上水平导航栏会切换为垂直的 .ml-auto(元素居右) .mr-auto(元素居左) -->
<nav class="navbar navbar-expand-sm bg-info navbar-dark">
  <a class="navbar-brand" href="#">图书管理系统</a>

  <ul class="navbar-nav ml-auto" style="margin-right: 15px">
    <li class="nav-item active">
      <a id="time" class="nav-link" href="#"></a>
    </li>
    <li class="nav-item active">
      <a class="nav-link" href="#">${account.nickName}欢迎您！</a>
    </li>
    <!-- Dropdown -->
    <li class="nav-item active dropdown ">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        系统设置
      </a>

      <div class="dropdown-menu" style="min-width:90%">
        <a class="dropdown-item" data-toggle="modal" data-target="#modifyPwd">修改密码</a>
        <a class="dropdown-item disabled" href="#">————</a>
        <a class="dropdown-item" data-toggle="modal" data-target="#logout">退出</a>
      </div>
    </li>
  </ul>
</nav>
<!-- 模态框 修改密码 start -->
<div class="modal fade" id="modifyPwd">
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- 模态框头部 -->
      <div class="modal-header">
        <h5 class="modal-title">密码修改</h5>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- 模态框主体 start-->
      <div class="modal-body" id="div1">
        <form id="pwdForm" method="post">
          <div class="form-group">
            <label for="oPwd">原密码:</label>
            <input type="password" class="form-control"  placeholder="必填"
                   id="oPwd" name="oPwd">
          </div>
          <div class="form-group">
            <label for="n1Pwd">新密码:</label>
            <input type="password" class="form-control" placeholder="必填"
                   id="n1Pwd" name="n1Pwd">
          </div>
          <div class="form-group">
            <label for="n2Pwd">新密码确认:</label>
            <input type="password" class="form-control" placeholder="必填"
                   id="n2Pwd" name="n2Pwd">
          </div>
          <div id="checkPwd" style="display: none" class="alert alert-danger  text-center">
            <strong>密码未填或两次输入密码不一致！</strong>
          </div>

          <div id="cPwd" style="display: none" class="alert alert-danger  text-center">
            <strong>原密码错误！</strong>
          </div>
          <input id="pwdButton" type="submit" class="btn  btn-block btn-primary btn-info" value="修改"/>
        </form>
      </div>
    </div>
  </div>
</div>
<!--模态框 修改密码 end-->
<!--模态框 退出 start-->
<div class="modal fade" id="logout">
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- 模态框头部 -->
      <div class="modal-header">
        <h5 class="modal-title">确定退出？</h5>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- 模态框主体 start-->
      <div class="modal-body">
        <form action="exit" method="post">
          <button type="submit" class="btn  btn-block btn-primary btn-success">退出</button>
        </form>
      </div>
    </div>
  </div>
</div>
<!--模态框 退出 end-->
<div style="margin-top: 1%">
  <!--主显示区-->
  <div class="container-fluid">
    <div class="row">
      <div class="col-lg-2">
        <div class="list-group">
                <span class="glyphicon glyphicon-home">
                <li class="list-group-item active">功能列表</li></span>
          <a href="accountList" target="mframe" class="list-group-item list-group-item-action">账户管理</a>
          <a href="booksList" target="mframe" class="list-group-item list-group-item-action">图书管理</a>
        </div>
      </div>

      <!--业务-->
      <div class="col-lg-10">
        <!--iframe-->
        <div class="embed-responsive embed-responsive-16by9">
          <iframe id="mframe" name="mframe" class="embed-responsive-item"
                  src=""/>
        </div>
        <!--iframe-->
        <!--业务-->
      </div>
    </div>
  </div>
</div>

</body>
</html>