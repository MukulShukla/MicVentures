<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Approving!</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css" rel="stylesheet"/>
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet"/>
        <link href="${pageContext.request.contextPath}/css/jquery.gridster.min.css" rel="stylesheet"/>
<script type="text/javascript">
alert("Approved!");
</script>
</head>
<body>
<header>     
               <div class="container">
                    <h3 class="pull-left">
                        <a href='Welcome.jsp'>All Drive</a>                        
                    </h3>                                        
                    <ul class="nav nav-pills pull-right">
                        <li class="active"><a href="Welcome.jsp">Home</a></li>
                        <li><a href="#">DOC</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul> 
                </div>
            </header>
<% 
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Drive", "root", "");
if (conn!=null)
{
	String id=request.getParameter("id");
	Statement stmt=conn.createStatement();
	stmt.executeUpdate("UPDATE `users` SET `approved`=1 WHERE `id`="+request.getParameter("id")+";");
	%>
	<jsp:forward page="dash.jsp" /> 
	<% 
}
else
{
out.println("FATAL DB error! Contact admin!");
}
conn.close();
%>
</body>
</html>