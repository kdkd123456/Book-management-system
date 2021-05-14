<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>更新账户</title>
  <link rel="stylesheet" type="text/css" href="../view/assets/bookstrap/css/bootstrap.css">
  <script type="text/javascript" src="../view/assets/jquery-3.2.1/jquery.min.js"></script>
  <script type="text/javascript" src="../view/assets/bookstrap/js/bootstrap.js"></script>
  <script>
        $(function () {
          let $accountName= false;
          let $accountPassword=false;
          let $accountPassword2=false;
          let $nickName=false;
            //当鼠标指针离开input输入框时，会发生 mouseout 事件。
            $("input").mouseout(function () {
                //判断当前input输入框的id是否等于accountName
                if($(this).attr("id")==="accountName"){
                    //当前输入框判空
                    if($(this).val()===""){
                      //提示---请填写账号！
                      $accountName= isInvalid($(this));
                    }else{
                      //提示---完成！
                      $accountName=isValid($(this));
                      checkForm($accountName,$accountPassword,$accountPassword2,$nickName);
                    }
                }

              if($(this).attr("id")==="accountPassword"){
                if($(this).val()===""){
                  $accountPassword= isInvalid($(this));
                }else{
                  $accountPassword= isValid($(this));
                  checkForm($accountName,$accountPassword,$accountPassword2,$nickName);
                }
              }

              if($(this).attr("id")==="accountPassword2"){
                if($(this).val()===""){
                  $accountPassword2= isInvalid($(this));
                }else{
                  $accountPassword2= isValid($(this));
                  checkForm($accountName,$accountPassword,$accountPassword2,$nickName);
                }
              }

              if($(this).attr("id")==="nickName"){
                if($(this).val()===""){
                  $nickName= isInvalid($(this));
                }else{
                  $nickName= isValid($(this));
                  checkForm($accountName,$accountPassword,$accountPassword2,$nickName);
                }
              }

            })

        })

        //input输入框为空并返回false
        function isInvalid(obj){
          //提交按钮不可点击
          $("#submit").attr("disabled","disabled");
          obj.removeClass("is-valid");
          obj.addClass("is-invalid");
          return false;
        }
        //input输入框不为空并返回true
        function isValid(obj){
          obj.removeClass("is-invalid");
          obj.addClass("is-valid");
          return true;
        }

        //提交按钮可以点击
        function checkForm($accountName,$accountPassword,$accountPassword2,$nickName) {
          if($accountName===true&&
             $accountPassword===true&&
             $accountPassword2===true&&
             $nickName===true){
            $accountName= $("#accountName").val();;
            $accountPassword=$("#accountPassword").val();
            $accountPassword2=$("#accountPassword2").val();
            $nickName=$("#nickName").val();
            if ($accountPassword!==$accountPassword2){
              $("#checkPwd").show();
            }else {
              $("#submit").removeAttr("disabled");
              $("#checkPwd").hide();
              sub();
            }
          }
        }
        function sub() {
          $("#succeeds").click(function () {
            $("form").submit();
            // console.log("成功！")
          })
        }
  </script>
</head>
<body style="width:98%">
<!--面包屑-->
<nav class="breadcrumb">
  <a class="breadcrumb-item" href="#">功能</a>
  <a class="breadcrumb-item" href="../accountList">账户管理</a>
  <a class="breadcrumb-item" href="#">更新账户</a>
  <a href="../accountList" class="ml-auto font-weight-bold">返回账户管理</a>
</nav>

<form class="text-center" action="../updataUser" method="get">
  <input type="hidden" id="accountId" name="accountId" value="${account.accountId}"/>
<!--  账户-->
  <div class="form-group row">
    <label for="accountName" class="col-sm-2 col-form-label ">账户:</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="accountName" id="accountName" value="${account.accountName}">
      <div class="valid-feedback">
        完成！
      </div>
      <div class="invalid-feedback">
        请填写账号！
      </div>
    </div>
  </div>

<!--  密码-->
  <div class="form-group row">
    <label for="accountPassword" class="col-sm-2 col-form-label">密码:</label>
    <div class="col-sm-4">
      <input type="password" class="form-control" name="accountPassword" id="accountPassword" placeholder="密码">
      <div class="valid-feedback">
        完成！
      </div>
      <div class="invalid-feedback">
        请填写密码！
      </div>
    </div>
  </div>

<!--  密码-->
  <div class="form-group row">
    <label for="accountPassword2" class="col-sm-2 col-form-label">再次确认密码:</label>
    <div class="col-sm-4">
      <input type="password" class="form-control" name="accountPassword2" id="accountPassword2" placeholder="再次确认密码">
      <div class="valid-feedback">
        完成！
      </div>
      <div class="invalid-feedback">
        请填写密码！
      </div>
    </div>
  </div>

<!--  昵称-->
  <div class="form-group row">
    <label for="nickName" class="col-sm-2 col-form-label">昵称:</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="nickName" id="nickName" value="${account.nickName}">
      <div class="valid-feedback">
        完成！
      </div>
      <div class="invalid-feedback">
        请填写昵称！
      </div>
    </div>
  </div>

  <div id="checkPwd" style="display: none" class="alert alert-danger  text-center">
    <strong>两次输入密码不一致！</strong>
  </div>

<!--  按钮-->
  <div class="form-group row" style="margin-right: 200px">
    <div class="col-sm-10">
      <button type="reset" class="btn btn-primary btn-outline-secondary" >重置信息</button>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;
      <a id="submit" class="btn btn-primary" disabled="disabled"  data-toggle="modal" data-target="#logout">更新账户</a>
    </div>
  </div>

</form>
<!--模态框 创建账户 start-->
<div class="modal fade" id="logout">
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- 模态框头部 -->
      <div class="modal-header">
        <h5 class="modal-title">是否更新？</h5>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- 模态框主体 start-->
      <div class="modal-body">
          <button type="button" class="btn  btn-block btn-primary btn-success" data-dismiss="modal">取消</button>
          <a id="succeeds" type="submit" class="btn  btn-block btn-primary btn-success">确定</a>
      </div>
    </div>
  </div>
</div>
<!--模态框 创建账户 end-->
</body>
</html>