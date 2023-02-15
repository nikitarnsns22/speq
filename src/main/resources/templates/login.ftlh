<!DOCTYPE HTML>
<html>
<head>
    <title>Авторизация</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body class="container d-flex flex-column min-vh-100">
<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
        <span class="col-md-3 mb-md-0 fs-4">SPEQ</span>
        <#if RequestParameters.error??>
            <span style="color: red">Такого пользователя не существует</span>
        </#if>
</header>
<content class="form-signin m-auto">
  <form action="/login" method="post">
    <h1 class="h3 mb-3 fw-normal text-center">Авторизация</h1>
    <div class="form-floating">
      <input required type="email" class="form-control" id="floatingInput" placeholder="Эл. почта" wfd-id="id0" name="username">
      <label for="floatingInput">Эл. почта</label>
    </div>
    <br>
    <div class="form-floating">
      <input required maxlength="8" type="password" name="password" class="form-control" id="floatingPassword" placeholder="Пароль" wfd-id="id1">
      <label for="floatingPassword">Пароль</label>
    </div>
    <br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input class="w-100 btn btn-lg btn-primary" type="submit" value="Вход"/>
    <br>
    <br>
    <a href="/registration"><button type="button" class="w-100 btn btn-lg btn-outline-primary">Регистрация</button></a>
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