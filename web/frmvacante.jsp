<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Vacante</title>
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
                <jsp:param name="titulo" value="Crear Vacante" /> 
            </jsp:include> 
    <!-- Main content -->
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="card card-primary card-outline">
                                <div class="card-body">
                                   <form  method="POST" action="vacantesAdmin">
                                    <input type="hidden" name="crearVacante" value="crearVacante">
                                        <div class="mb-3">
                                            <label for="nombre" class="form-label fw-bold">Nombre: </label>
                                            <input type="text" class="form-control" id="nombre" name="nombre" aria-describedby="nombreHelp" placeholder="Escriba el nombre de la vacante." required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="descripcion" class="form-label fw-bold">Descripción: </label>
                                            <textarea class="form-control" id="descripcion" name="descripcion" placeholder="Escriba una descripcion de la vacante."></textarea>
                                        </div>
                                        <div class="mb-3">
                                            <label for="detalle" class="form-label fw-bold">Escriba los detalles: </label>
                                            <textarea class="form-control" id="detalle" name="detalle" placeholder="Escriba los detalles de la vacante."></textarea>
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