<div class="content-page">
    <div class="content">
        <div class="container-fluid">
            <div class="card">

                <div class="">
                    <div class="row">
                        <div class="col-12">
                            <div class="card-header">
                                <h2>Punto de venta</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="mb-3">
                <div class="row">
                    <div class="col-12 col-lg-7">


                        <!-- <div class="mb-3">
                            <div class="row d-flex pt-2 justify-content-between aling-items-center ">
                                <div class="col-12 col-lg-6">
                                    <h3>Total: Bs./ <span id="totalVenta">0.00</span></h3>
                                </div>

                                <div class="col-12 col-lg-6">
                                    <div class="float-end">
                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal">
                                            <i class=" ri-shopping-cart-2-fill"></i>
                                            Realizar venta
                                        </button>

                                        <button type="button" class="btn btn-danger">
                                            <i class="ri-delete-bin-fill"></i>
                                            Eliminar listado
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div> -->

                        <div class="card">
                            <div class="card-body">

                                <div class="row">
                                    <div class="col-sm-12">
                                        <table id="datatable-buttons" class="table table-striped dt-responsive nowrap w-100 dataTable no-footer dtr-inline tablaVentas " aria-describedby="datatable-buttons_info" style="width: 1538px;">
                                            <thead>
                                                <tr>
                                                    <th style="width:10px">#</th>
                                                    <th>Producto</th>
                                                    <th>Stock</th>
                                                    <th>Acciones</th>

                                                </tr>
                                            </thead>
                                            <!-- <tbody>
                                                <?php
                                                //$item = null;
                                                //$valor = null;
                                                //$productos = ControladorProductos::ctrMostrarProductos($item, $valor);

                                                foreach ($productos as $key => $value) {

                                                    echo ' <tr>
                                
                                                                        <td>' . ($key + 1) . '</td>
                                                                        <td>' . $value["nombre_producto"] . '</td>
                                                                        <td>' . $value["stock"] . '</td>
                                                                        <td>' . $value["min_stock"] . '</td>
                                                                        
                                
                                                                        <td>
                                
                                                                          <div class="btn-group">
                                                                          
                                                                            
                                
                                                                            <button type="button" class="btn btn-primary rounded-pill agregarProducto recuperarBoton" idProducto="' . $value["id"] . '" ><i class="ri-shopping-basket-fill"></i></button>

                                
                                                                          </div>  
                                
                                                                        </td>
                                
                                                                      </tr>';
                                                }
                                                ?>

                                            </tbody> -->
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="col-12 col-lg-5">

                        <div class="col-12">
                            <div class="card">
                                <!-- <div class="card-header">
                                    <h4 class=".card-title">Total venta: Bs./ <span id="totalVenta">0.00</span>
                                    </h4>

                                </div> -->
                                <div class="card-body">
                                    <form role="form" method="post" class="formularioVenta">

                                        <!-- entrada usuario -->
                                        <div class="mb-3">
                                            <label for="" class="form-label"><i class="ri-user-3-fill"></i>Usuario</label>
                                            <input type="text" class="form-control" id="nuevoVendedor" value="<?php echo $_SESSION["nombre"]; ?>" readonly>
                                            <input type="hidden" name="idVendedor" value="<?php echo $_SESSION["id"]; ?>">
                                        </div>

                                        <!-- seleccionar cliente -->
                                        <div class="mb-3">
                                            <label for="inputState" class="form-label"><i class="ri-group-fill"></i>
                                                Cliente</label>
                                            <div class="input-group">
                                                <select class="form-select" id="seleccionarCliente" name="seleccionarCliente" required>
                                                    <option value="">Seleccionar cliente</option>

                                                    <?php
                                                    $item = null;
                                                    $valor = null;
                                                    //$clientes = ControladorClientes::ctrMostrarClientes($item, $valor);
                                                    foreach ($clientes as $key => $value) {
                                                        echo '<option value="' . $value["id"] . '">' . $value["nombre"] . ' ' . $value["apellido"] . '</option>';
                                                    }
                                                    ?>

                                                </select>
                                                <button class="btn btn-outline-secondary" type="button" data-bs-toggle="modal" data-bs-target="#agregarcliente">>Agregar
                                                    cliente</button>
                                            </div>
                                        </div>

                                        <!-- numero de boleta -->
                                        <div class="row g-2">
                                            <div class="mb-3 col-md-6">
                                                <label for="" class="form-label">Boleta</label>

                                                <?php
                                                $item = null;
                                                $valor = null;

                                                //$ventas = ControladorVentas::ctrMostrarVentas($item, $valor);

                                                if (!$ventas) {
                                                    echo '<input type="text" class="form-control" id="nuevaVenta"
                                                        name="nuevaVenta" value="10000" readonly>';
                                                } else {
                                                    foreach ($ventas as $key => $value) {
                                                    }
                                                    $codigo = $value["boleta"] + 1;
                                                    echo '<input type="text" class="form-control" id="nuevaVenta"
                                                        name="nuevaVenta" value="' . $codigo . '" readonly>';
                                                }
                                                ?>


                                            </div>

                                        </div>

                                        <!-- <div class="mb-3">
                                            <label for="inputAddress2" class="form-label">Efectivo recibido</label>
                                            <input type="text" class="form-control efectivoRecibido" name="efectivoRecibido" id="efectivoRecibido"
                                                placeholder="0.00">
                                        </div> -->
                                        <!-- <div class="mb-3">
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input" id="customCheck11">
                                                <label class="form-check-label" for="customCheck11">Efectivo
                                                    exacto</label>
                                            </div>
                                        </div> -->


                                        <!-- Nombre del producto -->
                                        <div class="form-group row nuevoProducto">

                                        </div>

                                        <input type="hidden" id="listaProductos" name="listaProductos">
                                        <br>

                                        <div class="row">
                                            <div class="col-xs-8 push-right">
                                                <div class="mb-3">
                                                    <h4>Total a pagar Bs./ <span id="totalPrecio" name="totalPrecio" total="" readonly required>
                                                            0.00</span>
                                                    </h4>
                                                </div>
                                                <input type="hidden" name="totalPrecios" id="totalPrecios">

                                                <div class="pagarEfectivo">

                                                </div>



                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-primary">Guardar</button>
                                        </div>
                                    </form>

                                    <?php

                                    //$guardarVenta = new ControladorVentas();
                                    //$guardarVenta->ctrCrearVenta();

                                    ?>

                                </div> <!-- end card-body -->
                            </div> <!-- end card-->
                        </div> <!-- end col -->

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--=======================
    MODAL AGREGAR CLIENTE
===========================-->
<div id="agregarcliente" class="modal" aria-labelledby="standard-modalLabel" aria-modal="true" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="standard-modalLabel">Agregar cliente</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <form action="" method="post">

                <div class="modal-body">
                    <div class="mb-3">
                        <label for="example-password" class="form-label">Nombre</label>
                        <input name="nuevoNombre" type="text" class="form-control" placeholder="Ingresar nombre">
                    </div>
                    <div class="mb-3">
                        <label for="example-password" class="form-label">Apellido</label>
                        <input name="nuevoApellido" type="text" class="form-control" placeholder="Ingresar apellido">
                    </div>
                    <div class="mb-3">
                        <label for="example-password" class="form-label">Nit</label>
                        <input name="nuevoNit" type="text" class="form-control" placeholder="Ingresar nit">
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-primary">Guardar</button>
                </div>

                <?php
                //$crearCliente = new ControladorClientes();
                //$crearCliente->ctrCrearClientes();
                ?>

            </form>

        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>