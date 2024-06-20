<%--
  Created by IntelliJ IDEA.
  User: alberto
  Date: 18/06/2024
  Time: 12:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<head>
    <title>Inventario Ronquillo</title>
</head>
<style>
    .block-list{
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        margin-left: 10%;
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

<script>
    function restarCantidad(index) {
        var cantidadInput = document.getElementById("cantidad-" + index);
        var cantidad = parseInt(cantidadInput.value);
        if (cantidad > 1) {
            cantidadInput.value = cantidad - 1;
        }
    }

    function sumarCantidad(index) {
        var cantidadInput = document.getElementById("cantidad-" + index);
        var cantidad = parseInt(cantidadInput.value);
        cantidadInput.value = cantidad + 1;
    }
    function setCantidad(index) {
        var cantidadInput = document.getElementById("cantidad-" + index);
        var formCantidadInput = document.getElementById("form-cantidad-" + index);
        formCantidadInput.value = cantidadInput.value;
        return true;
    }

</script>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Inventario Ronquillo</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/home">Home <span class="sr-only">(Actual)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/adminProducts">Administrar Productos</a>
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
<form class="optionPanel" method="get" action="listProducts">
    <select class="form-select" aria-label="Default select example">
        <option selected>Selecciona ubicación</option>
        <option value="nevera">Nevera</option>
        <option value="congelador">Congelador</option>
        <option value="despensa">Despensa</option>
        <option value="bebidas">Bebidas</option>
        <option value="limpieza">Limpieza</option>
    </select>
</form>
<div class="btn-addProduct">
    <a href="addProduct" methods="get" class="btn btn-primary">Agregar Producto</a>
</div>
<div class="block-list">
    <div class="row mt-4">
        <c:forEach var="product" items="${productList}" varStatus="loop">
            <div class="col-md-4">
                <div class="producto-card">
                    <h4 class="card-title">${product.name}</h4>
                    <b>${product.type}</b>
                    <p>${product.description}</p>

                    <div class="btn-group">

                    </div>
                    <div class="btn-group">
                        <button class="btn btn-sm btn-primary" onclick="restarCantidad(${loop.index})">-</button>
                        <input id="cantidad-${loop.index}" type="text" class="form-control" value="${product.quantity}" min="0">
                        <button class="btn btn-sm btn-primary" onclick="sumarCantidad(${loop.index})">+</button>
                    </div>
                    <form action="modifyQuantity" method="post" class="mt-2">
                        <input type="hidden" name="productId" value="${product.id}">
                        <input type="hidden" name="quantity" id="form-cantidad-${loop.index}">
                        <button type="submit" class="btn btn-success" onclick="return setCantidad(${loop.index})">Modificar Cantidad</button>
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>

</div>

</body>
</html>
