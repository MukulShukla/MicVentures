<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Thank you!</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css" rel="stylesheet"/>
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet"/>
        <link href="${pageContext.request.contextPath}/css/jquery.gridster.min.css" rel="stylesheet"/>

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
<h1><center>Thanks a lot!<h2>for your efforts..</h2></center></h1>
<br/>
<br/>
<% 
boolean found=false;
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Drive", "root", "");
if (conn!=null)
{
	Statement stmt=conn.createStatement();
	String name=request.getParameter("name");
	String uname=request.getParameter("uname");
	String pass=request.getParameter("pass1");
	
	Statement stmt1=conn.createStatement();
	ResultSet rs=stmt1.executeQuery("Select username from `users`;");
	
	while(rs.next())
	{
		if (rs.getString("username").equals(uname))
		{
		out.println("<h3><center>The username exists! Try another one.</center></h3>");	
		found=true;	
		break;
		}
	}
	if (!found){
	stmt.executeUpdate("INSERT INTO `users`(`id`, `name`, `username`, `password`, `approved`) VALUES (0,'"+name+"','"+uname+"','"+pass+"',0);");
	out.println("<br/><center><h3>Request submitted for approval from admin. Thank you.</h3></center>");
	}}
else
{

out.println("<h2>Looks like our database is not working properly. Try again later.</h2>");
}
conn.close();
%>
</body>
</html>