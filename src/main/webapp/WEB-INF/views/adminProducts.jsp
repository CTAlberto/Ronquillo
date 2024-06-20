<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DAW
  Date: 19/06/2024
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<style>
    button {
        background-color: #4CAF50; /* Green */
        border: none;
        color: white;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
        border-radius: 35px;
    }

    button a {
        color: white;
        text-decoration: none;
        border-radius: 35px;
    }
    .entities_list{
        display: flex;
        flex-direction: column;
        margin-left: 12px;
    }
    /* Estilos generales para el contenedor de botones */
    .botones_activar_desactivar {
        display: flex; /* Activar layout flexible para los botones */
        justify-content: flex-end; /* Alinear los botones a la derecha */
        margin-bottom: 10px; /* Añadir un margen inferior para la separación */
    }

    /* Estilos para los botones individuales */
    .botones_activar_desactivar input[type="submit"] {
        margin-right: 5px; /* Añadir una pequeña separación entre botones */
    }

    /* Opcional: Estilos para los botones (puedes personalizarlos) */
    .botones_activar_desactivar .btn-danger {
        /* Estilos para el botón "Desactivar" */
    }

    .botones_activar_desactivar .btn-primary {
        /* Estilos para el botón "Activar" */
    }
    .productos {
        display: block; /* Cambiar a display: block */
        margin-right: 10px; /* Añadir un margen inferior para la separación */
    }
    .producto-card .card-title {
        font-size: 20px; /* Tamaño de fuente del título del producto */
        margin-bottom: 5px; /* Espacio entre el título del producto y el texto */
    }
    .producto-card .card-text {
        margin-bottom: 5px; /* Espacio entre los textos del producto */
    }
    .formSearch {
        display: flex;
        justify-content: flex-end; /* Alinea el contenido a la derecha */
        align-items: center;
    }
    .button-right {
        flex: 0 0 auto; /* No crecerá ni se reducirá */
    }
    .input-left {
        flex: 1; /* Ocupa todo el espacio restante */
        margin-right: 10px; /* Espacio entre el botón y la caja de búsqueda */
    }
</style>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Inventario Ronquillo</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/home">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/adminProducts">Administrar Productos<span class="sr-only">(Actual)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/addProduct">Añadir Producto<span class="sr-only"></span></a>
            </li>

        </ul>
        <form class="form-inline my-2 my-lg-0">
            <div class="formSearch">
                <div class="input-left">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                </div>
                <div class="button-right">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </div>
            </div>

        </form>
    </div>
</nav>

<c:forEach var="product" items="${productList}">
    <div class="botones_activar_desactivar">
        <form action="deactivateProduct" method="post">
            <input type="hidden" name="id" value="${product.id}">
            <div class="productos">
                <p id="${product.id}">Nombre: ${product.name} - Ubicación: ${product.type} - Cantidad: ${product.quantity} - Descripción: ${product.description} Estado: ${product.available}
                    <c:if test="${product.available == false}">
                    <input type="submit" value="Desactivar" class="btn btn-secondary"> </p>
                </c:if>
                <c:if test="${product.available == true}">
                    <input type="submit" value="Desactivar" class="btn btn-danger"> </p>
                </c:if>
            </div>
        </form>

        <form action="activateProduct" method="post">
            <input type="hidden" name="id" value="${product.id}">
            <c:if test="${product.available == true}">
                <input type="submit" value="Activar" class="btn btn-secondary">
            </c:if>
            <c:if test="${product.available == false}">
                <input type="submit" value="Activar" class="btn btn-primary">
            </c:if>

        </form>

        </form>

    </div>
</c:forEach>
</body>
</html>
