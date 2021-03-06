<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="sv.edu.udb.www.beans.Opcion"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cambiar Contraseņa</title>
        <%@ include file='/Utils/ImportCSS.jsp' %>
        <style>
            .map-container{
                overflow:hidden;
                padding-bottom:56.25%;
                position:relative;
                height:0;
            }
            .map-container iframe{
                left:0;
                top:0;
                height:100%;
                width:100%;
                position:absolute;
            }
            </style>
    </head>
  <body class="lighten-3">
    <!-- Sidebar -->
    <div class="sidebar-fixed position-fixed">
      <a class="logo-wrapper waves-effect">
        <img src="https://mdbootstrap.com/img/logo/mdb-email.png" class="img-fluid" alt="">
      </a>
          <div class="list-group list-group-flush">
      		<%  List<Opcion> opciones = (List<Opcion>) request.getAttribute("Opciones");
					for(Opcion opcion: opciones){
				%>
				 		<a href="<%=opcion.getURL() %>" class="list-group-item <% if(opcion.isIsActive()){ out.print("active");}else{ out.print("list-group-item-action");}%>  waves-effect">
			            	<i class="<%=opcion.getIcon()%> mr-3"></i><%=opcion.getNombre()%>
			        	</a>
				<%
					}
				%>
     	  </div>
    </div>
    <!-- Sidebar -->

  <!--Main layout-->
  <main class="pt-5 mx-lg-5 bg-white">
    <div class="container-fluid w-50 mt-5">
    
    
     <form action="<c:out value="${requestScope.Path}"/>" method="post">
            <table border="0" cellspacing="2" cellpadding="5">
                       <h2>Cambiar contraseņa</h2>
                  <div class="md-form">
	                   <label for="email">Ingrese la antigua contraseņa:</label>
	                   <input type="password" class="form-control" id="email" name="OldPass">
                 </div>
                  <div class="md-form">
	                   <label for="email">Ingrese la nueva contraseņa:</label>
	                   <input type="password" class="form-control" id="email" name="NewPass1">
                 </div>
                 <div class="md-form">
                   <label for="pwd">Vuelva a escribir la contraseņa:</label>
                   <input type="password" class="form-control" id="pwd" name="NewPass2">
                 </div>
                    <tr>
                        <td><input type="submit" class="btn btn-success" value="Cambiar"/></td>
                        <td><input type="reset" class="btn btn-warning" value="Limpiar"/></td>
                        
                    </tr>
                    <tr>
                        <td><label></label></td>
                        <td><input  type="text" value="<c:out value="${cookie.idEmpleado.value}"/>" style="visibility:hidden" name="id"/></td>
                    </tr>
                </tbody>
            </table>
        </form>
        
        	<c:if test="${not empty requestScope.message}">
	        	<div class="alert alert-warning">
	            	<c:out value="${requestScope.message}" />
	             </div>
        	</c:if>
       
    </div>
  </main>
<footer>
	<%@ include file='/Utils/ImportJS.jsp' %>
</footer>
    </body>
</html>