<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Pacifico.DataAccess.PRESUPUESTO>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Registrar Presupuesto
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <%: Html.AntiForgeryToken() %>
        <div>
            <div style="text-align:center;"><h2>Registrar Presupuesto</h2></div>
            <div style="width: 100%; text-align: right;"><button id="botonGuardar" class="btn">GUARDAR</button></div>
        <h4>
        <b>
            <font color="red"  id="errorMessage">
                <p><%: ViewData["Error"] %></p>
            </font>
            </b></h4>
        
        </div>
    <div class="form-actions">
            <table width="100%">        
                <tr>
                    <td>Siniestro</td>
                    <td>:</td>
                    <td> <%:Html.DropDownList("Co_Siniestro", (SelectList)ViewData["coSiniestroList"], "---------Seleccione---------")%>   </td>
                    <td colspan="4"> </td>
                </tr> 
                <tr>
                    <td>Asegurado</td>
                    <td>:</td>
                    <td colspan="5"><span id="asegurado"></span></td>
                </tr>
                <tr>
                    <td>N P&oacute;liza</td>
                    <td>:</td>
                    <td><span id="poliza"></span></td>
                    <td>&nbsp;</td>
                    <td>Placa</td>
                    <td>:</td>
                    <td><span id="placa"></span></td>
                </tr>
                <tr>
                    <td>Forma de pago</td>
                    <td>:</td>
                    <td>  <%:Html.DropDownList("Co_FormaPago", (SelectList)ViewData["Co_FormaPagoList"], "---------Seleccione---------")%>   </td>
                    <td colspan="4"> </td>
                </tr> 
            </table>
        
        
        
            <fieldset>
                <legend>Detalles</legend>

<table style="width: 100%;">
    <tr>
        <td>Articulo</td>
        <td>:</td>
        <td><%:Html.DropDownList("ds_articulo", (SelectList)ViewData["dsArticulo"], "---------Seleccione---------")%> </td>
        <td>&nbsp;</td>
        <td>Cantidad</td>
        <td>:</td>
        <td><input name="cantidad" id="cantidad"  value=""/></td>
    </tr>
     <tr>
        <td>Precio</td>
        <td>:</td>
        <td><span id="precio"></span></td>
        <td>&nbsp;</td>
        <td colspan="3" style="text-align: right;"><input type="button" id="agregar_articulo" value="Agregar" class="btn"/></td>        
    </tr>
</table>
             <table class="table" id="tblArticulo">
                 <tr>
                     <th>&nbsp;</th>
                     <th>Art&iacute;culo</th>
                     <th>Precio Unitario</th>
                     <th>Cantidad</th>
                     <th>Total</th>
                 </tr>
                

             </table>
                <table width="100%">
                    <tr>
                        <td style="text-align: right; width: 300px">
                            Monto total: <span id="monto_total"></span>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </div>
    </form>
     <ul class="nav nav-pills">
                <li><%: Html.ActionLink("Regresar al Home", "Index", "PresupuestoDetalle") %></></li>
            </ul>	
  <% } %>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
  
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">


    <script type="text/javascript">
        $(document).ready(function () {
            $("#Co_Siniestro").change(function () {
                $("span#poliza").text("");
                $("span#placa").text("");
                $("span#asegurado").text("");
                llenarSiniestro($(this).val());
            });
            
            $("#ds_articulo").change(function () {                
                llenarDatosArticulo($(this).val());
            });

            $("#agregar_articulo").click(function (e) {
                e.preventDefault();

                var articulo = parseInt($("#ds_articulo").val(), 10);
                var cantidad = parseInt($("input#cantidad").val(), 10);

                if (isNaN(articulo) || articulo == 0 || isNaN(cantidad) || cantidad < 1) return false;

                var artDesc = $("#ds_articulo option[value='" + articulo + "']").text();
                var precio = $("span#precio").text();
           
                
                var total = precio * cantidad;
                var newtr = '<tr id="trArt' + articulo + '"><td><a href="#" class="editar_articulo" data-artparent="trArt' + articulo + '" data-artid="' + articulo + '"  data-precio="' + precio + '"><span class="icon-pencil">e</span></a></td><td><input type="hidden" name="articulos[]" value="' + articulo + '" /> <input type="hidden" class="cantidad" name="cant_articulos[]" value="' + cantidad + '" /><input type="hidden" class="cantidad" name="precios_articulos[]" value="' + precio + '" />' + artDesc + '</td><td class="precio">' + precio + '</td><td>' + cantidad + '</td><td class="sub_total">' + total + '</td></tr>';
                if ($("#tblArticulo tr#trArt" + articulo).length == 1) {
                    $("#tblArticulo tr#trArt" + articulo).replaceWith(newtr);
                } else {
                    $('#tblArticulo').append(newtr);
                }
                
                $("input#cantidad").val("");
                $("span#precio").text("");
                $("#ds_articulo").val($("#ds_articulo option:first").val());
                var monto_total = 0;
                $("td.sub_total").each(function (i) {
                    monto_total += parseInt($(this).text(), 10);
                });
                $("span#monto_total").text(monto_total);
                setupArtEdit();
            });

            $("#botonGuardar").click(function (e) {
                e.preventDefault();
                var coSiniestro = parseInt($("#Co_Siniestro").val(), 10);
                var Co_FormaPago = parseInt($("#Co_FormaPago").val(), 10);
                var trs = $(" #tblArticulo tr").length;
                if (Co_FormaPago > 0
                    && coSiniestro > 0
                    && trs > 1) {
                    var r = confirm("Desea guardar?");
                    if (r) {
                        $("form").submit();
                    }
                    
                } else {
                    $("#errorMessage").text("Ingrese todos los datos");
                }
                
            });

           
        });

        function setupArtEdit() {
            
            $(" #tblArticulo tr a.editar_articulo").off().click(function (e) {
                e.preventDefault();
                console.log($(this));
                var tr = $("tr#" + trId);
                var trId = $(this).data('artparent');
                var artid = $(this).data('artid');
                var precio = $(this).data('precio');                
                var cantidad = $("tr#" + trId + " input.cantidad").attr("value");
                $("#ds_articulo").val(artid);
                $("span#precio").text(precio);
                $("input#cantidad").val(cantidad);
                
            });
        }

        function llenarSiniestro(value) {

            var selectedValue = value;
            $.ajax({
                url: '<%:Url.Action("getDatosSiniestro", "PresupuestoDetalle")%>',
                type: 'POST',
                data: { "codSiniestro": selectedValue },
                dataType: 'json',
                success: function (response) {
                    $("span#poliza").text(response.poliza);
                    $("span#placa").text(response.placa);
                    $("span#asegurado").text(response.asegurado);
                },
                error: function (error) {
                    alert("error");
                }
            });

        }
    
        function llenarDatosArticulo(value) {
            $("input#cantidad").val("");
            $("span#precio").val("");

            if (parseInt(value, 10) > 0) {
                var selectedValue = value;
                $.ajax({
                    url: '<%:Url.Action("getDatosArticulo", "PresupuestoDetalle")%>',
                type: 'POST',
                data: { "codArticulo": selectedValue },
                dataType: 'json',
                success: function (response) {
                    $("span#precio").text(response.precio);                    
                },
                error: function (error) {
                    alert("error");
                }
                });
               
            }
            
        }
    </script>
</asp:Content>