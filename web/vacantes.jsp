<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vacantes | Lista</title>
        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="template/plugins/fontawesome-free/css/all.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="template/dist/css/adminlte.min.css">
        <!-- Google Font: Roboto -->
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    </head>
    <jsp:include page="partials/header.jsp" flush="true"/>
    <body style="background-color:#F8FAFC;">

        <div class="container">
            <div class="p-4">
                <div class="p-4  shadow bg-white rounded">
                    <h1 class="h4">Lista de vacantes</h1>
                    <div class=" table-responsive-lg ">
                        <table class="table table-striped table-hover table-sm text-center border border-primary">
                            <thead class="border border-primary">
                                <tr class="bg-primary text-white ">
                                    <th scope="col">ID</th>
                                    <th scope="col">Vacante</th>
                                    <th scope="col">Publicado</th>
                                    <th scope="col">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${vacantes}" var="vacante">
                                    <tr>
                                        <td>${vacante.id} </td>
                                        <td>${vacante.nombre} </td>
                                        <td>${vacante.fechaPublicacion}</td>
                                        
                                        <td>
                                            <div class="btn-group " role="group" aria-label="button-actions">
                                                <a href="vacante?action=ver&id=${vacante.id}" class="btn btn-success btn-sm"><i class="fas fa-eye"></i> Ver más ...</a>
                                              
                                              
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
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
    -->
</body>
</html>