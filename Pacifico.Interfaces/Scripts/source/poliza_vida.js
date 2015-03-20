var polizavida = new function () {
    function formatJSONDate(jsonDate) {
        /***si viene una fecha JSON de formato /Date(1224043200000)/*****/
        //var newDate = dateFormat(jsonDate, "dd/mm/yyyy");     
        var value = new Date(parseInt(jsonDate.substr(6)));
        var mes = value.getMonth() + 1;
        return value.getDate() + "/" + mes + "/" + value.getFullYear();;
    }
    //private
    ver = function (id) {
        $.get(
            '/Expediente/VerDetalle', //Action method del controller Expediente
            { idExpediente: id },       //Parametro para el action method
            function (jsonResult) {   //jsonResult contiene lo que retorna el action method
                //success y error deben ser parte del json que retorna el action method
                if (!jsonResult.success)
                    alert(jsonResult.error);
                else {
                    //Cargando los campos del div correspondiente al detalle del Expediente
                    $("#detalleIdExpediente").text(jsonResult.numExpediente);
                    $("#detallePrima").text(jsonResult.prima);
                    $("#detallefechaRenovacion").text(formatJSONDate(jsonResult.fechaRenovacion));
                    $("#detallefechaVencimiento").text(formatJSONDate(jsonResult.fechaVencimiento));
                    $("#detallefechaInicioVigencia").text(formatJSONDate(jsonResult.fechaInicioVigencia));

                    $("#detalleformaPago").text(jsonResult.formaPago);
                    $("#detalleestado").text(jsonResult.estado);

                }
            }
        );

    }

    insertar = function (jsonData) {
        $.post(
            '/Poliza_Vida/InsertarPoliza',
            jsonData,
            function (jsonResult) {
                if (!jsonResult.success) {
                    //alert(jsonResult.error);
                    debugger;
                    $("#msgError").text(jsonResult.error);
                }
                else {
                    $("#msgError").text("");

                    console.log(jsonResult.success);
                    $('#Co_PolizaVida').val(jsonResult.Co_PolizaVida);
                    console.log(jsonResult.Co_PolizaVida);
                    InsertarPro();
                }
            }
         )
    }

    eliminar = function (jsonData) {
        $.post(
            'Expediente/EliminarExpediente',
            jsonData,
            function (jsonResult) {
                if (!jsonResult.success)
                    alert(jsonResult.error);
                else {
                    alert("Se elimino el Expediente");
                    $("input").val('');
                    $("#dialogDeleteExpediente").dialog("close");
                    location.reload();
                }
            }
        )
    }

    verEliminar = function (id) {
        $.get(
            '/Expediente/VerEliminar',
            { idExpediente: id },
            function (jsonResult) {

                if (!jsonResult.success)
                    alert(jsonResult.error);
                else {
                    $("#detalleIdExpediente").text(jsonResult.IdExpediente);
                    $("#detalleNombre2").text(jsonResult.Nombre);
                    $("#detalleDescripcion2").text(jsonResult.Descripcion);
                    $("#detallePrecio2").text(jsonResult.Precio);
                }
            }
        );
        $("#dialogDeleteExpediente").dialog("open");
    }

    verEditar = function (id) {
        $.get(
            '/Expediente/VerEditar',
            { idExpediente: id },
            function (jsonResult) {

                if (!jsonResult.success)
                    alert(jsonResult.error);
                else {
                    $("#msgError").text("");
                    $("#Co_Expediente").val(jsonResult.Co_Expediente);
                    $("#Co_Asegurado").val(jsonResult.Co_Asegurado);
                    $("#editarDescripcion").val(jsonResult.Descripcion);
                    $("#editarPrecio").val(jsonResult.Precio);
                }
            }
        );

    }

    actualizar = function (jsonData) {
        $.post(
            '/Poliza_Vida/ActualizarPoliza',
            jsonData,
            function (jsonResult) {
                if (!jsonResult.success)
                    
                    $("#msgError").text(jsonResult.error);
                else {
                    $("#msgError").text("");
                    
                    InsertarPro();

                }
            }
        )
    }

    //public
    return {
        getDetalle: ver,
        insertPoliza: insertar,
        getDetalleEliminacion: verEliminar,
        eliminarExpediente: eliminar,
        getDetalleEdicion: verEditar,
        updatePoliza: actualizar
    };
}();