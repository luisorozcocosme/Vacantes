<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Usuario</title>
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

    <!-- Modal -->
    <div class="modal fade" id="editPassword" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Cambiar Contraseña</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="usuariosAdmin" method="POST">
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password" placeholder="Password" name="password">
                        </div>
                        <div class="form-group">
                            <label for="password2">Confirme Password</label>
                            <input type="password" class="form-control" id="password2" placeholder="Password" name="password2">
                        </div>
                        <input type="hidden" value="editPassword" name="editPassword">
                        <input type="hidden" value="${usuario.id}" name="id">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </form>
                    
                </div>
                
            </div>
        </div>
    </div>
    <div class="wrapper">
        <jsp:include page="partials/headerAdmin.jsp" flush="true"/>    
        <jsp:include page="partials/sidebar.jsp"  flush="true">
            <jsp:param name="nombreUser" value="${usuario.username}" /> 
        </jsp:include>
        <jsp:include page="partials/tituloContent.jsp"> 
            <jsp:param name="titulo" value="Editar Usuario" /> 
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
                                        <input type="hidden" value="editUsuario" name="editUsuario">
                                        <input type="hidden" value="${usuario.id}" name="id">
                                        <div class="mb-3 col-12 col-sm-6">
                                            <label for="nombre" class="form-label">Nombre: </label>
                                            <input type="text" class="form-control" id="nombre" name="nombre" aria-describedby="nombreHelp" value="${usuario.nombre}" placeholder="Escriba el nombre del usuario." required >
                                        </div>
                                        <div class="mb-3 col-12 col-sm-6">
                                            <label for="email" class="form-label">Email: </label>
                                            <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" value="${usuario.email}" placeholder="Escriba el email del usuario." required>
                                        </div>
                                        <div class="mb-3 col-12 col-sm-6">
                                            <label for="username" class="form-label">Username: </label>
                                            <input type="text" class="form-control" id="username" name="username" value="${usuario.username}" aria-describedby="usernameHelp" placeholder="Escriba el username del usuario." required>
                                        </div>
                                        <div class="mb-3 col-12 col-sm-6">
                                            <label for="password" class="form-label">
                                                Password: 
                                                <button class="badge badge-info border-0" type="button"  data-toggle="modal" data-target="#editPassword"> Editar</button>
                                            </label>
                                            <input type="password" class="form-control" id="password"  aria-describedby="passwordmeHelp" value="${usuario.password}" placeholder="Escriba el password del usuario." required disabled="">
                                        </div>
                                        <div class="mb-3 col-12 col-sm-6">
                                            <label for="perfil" class="form-label">Perfil: </label>
                                            <select class="form-control" id="perfil" name="perfil" >

                                                <c:choose>
                                                    <c:when test="${usuario.perfil == 'administrador'}">
                                                        <option value="administrador" selected>Administrador</option>
                                                        <option value="editor" >Editor</option>
                                                    </c:when>
                                                    <c:when test="${usuario.perfil == 'editor'}">
                                                        <option value="administrador">Administrador</option>
                                                        <option value="editor" selected>Editor</option>
                                                    </c:when>
                                                </c:choose>
                                            </select>
                                        </div>
                                        <div class="mb-3 col-12 col-sm-6">
                                            <label for="estatus" class="form-label">Estatus: </label>
                                            <select class="form-control" name="estatus" id="estatus">
                                                <c:choose>
                                                    <c:when test="${usuario.estatus == 'activo'}">
                                                        <option class="text-success" value="activo" selected>Activo</option>
                                                        <option class="text-danger" value="inactivo" >Inactivo</option>
                                                    </c:when>
                                                    <c:when test="${usuario.estatus == 'inactivo'}">
                                                        <option class="text-success" value="activo">Activo</option>
                                                        <option class="text-danger" value="inactivo" selected>Inactivo</option>
                                                    </c:when>
                                                </c:choose>
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
