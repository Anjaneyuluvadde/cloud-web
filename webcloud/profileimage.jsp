<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.io.*,java.util.*" %> 
<%@ include file="connect.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PPI: Image display page</title>
</head>
<body>
<%Blob b=null;
	byte[] imgdata=null;
	int id = Integer.parseInt(request.getParameter("imgid"));
	String type=request.getParameter("type");
  	try{
	       
			Statement st=connection.createStatement();
			String strQuery = "select imagess from user where id="+id ;
			ResultSet rs = st.executeQuery(strQuery);
	
    	String imgLen="";
    	if(rs.next())
		{
      		b=rs.getBlob(1);
					imgdata=b.getBytes(1,(int)b.length());	
				}  
				
				response.setContentType("image/gif");
        OutputStream o = response.getOutputStream();
        o.write(imgdata);
        o.flush();
        o.close();
  	}
  	catch (Exception e){
    	e.printStackTrace();
  	}
%>

</body>
</html>