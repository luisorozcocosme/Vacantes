<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="template/plugins/fontawesome-free/css/all.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="template/dist/css/adminlte.min.css">
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
                <jsp:param name="titulo" value="Home" /> 
            </jsp:include> 

            <!-- Main content -->
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-4 col-6">
                            <!-- small box -->
                            <div class="small-box bg-info">
                                <div class="inner">
                                    <h3>${cantUsuarios} </h3>

                                    <p>Total Usuarios</p>
                                </div>
                                <div class="icon">
                                    <i class="fas fa-users"></i>
                                </div>
                                <a href="usuariosAdmin" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-4 col-6">
                            <!-- small box -->
                            <div class="small-box bg-secondary">
                                <div class="inner">
                                    <h3>${cantVacantes}</h3>

                                    <p>Total de Vacantes</p>
                                </div>
                                <div class="icon">
                                    <i class="far fa-address-card"></i>
                                </div>
                                <a href="vacantesAdmin" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-4 col-6">
                            <!-- small box -->
                            <div class="small-box bg-success">
                                <div class="inner">
                                    <h3>5243<sup style="font-size: 20px"></sup></h3>

                                    <p>Total de visitas</p>
                                </div>
                                <div class="icon">
                                    <i class="fas fa-signal"></i>
                                </div>
                                <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <!-- ./col -->

                        <div class="col-12">
                            <div class="card card-primary card-outline">
                                <div class="card-body">
                                    <h5 class="card-title">Card title</h5>
                                    
                                    <p class="card-text">
                                        Some quick example text to build on the card title and make up the bulk of the card's
                                        content. Lorem ipsum dolor sit amet, consectetur adipisicing, elit. Autem dolores recusandae, inventore magnam praesentium laudantium sapiente aperiam asperiores mollitia. Commodi incidunt maxime, optio numquam dolorum saepe, deserunt blanditiis quae dicta?
                                    </p>

                                </div>
                            </div><!-- /.card --> 
                        </div>

                    </div>
                    <!-- /.row -->
                </div><!-- /.container-fluid -->
            </div>
            <!-- /.content -->
        </div>
        <jsp:include page="partials/footerAdmin.jsp" flush="true" />
    </div>
    <!-- jQuery -->
    <script src="template/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="template/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="template/dist/js/adminlte.min.js"></script>
</body>
</html>