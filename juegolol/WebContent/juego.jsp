<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/estilo.css">
</head>
<body>
<script>
	function alerta(a)
	{
		var d = document.getElementById("res")
		if(a==d.value)
			{
			alert("correcto");
			document.getElementById("res").value="correcto";
				
			}
		else
			{
			alert("incorrecto");
			document.getElementById("res").value="incorrecto";
			}
		
		
		
		
	}
</script>

<%@ page import="java.io.*, java.util.*, java.net.*, java.sql.*" session="true"  %> 
<% 
Connection canal = null; 
ResultSet tabla= null; 
Statement instruccion=null; 
String strcon = "jdbc:mysql://localhost:3306/lol?user=root&password=admin"; 
String cadSQL = ""; 


    String respuesta = request.getParameter("res");
    out.println(respuesta);
    
    if(respuesta!=null)
    {
    	HttpSession  sesionOK=request.getSession();
    	if(respuesta.equals("correcto"))			
    	{
    	
    		String punt=(String) 	sesionOK.getAttribute("puntaje");
    		 String idpregunta=(String) 	sesionOK.getAttribute("idpregunta");
    		int puntaje=Integer.parseInt(punt);
    		int idp=Integer.parseInt(idpregunta);
    			 puntaje = puntaje + 10;
    			 idp = idp + 1;
    				String p=String.valueOf(puntaje);
    				sesionOK.setAttribute("puntaje", p); 	
    				
    	}			
    	else
    	{
    		
			 String v=(String) 	sesionOK.getAttribute("vidas");
			 int vidas=Integer.parseInt(v);
			 vidas = vidas - 1;
			 String vid=String.valueOf(vidas);
			 sesionOK.setAttribute("vidas", vid);
    	}
    }
    else
    { 	
    		HttpSession  sesionOK=request.getSession();
   			 String usuario=(String)	sesionOK.getAttribute("usuario");
   			String punt=(String) 	sesionOK.getAttribute("puntaje");
   			 String vid=(String) 	sesionOK.getAttribute("vidas");
   			 String idpregunta=(String) 	sesionOK.getAttribute("idpregunta");
       
   	 
   			 int puntaje=Integer.parseInt(punt);
   				int vidas=Integer.parseInt(vid);
   				int idp=Integer.parseInt(idpregunta);
   		
   				try  
   				{ Class.forName("com.mysql.jdbc.Driver").newInstance(); 
   				  canal=DriverManager.getConnection(strcon); 
   				  instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, 
   				  ResultSet.CONCUR_UPDATABLE); 
   				} 
   					catch(java.lang.ClassNotFoundException e){}
   					catch(SQLException e) {}; 
   			

   					cadSQL="Select pregunta,respuesta from preguntas where numpreg='"+idp+"'";
   	
   			try{
   				tabla=instruccion.executeQuery(cadSQL);
   	
  			 	}catch(SQLException e) {};
   				if(tabla.next())
   				{
   	
   					%>
   				<form action="juego.jsp">
   				<div class="cuadrog">
    		  		 <div class="lista">
   	      		  <div class="cont">
        	       <div class="datos">
                  <b> Player: </b><%out.println(usuario); %>
        	       </div>
       	        <div class="datos2">
                  <b> Score: </b><%out.println(puntaje); %>
               </div>
               <div class="datos2">
                  <b> Lives: </b><%out.println(vidas); %>
       		        </div>
       			    </div>
     			  </div>
       
      		 <div class="cuadrog2">
           <div class="nombres"><b>Enigma N°</b><%out.println(idp);%></div>
           <div class="cp"><%=tabla.getString(1)%></div>
       	
           <div class="nombres"><b>Respuesta</b></div>
           <div class="cp2"><input type=text name="res" id="res"></div>
           
            <div class="cp"><%=tabla.getString(2)%></div>
           <input type="submit" id="send" style="display: none;">
           <label for="send"><div class="verificar" onclick="alerta('<%=tabla.getString(2)%>')"><label for="send">Verificar</label></div></label>
           
        
     		  </div>
   			    <div class="logo"></div>
 			  </div>
			   </form>
		   	<%
   		
   		
  	 		}
    	
    }
	HttpSession  sesionOK=request.getSession();
	 String usuario=(String)	sesionOK.getAttribute("usuario");
	String punt=(String) 	sesionOK.getAttribute("puntaje");
	 String vid=(String) 	sesionOK.getAttribute("vidas");
	 String idpregunta=(String) 	sesionOK.getAttribute("idpregunta");
    
	 
	 int puntaje=Integer.parseInt(punt);
		int vidas=Integer.parseInt(vid);
		int idp=Integer.parseInt(idpregunta);
		
		try  
		{ Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		  canal=DriverManager.getConnection(strcon); 
		  instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, 
		  ResultSet.CONCUR_UPDATABLE); 
		} 
			catch(java.lang.ClassNotFoundException e){}
			catch(SQLException e) {}; 
			
			
	cadSQL="Select pregunta,respuesta from preguntas where numpreg='"+idp+"'";
	out.println(cadSQL);
	idp= idp + 1;
	out.println(idp);
	
	try{
		tabla=instruccion.executeQuery(cadSQL);
	
	}catch(SQLException e) {};
	if(tabla.next())
	{
	
		%>
		<form action="juego.jsp">
		<div class="cuadrog">
   		 <div class="lista">
        <div class="cont">
            <div class="datos">
               <b> Player: </b><%out.println(usuario); %>
            </div>
            <div class="datos2">
               <b> Score: </b><%out.println(puntaje); %>
            </div>
            <div class="datos2">
               <b> Lives: </b><%out.println(vidas); %>
            </div>
        </div>
    </div>
    
    <div class="cuadrog2">
        <div class="nombres"><b>Enigma N°</b><%out.println(idp);%></div>
        <div class="cp"><%=tabla.getString(1)%></div>
    	
        <div class="nombres"><b>Respuesta</b></div>
        <div class="cp2"><input type=text name="res" id="res"></div>
        
         <div class="cp"><%=tabla.getString(2)%></div>
        <input type="submit" id="send" style="display: none;">
        <label for="send"><div class="verificar" onclick="alerta('<%=tabla.getString(2)%>')"><label for="send">Verificar</label></div></label>
        
     
    </div>
    <div class="logo"></div>
</div>
</form>
	<%
		
		
	}
			//	HttpSession  sesionOK=request.getSession();
    		//	String p=(String) 	sesionOK.getAttribute("puntaje");
    		//	 int puntaje=Integer.parseInt(p);
    		//	 puntaje = puntaje + 10;
    		//		String punt=String.valueOf(puntaje);
    		//		sesionOK.setAttribute("puntaje", puntaje);
    		
    		//HttpSession  sesionOK=request.getSession();
			 //String v=(String) 	sesionOK.getAttribute("vidas");
			 //int vidas=Integer.parseInt(v);
			// vidas = vidas - 1;
			// String vid=String.valueOf(vidas);
			 //sesionOK.setAttribute("vidas", vidas);
 	   
	%>
	
</body>
</html>