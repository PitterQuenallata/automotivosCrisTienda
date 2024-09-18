<nav id="sidebar">
  <!-- Sidebar Content -->
  <div class="sidebar-content ">
    <!-- Side Header -->
    <div class="content-header justify-content-lg-center ">
      <!-- Logo -->
      <div>
        <!-- <span class="smini-visible fw-bold tracking-wide fs-lg">
                c<span class="text-primary"></span>
              </span> -->
        <!-- <a class="link-fx fw-bold tracking-wide mx-auto" href="/inicio">
                <span class="smini-hidden">
                  <i class="fa fa-fire text-primary"></i>
                  <span class="fs-4 text-dual">Automotivos</span><span class="fs-4 text-primary">Cris</span>
                </span>
              </a> -->
        <a class="link-fx fw-bold tracking-wide mx-auto" href="/inicio">
          <img src="<?php echo $path ?>views/assets/media/icon/logoHoriz.png" alt="">
        </a>
      </div>
      <!-- END Logo -->

      <!-- Options -->
      <div>
        <!-- Close Sidebar, Visible only on mobile screens -->
        <!-- Layout API, functionality initialized in Template._uiApiLayout() -->
        <button type="button" class="btn btn-sm btn-alt-danger d-lg-none" data-toggle="layout" data-action="sidebar_close">
          <i class="fa fa-fw fa-times"></i>
        </button>
        <!-- END Close Sidebar -->
      </div>
      <!-- END Options -->
    </div>
    <!-- END Side Header -->

    <!-- Sidebar Scrolling -->
    <div class="js-sidebar-scroll">
      <!-- Side User -->
      <div class="content-side content-side-user px-0 py-0">
        <!-- Visible only in mini mode -->
        <div class="smini-visible-block animated fadeIn px-3">
          <img class="img-avatar img-avatar32" src="<?php echo $path . $_SESSION["users"]["foto_usuario"] ?>" alt="">
        </div>
        <!-- END Visible only in mini mode -->

        <!-- Visible only in normal mode -->
        <div class="smini-hidden text-center mx-auto">
          <a class="img-link" href="be_pages_generic_profile.html">
            <img class="img-avatar" src="<?php echo $path . $_SESSION["users"]["foto_usuario"] ?>" alt="">
          </a>
          <div class="fw-semibold mb-1"><?php echo $_SESSION["users"]["nombre_usuario"] ?></div>
          <div class="fs-sm text-muted"><?php echo $_SESSION["users"]["rol_usuario"] ?></div>
          <ul class="list-inline mt-3 mb-0">

            <li class="list-inline-item">
              <a href="be_pages_generic_profile.html" class="link-fx text-dual fs-sm fw-semibold text-uppercase"></a>

            </li>
            <li class="list-inline-item">
              <!-- Layout API, functionality initialized in Template._uiApiLayout() -->
              <a class="link-fx text-dual" data-toggle="layout" data-action="dark_mode_toggle" href="javascript:void(0)">
                <i class="fa fa-moon"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a class="link-fx text-dual" href="/salir">
                <i class="fa fa-sign-out-alt"></i>
              </a>
            </li>
          </ul>
        </div>
        <!-- END Visible only in normal mode -->
      </div>
      <!-- END Side User -->

      <!-- Side Navigation -->
      <div class="content-side content-side-full">
        <ul class="nav-main">
          <li class="nav-main-item">
            <a class="nav-main-link" href="/inicio">
              <i class="nav-main-link-icon fa fa-house-user"></i>
              <span class="nav-main-link-name">Inicio</span>
            </a>
          </li>

          <li class="nav-main-heading">Tienda</li>
          <?php if ($_SESSION["users"]["rol_usuario"] == "administrador") {

            echo '<li class="nav-main-item">
                  <a class="nav-main-link" href="/usuarios">
                    <i class="nav-main-link-icon fa fa-users"></i>
                    <span class="nav-main-link-name">Usuarios</span>
                  </a></li>';
          } ?>
          <li class="nav-main-item">
            <a class="nav-main-link" href="/proveedores">
              <i class="nav-main-link-icon fa fa-users"></i>
              <span class="nav-main-link-name">Proveedores</span>
            </a>
          </li>

          <li class="nav-main-item">
            <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
              <i class="nav-main-link-icon fa fa-list-alt"></i>
              <span class="nav-main-link-name">Inventario</span>
            </a>
            <ul class="nav-main-submenu">
              <li class="nav-main-item">
                <a class="nav-main-link" href="/categorias">
                  <span class="nav-main-link-name">Categorias</span>
                </a>
              </li>
              <li class="nav-main-item">
                <a class="nav-main-link" href="/marcas">
                  <span class="nav-main-link-name">Marcas</span>
                </a>
              </li>
              <li class="nav-main-item">
                <a class="nav-main-link" href="/modelos">
                  <span class="nav-main-link-name">Modelos</span>
                </a>
              </li>
              <li class="nav-main-item">
                <a class="nav-main-link" href="/motores">
                  <span class="nav-main-link-name">Motores</span>
                </a>
              </li>
              <li class="nav-main-item">
                <a class="nav-main-link" href="/repuestos">
                  <span class="nav-main-link-name">Repuestos</span>
                </a>
              </li>
              <!-- <li class="nav-main-item">
                <a class="nav-main-link" href="/vehiculos">
                  <span class="nav-main-link-name">Vehiculos</span>
                </a>
              </li> -->
            </ul>
          </li>

          <li class="nav-main-item">
            <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
              <i class="nav-main-link-icon fa fa-baht-sign"></i>
              <span class="nav-main-link-name">Compras</span>
            </a>
            <ul class="nav-main-submenu">
              <li class="nav-main-item">
                <a class="nav-main-link" href="/lista-compras">
                  <span class="nav-main-link-name">Lista Compras</span>
                </a>
              </li>
              <li class="nav-main-item">
                <a class="nav-main-link" href="/crear-compras">
                  <span class="nav-main-link-name">Crear Compra</span>
                </a>
              </li>
            </ul>
          </li>

          <li class="nav-main-item">
            <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
              <i class="nav-main-link-icon fa fa-cart-shopping"></i>
              <span class="nav-main-link-name">Ventas</span>
            </a>
            <ul class="nav-main-submenu">
              <li class="nav-main-item">
                <a class="nav-main-link" href="/crear-ventas">
                  <span class="nav-main-link-name">Crear Ventas</span>
                </a>
              </li>
              <li class="nav-main-item">
                <a class="nav-main-link" href="/lista-ventas">
                  <span class="nav-main-link-name">Lista Ventas</span>
                </a>
              </li>

            </ul>

          </li>

          <li class="nav-main-item">
            <a class="nav-main-link" href="/reportes">
              <i class="nav-main-link-icon fa fa-chart-line"></i>
              <span class="nav-main-link-name">Reportes</span>
            </a>
          </li>

        </ul>
        </li>
        </ul>
      </div>
      <!-- END Side Navigation -->
    </div>
    <!-- END Sidebar Scrolling -->
  </div>
  <!-- Sidebar Content -->
</nav>