<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>新增图书</title>
  <link rel="stylesheet" type="text/css" href="../view/assets/bookstrap/css/bootstrap.css">
  <script type="text/javascript" src="../view/assets/jquery-3.2.1/jquery.min.js"></script>
  <script type="text/javascript" src="../view/assets/bookstrap/js/bootstrap.js"></script>
  <script src="../view/assets/My97DatePicker/4.8/WdatePicker.js"></script>
<script>
    $(function(){
      let $bname= false;
      let $bprice=false;
      let $bpublisher=false;
      let $bpublishdate=false;
         $("input").mouseout(function(){
           if($(this).attr("id")==="bname"){
             if($(this).val()===""){
               $bname= isInvalid($(this));
             }else{
               $bname=isValid($(this));
               checkForm($bname,$bprice,$bpublisher,$bpublishdate);
             }
           }

           if($(this).attr("id")==="bprice"){
             let reg=/^[^0]\d*.\d{2}$/;
             if(reg.test($(this).val())!==true){
               $bookPrice= isInvalid($(this));
             }else{
               $bookPrice=isValid($(this));
               checkForm($bname,$bprice,$bpublisher,$bpublishdate);
             }
           }
          });

         $("#bpublishdate").focusin(function(){
               if($(this).val()===""){
                 $bpublishDate= isInvalid($(this));
               }else{
                 $bpublishDate=isValid($(this));
                 checkForm($bname,$bprice,$bpublisher,$bpublishdate);
               }
         })

         $("#bpublisher").mouseout(function(){
            if($(this).val()===""){
              $bpublisher= isInvalid($(this));
            }else{
              $bpublisher=isValid($(this));
              checkForm($bname,$bprice,$bpublisher,$bpublishdate);
            }

         })
      $("#succeeds").click(function () {
        $("form").submit();
        // console.log("成功！")
      })

    })
    function isInvalid(obj){
      $("#submit").attr("disabled","disabled");
      obj.removeClass("is-valid");
      obj.addClass("is-invalid");
      return false;
    }
    function isValid(obj){
      obj.removeClass("is-invalid");
      obj.addClass("is-valid");
      return true;
    }

    function checkForm($bname,$bprice,$bpublisher,$bpublishdate) {
      if ($bname === true &&
          $bprice === true &&
          $bpublisher === true &&
          $bpublishdate === true) {
        $("#submit").removeAttr("disabled");
      }
    }


</script>

</head>
<body style="width:98%">
<!--面包屑-->
<nav class="breadcrumb">
  <a class="breadcrumb-item" href="#">功能</a>
  <a class="breadcrumb-item" href="../booksList">图书管理</a>
  <a class="breadcrumb-item" href="#">更新图书</a>
  <a href="../booksList" class="ml-auto font-weight-bold">返回图书管理</a>
</nav>


<form class="text-center" action="../updataBook" method="get">
  <input type="hidden" id="accountId" name="accountId" value="${account.accountId}"/>
  <input type="hidden" id="bid" name="bid" value="${book.bid}"/>
  <div class="form-group row">
    <label for="bname" class="col-sm-2 col-form-label ">书名:</label>
    <div class="col-sm-4">
      <input value="${book.bname}" type="text" class="form-control" name="bname" id="bname">
      <div class="valid-feedback">
        完成！
      </div>
      <div class="invalid-feedback">
        请填写书名！
      </div>
    </div>
  </div>
  <div class="form-group row">
    <label for="bprice" class="col-sm-2 col-form-label">价格:</label>
    <div class="col-sm-4">
      <input value="${book.bprice}" type="text" class="form-control" name="bprice" id="bprice"
        完成！
      </div>
      <div class="invalid-feedback">
        请填写价格或第一位非零只保留两位小数！
      </div>
    </div>
  </div>



  <div class="form-group row">
    <label for="bpublisher" class="col-sm-2 col-form-label">出版社:</label>
    <div class="col-sm-4">
      <select class="form-control" id="bpublisher" name="bpublisher">
        <option value="">选择出版</option>
        <option value="1" <c:if test="${book.bpublisher==1}">selected</c:if>>人民邮电出版社</option>
        <option value="2"<c:if test="${book.bpublisher==2}">selected</c:if>>清华大学出版社</option>
      </select>
      <div class="valid-feedback">
        完成！
      </div>
      <div class="invalid-feedback">
        请选择出版社！
      </div>
    </div>
  </div>

  <div class="form-group row">
    <label for="bpublishdate" class="col-sm-2 col-form-label">出版日期:</label>
    <div class="col-sm-4">
      <input value="${book.bpublishdate}" type="text" id="bpublishdate" name="bpublishdate" class="form-control"
             onfocus="WdatePicker({})"  />
      <div class="valid-feedback">
        完成！
      </div>
      <div class="invalid-feedback">
        请输入出版日期！
      </div>
    </div>
  </div>

  <div class="form-group row" style="margin-right: 200px">
    <div class="col-sm-10">
      <button type="reset" class="btn btn-primary btn-outline-secondary" >重置</button>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;
      <a id="submit" class="btn btn-primary" disabled="disabled"  data-toggle="modal" data-target="#logout">提交</a>
    </div>
  </div>
</form>
<!--模态框 创建账户 start-->
<div class="modal fade" id="logout">
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- 模态框头部 -->
      <div class="modal-header">
        <h5 class="modal-title">是否添加？</h5>
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