<!DOCTYPE HTML>
<html>
<head>
  <title>Редактирование товара</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body class="container d-flex flex-column min-vh-100">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
        <span class="col-md-3 mb-md-0 fs-4">SPEQ</span>
        <ul class="nav col-12 col-md-auto justify-content-center mb-md-0">
            <li><a href="/" class="nav-link px-2 text-muted link-dark">Главная</a></li>
            <li><a href="/about" class="nav-link px-2 text-muted link-dark">О нас</a></li>
            <li><a href="/create" class="nav-link px-2 text-muted link-dark">Добавить товар</a></li>
            <#if user.isAdmin()><li><a href="/admin" class="nav-link px-2 text-muted link-dark">Панель администратора</a></li></#if>
        </ul>
        <form action="/logout" method="post" class="col-md-3 text-end">
            <span class="px-2">${user.stringRole()}: ${user.name}</span>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" class="btn btn-outline-primary me-2" value="Выход"/>
        </form>
    </header>
<content>
  <h3 align="center" style="margin-bottom:35px;">Редактирование товара</h3>
<form action="/product/edit/${product.id}" method="post" enctype="multipart/form-data">
  <input type="text" required name="title" placeholder="Введите название товара" class="form-control" value="${product.title}"><br>
  <input type="number" required min="0" max="1000" name="count" placeholder="Введите количество товара" class="form-control" value="${product.count}"><br>
  <input type="number" required min="0" max="1000000" name="price" placeholder="Введите стоимость товара" class="form-control" value="${product.price}"><br>
  <input type="file" name="file1" class="form-control"><br>
  <textarea style="height:100px;" name="description" placeholder="Введите описание товара" class="form-control">${product.description}</textarea><br>
  <input type="hidden" name="_csrf" value="${_csrf.token}">
  <button type="submit" class="btn btn-outline-success">Редактировать</button>
</form>
<br>
</content>
    <footer class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-top mt-auto">
        <span class="text-muted">© 2023 SPEQ, Inc</span>
        <ul class="nav justify-content-center">
            <li><a href="#top" class="nav-link text-muted">SPEQ</a></li>
        </ul>
        <span class="text-muted justify-content-end">Никита Кузнецов</span>
    </footer>
</body>
</html>