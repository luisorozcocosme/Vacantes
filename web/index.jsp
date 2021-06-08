<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vacantes</title>
        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="template/plugins/fontawesome-free/css/all.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="template/dist/css/adminlte.min.css">
        <!-- Google Font: Roboto -->
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    </head>
    <jsp:include page="partials/header.jsp" flush="true"/> 
    <body style="background-color:#F8FAFC;">
        <div class="container text-center p-4">
            <h1 class="h2 py-3">¡ENCUENTRA TU TRABAJO IDEAL!</h1>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing, elit. Pariatur provident unde at optio odio, sequi beatae asperiores debitis, nihil quae, voluptas commodi officia quisquam explicabo alias eaque nesciunt nemo cumque.
                Lorem ipsum dolor, sit amet consectetur adipisicing, elit. Sapiente, ullam vel quidem repudiandae illo laboriosam est labore quia voluptate quas tempora eaque at laudantium ad, totam inventore iusto nisi, impedit!
            </p>
            <a href="vacante?action=lista" class="btn btn-success">Ver más ofertas</a>
        </div>
        <div class="container">
            <h2 class="h4 m-2">Ofertas recientes:</h2>
            <div class="row">
                <c:forEach items="${ultimas}" var="vacante" varStatus="status">
                    <div class="col-12 col-sm-6 col-md-6 col-lg-4 col-xl-4 col-xxl-4">
                        <div class="card m-2 shadow border">
                            <div class="card-header font-weight-bold">${vacante.nombre}</div>
                            <div class="card-body">

                                <p class="card-text">${vacante.descripcion}</p>
                                <a href="vacante?action=ver&id=${vacante.id}" class="btn btn-primary">Ver más ...</a>
                            </div>
                        </div>
                    </div>

                </c:forEach>
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
