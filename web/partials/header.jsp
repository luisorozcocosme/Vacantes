<header class="bg-white shadow">
    <div class="container ">
        <nav class="navbar navbar-expand-lg ">

            <a class="navbar-brand font-weight-bold" href="homepage">
                <i class="fab fa-vk font-weight-bold "></i>
                Vacantes
            </a>

            <button class="navbar-toggler border border-primary" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fas fa-bars text-primary"></i>
            </button>
            <div class="collapse navbar-collapse " id="navbarTogglerDemo03">
                <ul class="navbar-nav ml-auto mt-2 mt-lg-0 text-center">
                    <li class="nav-item"><a href="#" class="nav-link " aria-current="page"><i class="fas fa-home"></i> Inicio</a></li>
                    <li class="nav-item"><a href="/vacantes/login.jsp" class="nav-link"><i class="fas fa-users"></i> Admin</a></li>
                    <li class="nav-item"><a href="#" class="nav-link"><i class="fas fa-globe"></i> Servicios</a></li>
                    <li class="nav-item"><a href="#" class="nav-link"><i class="fas fa-envelope"></i> Contacto</a></li>
                </ul>
                <form action="buscar" method="POST" class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3 ">
                    <div class="input-group input-group-sm">
                        <input type="text" class="form-control" placeholder="Buscar" aria-label="Buscar" aria-describedby="buscar-vacante" name="buscar">
                        <button type="submit" class="btn btn-primary btn-sm"id="buscar-vacante"><i class="fas fa-search"></i></button>    
                    </div>  
                </form>
            </div>
        </nav>
    </div>
</header>
