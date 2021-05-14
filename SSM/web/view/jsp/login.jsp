
<%--
  Created by IntelliJ IDEA.
  User: Zi
  Date: 2020/12/9
  Time: 9:53
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="./view/assets/bookstrap/css/bootstrap.css">
    <script type="text/javascript" src="./view/assets/jquery-3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="./view/assets/bookstrap/js/bootstrap.js"></script>

    <script>
        $(function () {
            $("form").submit(function () {
                let $atn = $("#accountName");
                let $atp = $("#accountPassword");
                if ($atn.val() ===""){
                    $atn.addClass("is-invalid");
                }
                if ($atp.val() ===""){
                    $atp.addClass("is-invalid");
                }
                return !($atn.val()==="" || $atp.val()==="");
            })

           var errorMsg = "${errorMsg}";
                if (errorMsg === "-1"){
                    $("#checkForm").show();
                }
                if (errorMsg !== "-1"){
                    $("#checkForm").hide();
                }
            /*if (errorMsg === "-1"){
                    $("button").click($(function () {
                        $("#checkForm").attr("style","display: black");
                    }));
                }*/

        })
    </script>
</head>

<body  style="background-color: #f0f8ff">
<div class="m-auto container">
    <div class="card" style="width: 25rem;margin-left: 33%;margin-top: 14%">
        <div class="card-header">图书管理系统</div>
        <div class="card-body">
            <form action="login" method="post">
                <div class="form-group">
                    <label for="accountPassword" style="display:none"></label>
                    <input type="text" class="form-control" id="accountName" name="accountName"
                           placeholder="用户名"/>
                    <div id="div1" class="invalid-feedback" >
                        <strong>请输入账户名!</strong>
                    </div>
                </div>
                <div class="form-group">
                    <label for="accountPassword" style="display:none"></label>
                    <!-- is-invalid为红色，is-valid为绿色         -->
                    <input type="password" class="form-control" id="accountPassword" name="accountPassword"
                           placeholder="密码"/>
                    <!-- valid-feedback为绿色，invalid-feedback为红色         -->
                    <div id="div2" class="invalid-feedback ">
                        <strong>请输入密码!</strong>
                    </div>
                </div>
                <!--display: block; block为显示，none为不显示-->
                <div id="checkForm" style="display: none" class="alert alert-danger  text-center">
                    <strong>账户和密码错误，请重新填写！</strong>
                </div>

                <%--<div id="checkForm" style="display:
                    <c:choose>
                        <c:when test="${errorMsg == '-1'}">block</c:when>
                        <c:otherwise>none</c:otherwise>
                    </c:choose>
                 " class="alert alert-danger  text-center">
                    <strong>账户和密码错误，请重新填写！</strong>
                </div>--%>
                <button type="submit" class="btn btn-lg btn-block btn-primary btn-success">登录</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
