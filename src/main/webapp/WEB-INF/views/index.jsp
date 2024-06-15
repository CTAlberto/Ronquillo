<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html class="principal">
<head>
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        body {
            margin: 0; /* Eliminar el margen predeterminado del cuerpo */
            padding: 0; /* Eliminar el relleno predeterminado del cuerpo */
            overflow: hidden; /* Evita barras de desplazamiento */
        }

        #video-background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            object-fit: cover; /* Ajustar el tamaño del video al contenedor */
            z-index: -1; /* Coloca el video detrás de otros elementos */
        }

        .container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: rgba(255, 255, 255, 0.8); /* Ajusta la opacidad del fondo */
            position: relative; /* Permite que los elementos dentro de .container se posicionen relativamente */
            z-index: 1; /* Asegura que .container esté sobre el video */
        }

        .form-field {
            margin-bottom: 15px;
        }

        .form-field label {
            display: block; /* Hace que las etiquetas aparezcan en líneas separadas */
            margin-bottom: 5px;
            font-weight: bold; /* Enfatiza las etiquetas */
        }

        .error-message {
            color: rgba(132, 21, 21);
            font-weight: bold;
        }

        .btn-secondary {
            text-align: center; /* Centra el botón de registro */
        }

        .center_div {
            text-align: center; /* Centra los elementos dentro de .container */
        }
    </style>
</head>
<body>
<!-- Contenido del formulario -->
<form action="userValidation" method="post">
    <div class="container">
        <div class="center_div">
            <div class="form-field">
                <label for="login">Nombre de usuario</label>
                <input type="text" id="login" name="login" value="" required>
            </div>
            <div class="form-field">
                <label for="password">Contraseña</label>
                <input type="password" id="password" name="password" value="" required>
            </div>
            <input type="submit" value="Iniciar Sesión" class="btn btn-primary">

            <c:if test="${param.fallo != null}">
                <p class="error-message"><br>Usuario o contraseña incorrectos</p>
            </c:if>
        </div>
    </div>
</form>
</body>
</html>
