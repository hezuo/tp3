<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Pacifico.DataAccess.PRESUPUESTO>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Evaluar Presupuesto
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.Hidden("Co_Presupuesto", Model.Co_Presupuesto) %>
    <%: Html.Hidden("Nu_Presupuesto", Model.Nu_Presupuesto) %>
    <%: Html.Hidden("Fe_Presupuesto", Model.Fe_Presupuesto) %>
    <%: Html.Hidden("Co_FormaPago", Model.Co_FormaPago) %>
    <%: Html.Hidden("Fl_Estado", Model.Fl_Estado) %>
    <%: Html.Hidden("Co_Siniestro", Model.Co_Siniestro) %>
        <div>
            <div style="text-align:center;"><h2>Evaluar Presupuesto</h2></div>            
        <h4>
        <b>
            <font color="red"  id="errorMessage">
                <p><%: ViewData["Error"] %></p>
                <% if (  Boolean.Parse( ViewData["excedePresupuesto"].ToString() ) ) { %>
             <p>   El presupuesto excede al 75% del valor comercial.</p>
    <%} %>
            </font>
            </b></h4>
             <div style="width: 100%; text-align: right;">
            <% if ( ! Boolean.Parse( ViewData["excedePresupuesto"].ToString() ) ) { %>
                   <button id="botonGuardar" class="btn btn-success">Aprobar</button>  
            <%} %>

                          <%: Html.ActionLink("Rechazar", "Rechazar", new { codPresupuesto = Model.Co_Presupuesto }, new { @class = "btn btn-danger", @id ="btnRechazar"})%>


          </div>


        </div>
             
    <div class="form-actions">
            <table width="100%">        
                <tr>
                    <td>Id_Poliza</td>
                    <td>:</td>
                    <td> <%= Model.SINIESTRO.POLIZA_VEHICULAR.Co_PolizaVehicular%>   </td>
                    <td colspan="4"></td>
                </tr> 
                <tr>
                    <td>Fecha</td>
                    <td>:</td>                    
                    <td><%= Model.Fe_Presupuesto%>  </td>
                    <td colspan="4"></td>
                </tr>
                <tr>                   
                    <td>Placa</td>
                    <td>:</td>
                    <td><span id="placa"> <%= Model.SINIESTRO.POLIZA_VEHICULAR.VEHICULO.Nu_Placa%> </span></td>
                    <td colspan="4">&nbsp;</td>
                     
                </tr>
                <tr>
                   <td>Observaciones</td>
                    <td>:</td>
                    <td>  <%: Html.EditorFor(model => model.Tx_Observacion) %>    </td>
                    <td colspan="4"></td>
                </tr> 
            </table>                
        
            <fieldset>
                <legend>Detalles</legend>

             <table class="table" id="tblArticulo">
                 <tr>
                     <th>&nbsp;</th>
                     <th>Art&iacute;culo</th>
                     <th>Precio Unitario</th>
                     <th>Cantidad</th>
                     <th>Total</th>
                 </tr>
                 <% 
           decimal? montoTotal = 0;
                     foreach (var preDetalle in Model.PRESUPUESTO_DETALLE) { %>

                 <tr>
                     <td>&nbsp;</td>
                     <td><%= preDetalle.ARTICULO.Nu_Articulo %></td>
                     <td><%= preDetalle.Ss_PrecioDetalle %></td>
                     <td><%= preDetalle.Qt_Cantidad %></td>
                     <td><%= (preDetalle.Qt_Cantidad * preDetalle.Ss_PrecioDetalle) %></td>
                 </tr>
                 <% montoTotal += (preDetalle.Ss_PrecioDetalle*preDetalle.Qt_Cantidad ); %>
                 <% } %>
                

             </table>
                <table width="100%">
                    <tr>
                        <td style="text-align: right; width: 300px">
                            Monto total: <span id="monto_total"><%=montoTotal %></span>
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
            $('a#btnRechazar').on('click', function (e) {
                e.preventDefault();
                var r = confirm("Desea rechazar presupuesto?");
                if (r) {
                    window.location = $(this).attr('href');
                }

            });

            $("#botonGuardar").click(function (e) {
                e.preventDefault();
                var Tx_Observacion = $("#Tx_Observacion").val();

                if (Tx_Observacion != "") {
                    var r = confirm("Desea aprobar Presupuesto?");
                    if (r) {
                        $("form").submit();
                    }

                } else {
                    $("#errorMessage").text("Ingrese todos los datos");
                }

            });


        });
        </script>

</asp:Content>