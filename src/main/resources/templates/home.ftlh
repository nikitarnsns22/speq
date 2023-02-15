<!DOCTYPE HTML>
<html>
<head>
    <title>Главная страница</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body class="container d-flex flex-column min-vh-100">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
        <span class="col-md-3 mb-md-0 fs-4">SPEQ</span>
        <ul class="nav col-12 col-md-auto justify-content-center mb-md-0">
            <li><a href="/" class="nav-link px-2 text-muted link-dark">Главная</a></li>
            <li><a href="/about" class="nav-link px-2 text-muted link-dark">О нас</a></li>
            <#if user.isUser() == false><li><a href="/create" class="nav-link px-2 text-muted link-dark">Добавить товар</a></li></#if>
            <#if user.isAdmin()><li><a href="/admin" class="nav-link px-2 text-muted link-dark">Панель администратора</a></li></#if>
        </ul>
        <form action="/logout" method="post" class="col-md-3 text-end">
            <span class="px-2">${user.stringRole()}: ${user.name}</span>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" class="btn btn-outline-primary me-2" value="Выход"/>
        </form>
    </header>
    <content class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
        <#list products as product>
            <div class="col">
                <div class="card shadow-sm">
                    <#if product.imageControl()>
                        <img class="card-img-top" width="100%" height="225" src="images/${product.previewImageId}">
                    <#else>
                        <svg class="card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img"><rect width="100%" height="100%" fill="#55595c"></rect></svg>
                    </#if>
                    <div class="card-body">
                        <p class="d-flex justify-content-between align-items-center">
                            <b>${product.title}</b>
                            <span>В наличии: ${product.count} шт.</span>
                        </p>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group border border-5">
                                <#if user.isUser()>
                                    <form action="/buy/${product.id}" method="post">
                                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                                        <input type="submit" class="btn btn-outline-success rounded-0 border border-0" value="Купить" class="btn btn-sm btn-outline-secondary">
                                    </form>
                                    <form action="/info/${product.id}" method="get">
                                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                                        <input type="submit" class="btn btn-outline-info rounded-0 border border-0" value="Подробнее" class="btn btn-sm btn-outline-secondary">
                                    </form>
                                <#else>
                                    <form action="/product/delete/${product.id}" method="post">
                                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                                        <input type="submit" class="btn btn-outline-danger rounded-0 border border-0" value="Удалить" class="btn btn-sm btn-outline-secondary">
                                    </form>
                                    <form action="/product/edit/${product.id}" method="get">
                                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                                        <input type="submit" class="btn btn-outline-info rounded-0 border border-0" value="Редактировать" class="btn btn-sm btn-outline-secondary">
                                    </form>
                                </#if>
                            </div>
                            <span>Цена: ${product.price} РУБ.</span>
                        </div>
                    </div>
                </div>
            </div>
        <#else>
            <h3>Товаров нет</h3>
        </#list>
    </content>
    <br>
    <footer class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-top mt-auto">
        <span class="text-muted">© 2023 SPEQ, Inc</span>
        <ul class="nav justify-content-center">
            <li><a href="#top" class="nav-link text-muted">SPEQ</a></li>
        </ul>
        <span class="text-muted justify-content-end">Никита Кузнецов</span>
    </footer>
</body>
</html>