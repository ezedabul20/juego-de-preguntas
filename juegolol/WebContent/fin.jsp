<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="estilo.css">
</head>
<body>
<%@ page import="java.io.*, java.util.*, java.net.*, java.sql.*" session="true"  %> 

<% 
Connection canal = null; 
ResultSet tabla= null; 
Statement instruccion=null; 
String strcon = "jdbc:mysql://localhost:3306/lol?user=root&password=admin"; 
String cadSQL = "";





	try  
	{ Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	  canal=DriverManager.getConnection(strcon); 
	  instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, 
	  ResultSet.CONCUR_UPDATABLE); 
	} 
		catch(java.lang.ClassNotFoundException e){}
		catch(SQLException e) {}; 

		HttpSession  sesionOK=request.getSession();

		 String user=(String)	sesionOK.getAttribute("usuario");
			String score=(String) 	sesionOK.getAttribute("puntaje");
			
			cadSQL="INSERT INTO puntaje(usuario,puntaje) VALUES('"+user+"','"+score+"')";
			
			
			try 
			{
				int n=instruccion.executeUpdate(cadSQL);
			}
			catch(SQLException e) {}; 

			 	sesionOK.invalidate();
			 	%>
<form action=ingreso.jsp>
	<div class="cuadrog">
    <div class="lista">
        <div class="cont">
        </div>
    </div>
    
    <div class="cuadrog2">
        <h1><center><font color="white">Fin Del Juego</center></h1></font>
        <br>
        <br>
       <center><input type=submit value=cerrar></center>
        <br>
        <br>
        </form>
         <form action=lista.jsp>
        <br>
        <br>
       <center><input type=submit value=lista></center>
        </form>
    </div>
     
    <div class="logo"></div>
</div>
	
			 	
			 	
			 	
			
	<% 		    
%>
</body>
</html>