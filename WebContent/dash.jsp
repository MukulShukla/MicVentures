<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hi <%=session.getAttribute("name") %></title>
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
                        <li><a href="logout.jsp">Logout!</a></li>
                    </ul> 
                </div>
            </header>
            <% 
            if(session.getAttribute("name")==null)
            {
            	%>
       		 <jsp:forward page="Welcome.jsp" />
       		<%
            	
            }
            %>
            
            <h2>Welcome <%=session.getAttribute("name") %></h2>
            <br/>
            <% 
            Class.forName("com.mysql.jdbc.Driver");
        	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Drive", "root", "");

            if (session.getAttribute("username").equals("admin"))
            {
            	out.println("<h3>User Approval</h3> <br/>");
            	Statement stmt1=conn.createStatement();
            	ResultSet rs1=stmt1.executeQuery("Select name, id from `users` where `approved`=0;");
            	
            	if(!rs1.isBeforeFirst())
            	{
            		out.println("<h4>No users are waiting approval!</h4>");
            	}
            	else
            	{
            		while (rs1.next())
            		{
            			%>
            			<form action="approve.jsp" method="post" class="form-inline">
            			<div class="form-group">
            			<label><%=rs1.getString("name")%></label>
					    </div>
            			<input type="hidden" name="id" id="id" value="<%=rs1.getInt("id")%>"/>
            			<button type="submit" class="btn btn-primary">Approve</button>
            			</form>
            			<br/>
            			<%
            		}
            	}
            	
            	
               }
            else
            { //user view
            }
            conn.close();
            %>
</body>
</html>