<!DOCTYPE html>
<html>
<head>
    <title>Панель администратора</title>
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
            <li><a href="/admin" class="nav-link px-2 text-muted link-dark">Панель администратора</a></li>
        </ul>
        <form action="/logout" method="post" class="col-md-3 text-end">
            <span class="px-2">Админ: ${user.name}</span>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" class="btn btn-outline-primary me-2" value="Выход"/>
        </form>
    </header>
<content>
<h3 align="center">Панель администратора</h4>
<#if users??>
<div class="bd-example-snippet bd-code-snippet">
<div class="bd-example">
        <table class="table table-sm table-bordered text-centered">
          <thead>
          <tr>
            <th scope="col">№</th>
            <th scope="col">Email</th>
            <th scope="col">Активность</th>
            <th scope="col">Роль</th>
            <th scope="col">Бан</th>
            <th scope="col">Редактирование</th>
          </tr>
          </thead>
          <tbody class="demotable">
    <#list users as user>
        <tr class="${user?item_parity}Row">
            <th>${user?counter}</th>
            <th>${user.email}</th>
            <th><#if user.active>true<#else>false</#if></th>
            <th><#list user.roles as role>${role}</#list></th>
            <th>
                <form action="/admin/user/ban/${user.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <#if user.active><input type="submit" value="Забанить"><#else><input type="submit" value="Разбанить"></#if>
                </form>
            </th>
            <th><a href="/admin/user/edit/${user.id}">Редактировние</a></th>
        </tr>
    </#list>
    </tbody>
    </table>
</div>
</div>
<#else>
<h3 align="center">Пользователей нет</h3>
</#if>
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