<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.io.*, java.util.*, java.net.*, java.sql.*" session="true"  %> 
<% 
Connection canal = null; 
ResultSet tabla= null; 
Statement instruccion=null; 
String strcon = "jdbc:mysql://localhost:3306/lol?user=root&password=admin"; 
String cadSQL = ""; 
int punt = 0;
int vid= 3;
int pist= 2;
int idp= 1;


try  
{ Class.forName("com.mysql.jdbc.Driver").newInstance(); 
  canal=DriverManager.getConnection(strcon); 
  instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, 
  ResultSet.CONCUR_UPDATABLE); 
} 
	catch(java.lang.ClassNotFoundException e){}
	catch(SQLException e) {}; 

	
	String usuario=request.getParameter("usuario");
	String puntaje=String.valueOf(punt);
	String vidas=String.valueOf(vid);
	String idpreg=String .valueOf(idp);

	HttpSession  sesionOK=request.getSession();
	sesionOK.setAttribute("usuario", usuario);
	sesionOK.setAttribute("puntaje", puntaje);
	sesionOK.setAttribute("vidas", vidas);
	sesionOK.setAttribute("idpregunta", idpreg);
	
	
	out.println("<p align=right>" + usuario);
	out.println("<br>");
	out.println("<p align=right>puntaje "+ puntaje);
	out.println("</p>");
	
	out.println("<center>");
	out.println("<h1>comencemos</h1>");
	out.println("<form action=juego.jsp>");
	out.println("<input type=submit value=jugar>");
	out.println("</form>");
	out.println("</center>");

%>
</body>
</html>