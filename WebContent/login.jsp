<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome</title>
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
<% 
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Drive", "root", "");
if (conn!=null)
{
	String username=request.getParameter("username");
	String pass=request.getParameter("pass");
	Statement stmt=conn.createStatement();
	ResultSet rs=stmt.executeQuery("Select * from `users` where `username`='"+username+"';");
	
	if(rs!=null && rs.next() && rs.getString("password").compareTo(pass)==0)
	{
		if (rs.getInt("approved")==0)
		{
			out.println("<br/><h2>Your registration is still under approval! Contact admin! </h2>");
		}
		else
		{
		session.setAttribute("username", username);
		session.setAttribute("name", rs.getString("name"));
		session.setAttribute("id", rs.getInt("id"));
		//session.setAttribute("no", Integer.toString(no));
		%>
		<jsp:forward page="dash.jsp" /> 
		<% 
		}
	 }
	else
	{
		%>
		 <jsp:forward page="Welcome.jsp" />
		<%
		}
}
else
{
out.println("FATAL DB error! Contact admin!");
}
conn.close();
%>
</body>
</html>