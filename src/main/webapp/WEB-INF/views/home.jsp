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
    .image-type{
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .type-text{
        flex:1;
    }
    .image-svg{
        flex:1;
    }
    nav :hover{
        border-radius: 15px;
        background-color: #d7d5d5;
    }
    .producto-card{
        padding: 10px;
        margin-bottom: 10px;

    }
    .producto-card{
        transition: transform 0.3s ease; /* Animación suave */
    }

    .producto-card:hover {
        transform: scale(1.15); /* Escalar el elemento al 120% de su tamaño original */
    }
    .inline-quantity-quantityType{
        display: flex;
        justify-content: space-between;
        align-items: center;

    }
    .btn-group{
        flex: 1;
    }
    .quantityType-view{
        flex: 1;
        margin-top: 10px;
        margin-left: 10px;
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
                    <a class="nav-link" href="/home"><b>Home</b> <span class="sr-only">(Actual)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/adminProducts">Administrar Productos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/addProduct">Añadir Producto<span class="sr-only"></span></a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0" action="searchProduct" method="post">
                <div class="formSearch">
                    <div class="input-left">
                        <input class="form-control mr-sm-2" type="search" name="name" placeholder="Search" aria-label="Search">
                    </div>
                    <div class="button-right">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </div>
                </div>

            </form>
        </div>
    </nav>
<form class="optionPanel" method="get" action="/home">
    <select class="form-select" aria-label="Default select example" name="type" onchange="this.form.submit()">
        <option selected>Selecciona ubicación</option>
        <option value="nevera">Nevera</option>
        <option value="congelador">Congelador</option>
        <option value="despensa">Despensa</option>
        <option value="bebidas">Bebidas</option>
        <option value="limpieza">Limpieza</option>
        <option value="true">Todos</option>
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
                    <div class="image-type">
                        <div class="type-text">
                            <b>${product.type.toUpperCase()}</b>
                        </div>
                        <div class="image-svg">
                            <div class="producto-image">
                                <c:if test="${product.type == 'nevera'}">

                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-fridge" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#2c3e50" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                        <path d="M5 3m0 2a2 2 0 0 1 2 -2h10a2 2 0 0 1 2 2v14a2 2 0 0 1 -2 2h-10a2 2 0 0 1 -2 -2z" />
                                        <path d="M5 10h14" />
                                        <path d="M9 13v3" />
                                        <path d="M9 6v1" />
                                    </svg>
                                </c:if>
                                <c:if test="${product.type == 'congelador'}">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-snowflake" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#2c3e50" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                        <path d="M10 4l2 1l2 -1" />
                                        <path d="M12 2v6.5l3 1.72" />
                                        <path d="M17.928 6.268l.134 2.232l1.866 1.232" />
                                        <path d="M20.66 7l-5.629 3.25l.01 3.458" />
                                        <path d="M19.928 14.268l-1.866 1.232l-.134 2.232" />
                                        <path d="M20.66 17l-5.629 -3.25l-2.99 1.738" />
                                        <path d="M14 20l-2 -1l-2 1" />
                                        <path d="M12 22v-6.5l-3 -1.72" />
                                        <path d="M6.072 17.732l-.134 -2.232l-1.866 -1.232" />
                                        <path d="M3.34 17l5.629 -3.25l-.01 -3.458" />
                                        <path d="M4.072 9.732l1.866 -1.232l.134 -2.232" />
                                        <path d="M3.34 7l5.629 3.25l2.99 -1.738" />
                                    </svg>
                                </c:if>
                                <c:if test="${product.type == 'limpieza'}">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-wash-machine" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#2c3e50" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                        <path d="M5 3m0 2a2 2 0 0 1 2 -2h10a2 2 0 0 1 2 2v14a2 2 0 0 1 -2 2h-10a2 2 0 0 1 -2 -2z" />
                                        <path d="M12 14m-4 0a4 4 0 1 0 8 0a4 4 0 1 0 -8 0" />
                                        <path d="M8 6h.01" />
                                        <path d="M11 6h.01" />
                                        <path d="M14 6h2" />
                                        <path d="M8 14c1.333 -.667 2.667 -.667 4 0c1.333 .667 2.667 .667 4 0" />
                                    </svg>
                                </c:if>
                                <c:if test="${product.type == 'bebidas'}">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-beer" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#2c3e50" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                        <path d="M9 21h6a1 1 0 0 0 1 -1v-3.625c0 -1.397 .29 -2.775 .845 -4.025l.31 -.7c.556 -1.25 .845 -2.253 .845 -3.65v-4a1 1 0 0 0 -1 -1h-10a1 1 0 0 0 -1 1v4c0 1.397 .29 2.4 .845 3.65l.31 .7a9.931 9.931 0 0 1 .845 4.025v3.625a1 1 0 0 0 1 1z" />
                                        <path d="M6 8h12" />
                                    </svg>
                                </c:if>
                                <c:if test="${product.type == 'despensa'}">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-door" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#2c3e50" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                        <path d="M14 12v.01" />
                                        <path d="M3 21h18" />
                                        <path d="M6 21v-16a2 2 0 0 1 2 -2h8a2 2 0 0 1 2 2v16" />
                                    </svg>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <p>${product.description}</p>
                    <div class="btn-group">

                    </div>
                    <div class="inline-quantity-quantityType">
                        <div class="btn-group">
                            <button class="btn btn-sm btn-primary" onclick="restarCantidad(${loop.index})">-</button>
                            <input id="cantidad-${loop.index}" type="text" class="form-control" value="${product.quantity}" min="0">
                            <button class="btn btn-sm btn-primary" onclick="sumarCantidad(${loop.index})">+</button>
                        </div>
                        <div class="quantityType-view">
                            <p>${product.quantityType.toUpperCase()}</p>
                        </div>
                    </div>
                    <form action="modifyQuantity" method="post" class="mt-2">
                        <input type="hidden" name="productId" value="${product.id}">
                        <input type="hidden" name="quantity" id="form-cantidad-${loop.index}">
                        <button type="submit" class="btn btn-success" onclick="return setCantidad(${loop.index})">Modificar Cantidad</button>
                    </form>
                    <c:if test="${product.favorite == true}">
                    <form action="quitFavourite" method="post" class="mt-2">
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox" name="productId" value="${product.id}" id="flexSwitchCheckChecked" checked>
                            <label class="form-check-label" for="flexSwitchCheckChecked">Favoritos</label>
                        </div>
                    </form>
                    </c:if>
                    <c:if test="${product.favorite == false}">
                        <form action="addFavourite" method="post">
                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" name="productId" value="${product.id}" id="flexSwitchCheckUncheked">
                                <label class="form-check-label" for="flexSwitchCheckChecked">Añadir a Favoritos</label>
                            </div>
                        </form>
                    </c:if>
                </div>
            </div>
        </c:forEach>
    </div>

</div>

</body>
</html>
