<!DOCTYPE HTML>
<html>
<head>
  <title>Информация о товаре</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body class="container d-flex flex-column min-vh-100">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
        <span class="col-md-3 mb-md-0 fs-4">SPEQ</span>
        <ul class="nav col-12 col-md-auto justify-content-center mb-md-0">
            <li><a href="/" class="nav-link px-2 text-muted link-dark">Главная</a></li>
            <li><a href="/about" class="nav-link px-2 text-muted link-dark">О нас</a></li>
        </ul>
        <form action="/logout" method="post" class="col-md-3 text-end">
            <span class="px-2">${user.stringRole()}: ${user.name}</span>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" class="btn btn-outline-primary me-2" value="Выход"/>
        </form>
    </header>
<content>
  <h3 align="center" style="margin-bottom:35px;">Информация о товаре</h3>
<form>
    <div class="col-sm">
        <label for="title" class="form-label">Название</label>
        <input type="text" class="form-control" id="title" value="${product.title}" readonly>
    </div>
    <br>
    <div class="row justify-content-around">
        <div class="col-5">
            <label for="count" class="form-label">Количество</label>
            <input type="number" class="form-control" id="count" value="${product.count}" readonly>
        </div>
        <div class="col-5">
            <label for="price" class="form-label">Цена</label>
            <input type="number" class="form-control" id="price" value="${product.price}" readonly>
        </div>
    </div>
    <br>
        <div class="row justify-content-around">
            <div class="col-5">
                <label for="name" class="form-label">Сотрудник</label>
                <input type="text" class="form-control" id="name" value="${product.user.name}" readonly>
            </div>
            <div class="col-5">
                <label for="email" class="form-label">Email</label>
                <input type="text" class="form-control" id="email" value="${product.user.email}" readonly>
            </div>
        </div>
        <br>
    <div class="col-sm">
        <label for="price" class="form-label">Описание</label>
        <textarea style="height:100px;" class="form-control" readonly>${product.description}</textarea><br>
    </div>
    <br>
</form>
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