<%--
  Created by IntelliJ IDEA.
  User: DAW
  Date: 20/06/2024
  Time: 11:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<style>
     .form-container{
        margin-top: 10px;
        margin-bottom: 10px;
        margin-left: 10%;
        margin-right: 10%;
     }
     .form-control{
        margin-bottom: 10px;
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
                <a class="nav-link" href="/adminProducts">Administrar Productos<span class="sr-only"></span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/addProduct"><b>Añadir Producto</b><span class="sr-only">(Actual)</span></a>
            </li>
        </ul>
    </div>
</nav>
<div class="form-container">
    <form action="addProduct" method="post">
        <div class="mb-3">
            <label for="name" class="form-label">Nombre</label>
            <input type="text" class="form-control" id="name" name="name" aria-describedby="name" required>
        </div>
        <div class="mb-3">
            <label for="quantity" class="form-label">Cantidad</label>
            <input type="number" class="form-control" id="quantity" name="quantity"required>
        </div>
        <select class="form-control" id="quantityType" name="quantityType" required>
            <option value="">Seleccione un tipo de cantidad</option>
            <option value="kg">KG</option>
            <option value="l">L</option>
            <option value="ud">UD</option>
        </select>
        <select class="form-control" id="type" name="type" required>
            <option value="">Seleccione un tipo</option>
            <option value="nevera">Nevera</option>
            <option value="despensa">Despensa</option>
            <option value="limpieza">Limpieza</option>
            <option value="Congelador">Congelador</option>
        </select>
        <div class="mb-3">
            <label for="description" class="form-label">Descripción</label>
            <textarea class="form-control" id="description" name="description" rows="4"></textarea>
            <div id="description-help" class="form-text">No use caracteres especiales como " , |, + ...</div>
        </div>

        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
</body>
</html>
