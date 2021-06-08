<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>
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
                <jsp:param name="titulo" value="Lista de Usuarios" /> 
            </jsp:include> 

            <!-- Main content -->
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12 ">
                            <div class="card card-primary card-outline">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between form-group">
                                        <a href="frmusuario.jsp" class="btn btn-success btn-sm border"><i class="fas fa-plus"></i> Nuevo</a>

                                        <form action="usuariosAdmin" method="get" class=" w-50">
                                            <div class="input-group input-group-sm">
                                                <input type="text" class="form-control" placeholder="Buscar" aria-label="Buscar" aria-describedby="buscar-vacante" name="buscar">
                                                <button type="submit" class="btn btn-success btn-sm"id="buscar-vacante"><i class="fas fa-search"></i></button>    
                                            </div>  
                                        </form>
                                    </div>
                                    <div class="form-group table-responsive-xl">
                                        <table class="table table-striped table-hover table-sm text-center border border-primary">
                                            <thead class="border border-primary">
                                                <tr class="bg-primary text-white ">
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Nombre</th>
                                                    <th scope="col">Email</th>
                                                    <th scope="col">Password</th>
                                                    <th scope="col">Perfil</th>
                                                    <th scope="col">Status</th>
                                                    <th scope="col">Opciones</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${usuarios}" var="usuario" varStatus="status">
                                                    <tr>
                                                        <td>${usuario.id} </td>
                                                        <td>${usuario.nombre}</td>
                                                        <td>${usuario.email}</td>
                                                        <td>${usuario.password}</td>
                                                        <td>${usuario.perfil}</td>
                                                        <td>${usuario.estatus}</td>
                                                        <td>
                                                        <div class="btn-group " role="group" aria-label="button-actions">
                                                            <a href="usuariosAdmin?action=editar&id=${usuario.id}" class="btn btn-secondary btn-sm"><i class="fas fa-edit"></i> Editar</a>
                                                            <a href="usuariosAdmin?action=eliminar&id=${usuario.id}"class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i> Eliminar</a>
                                                        </div>
                                                    </td>
                                                    </tr> 
                                                </c:forEach>
                                            
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.row -->
                </div><!-- /.container-fluid -->
            </div>
            <!-- /.content -->
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
