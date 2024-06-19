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
    .quantity-selector {
        display: flex;
        align-items: center;
    }

    button {
        padding: 10px;
        font-size: 16px;
        cursor: pointer;
    }

    input.quantity {
        width: 50px;
        text-align: center;
        font-size: 16px;
        border: 1px solid #ccc;
        margin: 0 5px;
        border-radius: 4px;
    }
    .product-form{
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .add-product-form {
        display: flex;
        justify-content: center;
        align-items: center;
        }

    .full-screen-div {
        width: auto;
        height: auto;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .content {
        text-align: center; /* Alineación de texto opcional */
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
<h2>Lista de productos:</h2>
<div class="full-screen-div">
    <div class="content">
        <div class="product-form">
            <form class="add-product-form" action="addProduct" method="post">
                <button type="submit" class="btn btn-primary">Añadir Producto</button>
            </form>
        </div>
    </div>
</div>
<div class="block-list">
    <div class="row mt-4">
        <c:forEach var="product" items="${productList}" varStatus="loop">
            <div class="col-md-4">
                <div class="producto-card">
                    <h4 class="card-title">${product.name}</h4>
                    <p>${product.description}</p>

                    <div class="btn-group">

                    </div>
                    <div class="btn-group">
                        <button class="btn btn-sm btn-primary" onclick="restarCantidad(${loop.index})">-</button>
                        <input id="cantidad-${loop.index}" type="text" class="form-control" value="${product.quantity}">
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
