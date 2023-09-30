<%-- 
    Document   : usuarioCreado
    Created on : 14 sep. 2023, 22:52:30
    Author     : Juan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ApuestaTodo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <link href="css/estiloPrincipal.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <body>
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
          <img src="img/logoAP.jpg" id = "logo-nav">
          <h1 class="navbar-apuesta">Apuesta</h1> <h1 class="navbar-todocom">todo.com</h1> 
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
              <li class="nav-item">
                <a id = "Home" class="nav-link active" aria-current="page" href="inicioSesion.jsp">Iniciar Sesion</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="new_usuarios.jsp">Crear Usuario</a>
              </li>
             
            </ul>
          </div>
        </div>
      </nav>

      <ul class="nav justify-content-center">
        <li class="nav-item">
          <a class="nav-link active" id = "link-deportes" aria-current="page" href="#">Futbol</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id = "link-deportes" href="#">Handball</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id = "link-deportes" href="#">Golf</a>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" aria-disabled="true">Disabled</a>
        </li>
      </ul>
    <body>
        
        <div id="nav-bar">
            <h1>AP</h1>  
        </div>
        
        <h1>FELICITACIONES</h1>
        <h1>SU CUENTA HA SIDO CREADA</h1>
        <h1>Gracias por unirte a la comunidad de Apuesta Todo</h1>
        <h3>Aposta con responsabilidad</h3>
        
        <a id="botonRegreso" href="${pageContext.request.contextPath}">Comenza a apostar</a>     
        
    </body>
</html>
<%@include file="componentes_html/footer.jsp"%>