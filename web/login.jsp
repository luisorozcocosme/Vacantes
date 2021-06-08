<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="template/plugins/fontawesome-free/css/all.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="template/dist/css/adminlte.min.css">
        <!-- Google Font: Roboto -->
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    </head>
    <body class="hold-transition login-page">
        <div class="login-box">

            <!-- /.login-logo -->
            <div class="card ">
                <div class="card-body login-card-body">
                    <h1 class="h3 text-center">Vacantes  Demo</h1>
                    <p class="login-box-msg">Sign in to start your session</p>
                    <p class="text-center"><span class="font-weight-bold">user:</span>luis1</p>
                    <p class="text-center"><span class="font-weight-bold">pass:</span>12345</p>
                    <form action="admin" method="POST">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Usuario" aria-label="user" name="user" aria-describedby="user">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-user"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <input type="password" class="form-control" placeholder="Password" aria-label="pass" aria-describedby="pass" name="pass">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-8">
                                <div class="icheck-primary">
                                    <input type="checkbox" id="remember">
                                    <label for="remember">
                                        Remember Me
                                    </label>
                                </div>
                            </div>
                            <!-- /.col -->
                            <div class="col-4">
                                <button type="submit" class="btn btn-primary btn-block">Sign In</button>
                            </div>
                            <!-- /.col -->
                            <div class="p-2 text-center  w-100">
                                <span class="text-danger ">${message} </span>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- /.login-card-body -->
            </div>
        </div>
        <!-- jQuery -->
        <script src="template/plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="template/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- AdminLTE App -->
        <script src="template/dist/js/adminlte.min.js"></script>
    </body>
</html>

