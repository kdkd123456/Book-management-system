<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>导航栏</title>
  <link rel="stylesheet" type="text/css" href="./view/assets/bookstrap/css/bootstrap.css">
  <script type="text/javascript" src="./view/assets/jquery-3.2.1/jquery.min.js"></script>
  <script type="text/javascript" src="./view/assets/bookstrap/js/bootstrap.js"></script>
  <script src="./view/assets/My97DatePicker/4.8/WdatePicker.js"></script>
  <script>
    $(function(){
      $("button").click(function(){
        let bid=$(this).attr("value");//取得id
        //更新
        if($(this).attr("class").indexOf("info")!==-1){
          <!--访问账户预览控制器-->
          window.location.href="previewBook/"+bid
        }else{
          //条件查询
          if($(this).attr("class").indexOf("primary")!==-1){
            $("form").submit();
          }else{
            //删除
            if(confirm("确定删除？")){
              <!--ajax请求删除-->
              ajax(bid);
              $(this).parents("tr").remove();
            }
          }
        }
      });
      $("a").click(function () {
        $("#page").val($(this).attr("title"));
        $("form").submit();
      });

      function ajax(bid) {
        $.ajax({
          type:"GET",     //请求参数
          url:"deletebook/"+bid,
          /* data:JSON.stringify(id), //转成json字符串
           contentType:"application/json;charset=utf-8",//请求后台的数据类型
           dataType: 'json',  //预期服务器返回的数据类型*/
          //async:true,   //默认是异步
          dataType: 'text',
          cache:true,     //默认是true
          timeout:5000,   //设置请求超时
          success:function (data) {
            // console.log(data);

          },
          error:function (xhr,textStatus,error) {
            console.log("xhr"+xhr);
            console.log("textStatus"+textStatus);
            console.log("error"+error);
          }
        })
      }

    })
  </script>
</head>
<body>

<!--面包屑-->
<nav class="breadcrumb">
  <a class="breadcrumb-item" href="#">功能</a>
  <a class="breadcrumb-item" href="#">图书管理</a>
  <a href="createBooks" class="ml-auto font-weight-bold">新增图书</a>
</nav>
<!--业务 start-->
<div class="card" >
  <div class="card-body">
    <form class="form-inline" action="booksList" method="get">
      <input type="hidden" id="page" name="page"/>
      <label for="bookName">书名:&nbsp;&nbsp;</label>
      <input type="text" value="${bookName}" class="form-control" name="bookName" id="bookName" placeholder="书名">
      <label for="publisher">&nbsp;&nbsp;出版社:&nbsp;&nbsp;</label>
      <select class="form-control " id="publisher" name="publisher">
        <option value="">选择出版</option>
          <option value="1" <c:if test="${publisher==1}">selected</c:if>>人民邮电出版社</option>
        <option value="2" <c:if test="${publisher==2}">selected</c:if>>清华大学出版社</option>
      </select>

      <label for="publishDateStart" >&nbsp;出版日期：</label>
      <input type="text" value="${publishDateStart}" id="publishDateStart" name="publishDateStart" class="col-sm-2 form-control"
             onfocus="WdatePicker({})" placeholder="开始" />
      <label for="publishDateEnd" >-</label>
      <input type="text" value="${publishDateEnd}" id="publishDateEnd" name="publishDateEnd" class="col-sm-2 form-control"
             onfocus="WdatePicker({  minDate:'#F{$dp.$D(\'publishDateStart\',{d:1})}'  })" placeholder="结束" />

<%--      <div style="margin-top: 10px;" class="offset-md-5">--%>
      <div style="margin-left: 10px;">
       <button type="submit" class="btn btn-primary btn-group-sm">搜索</button>
      <input type="reset" class="btn btn-outline-secondary btn-group-sm" style="margin-left: 20px"></input>
      </div>
    </form>

  </div>
</div>
<div>
  <table class="table table-bordered table-hover table-sm table-striped"
         style="margin-top: 20px">
    <thead>
    <tr class="text-center">
      <th>序号</th>
      <th>书名</th>
      <th>价格</th>
      <th>出版社</th>
      <th>出版日期</th>
      <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${books}" var="books" varStatus="status">
      <tr class="text-center" id="1">
        <td>${status.count}</td>
        <td>${books.bname}</td>
        <td>${books.bprice}</td>
        <td><c:choose><c:when test="${books.bpublisher==1}">人民邮电出版社</c:when><c:otherwise>清华大学出版社</c:otherwise></c:choose></td>
        <td>${books.bpublishdate}</td>
        <td>
          <button value="${books.bid}" class="btn btn-outline-info btn-sm">更新</button>
          &nbsp;&nbsp;&nbsp;&nbsp;
          <button value="${books.bid}" type="button" class="btn btn-outline-danger btn-sm">删除</button>
        </td>
      </tr>
    </c:forEach>

    </tbody>
  </table>
</div>
<!--业务 end-->
<!--分页 start-->

<div class="float-right">
  <ul class="pagination pagination-sm">
    <li class="page-item"><a title="1" class="page-link" href="#">首页</a></li>
    <li class="page-item"><a title="<c:choose><c:when test="${page-1 ==0}">1</c:when><c:otherwise>${page-1}</c:otherwise></c:choose>" class="page-link" href="#">&laquo;</a></li>
    <li class="page-item"><a title="<c:choose><c:when test="${page+1>totalPage}">${totalPage}</c:when><c:otherwise>${page+1}</c:otherwise></c:choose>" class="page-link" href="#">&raquo;</a></li>
    <li class="page-item"><a title="${totalPage}" class="page-link" href="#">末页</a></li>
    <li class="page-item">
      <a class="page-link">第${page}页/共${totalPage}页</a>
    </li>
  </ul>
</div>
<!--分页 end-->
<!-- 页底 -->
<nav class="navbar navbar-expand-sm  fixed-bottom ">
  <ul class="navbar-nav" style="margin-left:35%">
    <li class="nav-item">
      <a class="nav-link">Copyright &copy; 2020-2021</a>
    </li>
  </ul>
</nav>
</body>
</html>