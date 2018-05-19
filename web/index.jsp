<%--
  Created by IntelliJ IDEA.
  User: 26522
  Date: 2017/8/4
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html;charset=UTF-8" import="com.liu.service.*,com.liu.vo.*" language="java" %>
<html>
<head >
  <title>简易增删改查2.0</title>
  <meta charset="utf-8">
  <style>
    .username.ng-valid {
      background-color: lightgreen;
    }
    .username.ng-dirty.ng-invalid-required {
      background-color: red;
    }
    .username.ng-dirty.ng-invalid-minlength {
      background-color: yellow;
    }

    .email.ng-valid {
      background-color: lightgreen;
    }
    .email.ng-dirty.ng-invalid-required {
      background-color: red;
    }
    .email.ng-dirty.ng-invalid-email {
      background-color: yellow;
    }

  </style>
  <script type="text/javascript" src="js/jquery-1.11.0.js"></script>
  <script>
      $(function(){
          $("#add").click(function(){
              if($("#username").val()==""){
                  $("#uerror").html("必须输入用户名！");
                  return ;
              }
              if($("#password").val()==""){
                  $("#perror").html("必须输入密码！");
                  return ;
              }

              document.all.myForm.submit();
          });
      });


  </script>
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <link href="css/app.css" rel="stylesheet"/>
</head>
<body>
<div class="generic-container" >
  <div class="panel panel-default" >
    <div class="panel-heading"><span class="lead">请开始你的表演！ </span></div>
    <div class="formcontainer">

      <form  name="myForm" class="form-horizontal" id="form1"
             action="user"
             method="post">
        <%
          User user1=(User)request.getAttribute("user");
        %>

        <div class="row">
          <div class="form-group col-md-12">
            <label class="col-md-2 control-lable">姓名</label>
            <div class="col-md-7">
              <input type="hidden" name="id"
                     value='<%=user1!=null?user1.getId():""%>'/>
              <input type="hidden" name="action"
                     value="<%=user1!=null?"edit":"add"%>"/>
              <input type="text" name="username" id="username"
                     value='<%=user1!=null?user1.getUsername():""%>'
                     class="username form-control input-sm"
                     placeholder="输入你的姓名"/>
              <div class="has-error">
                <span id="uerror"></span>
              </div>
            </div>
          </div>
        </div>


        <div class="row">
          <div class="form-group col-md-12">
            <label class="col-md-2 control-lable" >密码</label>
            <div class="col-md-7">
              <input type="text" name="password" id="password"
                     value='<%=user1!=null?user1.getPassword():""%>'
                     class="password form-control input-sm"
                     placeholder="输入你的密码"
              />
              <div class="has-error" >
                <span id="perror"></span>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="form-actions floatRight">
            <input type="button" id="add"
                   value="提交"
                   class="btn btn-primary btn-sm">
            <button type="reset" id="rst"
                    class="btn btn-warning btn-sm">复原</button>
          </div>
        </div>
      </form>
    </div>
  </div>

  <div class="panel panel-default">
    <!-- Default panel contents -->
    <div class="panel-heading"><span class="lead">用户列表 </span></div>
    <div class="tablecontainer">
      <table class="table table-hover">
        <thead>
        <tr>
          <th>ID.</th>
          <th>用户名</th>
          <th>密码</th>
          <th width="20%">操作</th>
        </tr>
        </thead>
        <tbody>

        <%
          UserServiceImpl service=new UserServiceImpl();
          List<User> list=service.queryAll();
          Iterator<User> it=list.iterator();
          int id=1;
          while(it.hasNext()){
            User user=it.next();


        %>
        <tr>
          <td>
            <%=id++%>
          </td>
          <td>
            <%=user.getUsername()%>
          </td>
          <td>
            <%=user.getPassword()%>
          </td>
          <td>
            <a href="user?action=queryid&id=<%=user.getId()%>"  class="btn btn-success custom-width">编辑</a>
            <a href="user?action=del&id=<%=user.getId()%>"  class="btn btn-danger custom-width">删除</a>
          </td>
        </tr>
        <%
          }
        %>
        </tbody>
      </table>
    </div>
  </div>
</div>


</body>
</html>