<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Usuario</title>
        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="template/plugins/fontawesome-free/css/all.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="template/dist/css/adminlte.min.css">
        <link rel="stylesheet" href="css/style.css">
        <!-- Google Font: Roboto -->
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    </head>
    <body class="hold-transition sidebar-mini">
        <%
            HttpSession sesion=request.getSession(); 
            if (session.getAttribute("usuario") == null) {
                response.sendRedirect("homepage");
            }

        %>
        <div class="wrapper">
            <jsp:include page="partials/headerAdmin.jsp" flush="true"/>    
            <jsp:include page="partials/sidebar.jsp"  flush="true">
                <jsp:param name="nombreUser" value="${usuario.username}" /> 
            </jsp:include>
            <jsp:include page="partials/tituloContent.jsp"> 
                <jsp:param name="titulo" value="Crear Usuario" /> 
            </jsp:include> 
            <!-- Main content -->
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="card card-primary card-outline">
                                <div class="card-body">
                                    <form  method="POST" action="usuariosAdmin">
                                        <div class="row">
                                            <input type="hidden" name="crearUsuario" value="crearUsuario">
                                            <div class="mb-3 col-12 col-sm-6">
                                                <label for="nombre" class="form-label">Nombre: </label>
                                                <input type="text" class="form-control" id="nombre" name="nombre" aria-describedby="nombreHelp" placeholder="Escriba el nombre del usuario." required>
                                            </div>
                                            <div class="mb-3 col-12 col-sm-6">
                                                <label for="email" class="form-label">Email: </label>
                                                <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="Escriba el email del usuario." required>
                                            </div>
                                            <div class="mb-3 col-12 col-sm-6">
                                                <label for="username" class="form-label">Username: </label>
                                                <input type="text" class="form-control" id="username" name="username" aria-describedby="usernameHelp" placeholder="Escriba el username del usuario." required>
                                            </div>
                                            <div class="mb-3 col-12 col-sm-6">
                                                <label for="password" class="form-label">Password: </label>
                                                <input type="password" class="form-control" id="password" name="password" aria-describedby="passwordmeHelp" placeholder="Escriba el password del usuario." required>
                                            </div>
                                            <div class="mb-3 col-12 col-sm-6">
                                                <label for="Perfil" class="form-label">Perfil: </label>
                                                <select class="form-control" id="Perfil" name="perfil">
                                                    <option value="administrador">Administrador</option>
                                                    <option value="editor">Editor</option>
                                                </select>
                                            </div>   
                                        </div>


                                        <button type="submit" class="btn btn-primary">Guardar</button>
                                    </form> 
                                </div>
                            </div><!-- /.card --> 
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="partials/footerAdmin.jsp" flush="true" />

        <!-- jQuery -->
        <script src="template/plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="template/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- AdminLTE App -->
        <script src="template/dist/js/adminlte.min.js"></script>
    </body>
</html>