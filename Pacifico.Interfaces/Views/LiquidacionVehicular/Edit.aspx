<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Pacifico.DataAccess.LIQUIDACION_VEHICULAR>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Visualizar - Liquidación Vehicular
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Visualizar Liquidacion Vehicular</h2>
    <form id="form1" runat="server">

        <% if (!Request.IsAuthenticated)
           {
               @Response.Redirect("/Home/Index");
           }%>
        <% using (Html.BeginForm())
           { %>
        <%: Html.AntiForgeryToken() %>
        <%: Html.ValidationSummary(true) %>
        <h4>
            <b>
                <font color="red" id="errorMessage">
                <p><%: ViewData["Error"] %></p>
                <p><%: Html.ValidationMessageFor(model => model.Co_Siniestro) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Tx_Observaciones) %></p>
            </font>
            </b>
        </h4>

        <div class="form-actions">
            <table width="100%">
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <label>C&oacute;digo Siniestro<span id="lblco_Siniestro" class="required">(*)</span></label></td>
                    <td>
                        <label>:</label></td>
                    <td>
                        <%= Model.SINIESTRO.Nu_Siniestro %>
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <label>Nro. Póliza<span id="lblNroPoliza" class="required">(*)</span></label></td>
                    <td>
                        <label>:</label></td>
                    <td><%= Model.SINIESTRO.POLIZA_VEHICULAR.Nu_PolizaVehicular%></td>
                    <td>&nbsp;</td>
                    <td>
                        <label>Placa<span id="Span1" class="required">(*)</span></label></td>
                    <td>
                        <label>:</label></td>
                    <td><%= Model.SINIESTRO.POLIZA_VEHICULAR.VEHICULO.Nu_Placa %></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <label>Marca<span id="Span2" class="required">(*)</span></label></td>
                    <td>
                        <label>:</label></td>
                    <td>
                        <%= Model.SINIESTRO.POLIZA_VEHICULAR.VEHICULO.MODELO_VEHICULO.MARCA_VEHICULO.No_MarcaVehiculo%>
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <label>Monto Cobertura<span id="Span3" class="required">(*)</span></label></td>
                    <td>
                        <label>:</label></td>
                    <td><%= Model.SINIESTRO.POLIZA_VEHICULAR.Ss_MontoCobertura%></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <label>Nom. Asegurado<span id="Span4" class="required">(*)</span></label></td>
                    <td>
                        <label>:</label></td>
                    <td>
                       <%= Model.SINIESTRO.POLIZA_VEHICULAR.ASEGURADO.No_Asegurado%> 
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <label>Ap. Paterno<span id="Span5" class="required">(*)</span></label></td>
                    <td>
                        <label>:</label></td>
                    <td> <%= Model.SINIESTRO.POLIZA_VEHICULAR.ASEGURADO.No_ApePaterno%> </td>
                    <td>&nbsp;</td>
                    <td>
                        <label>Ap. Materno<span id="Span6" class="required">(*)</span></label></td>
                    <td>
                        <label>:</label></td>
                    <td><%= Model.SINIESTRO.POLIZA_VEHICULAR.ASEGURADO.No_ApeMaterno%></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <label>Observaciones<span id="Span7" class="required">(*)</span></label></td>
                    <td>
                        <label>:</label></td>
                    <td colspan="10">
                        <%= Model.Tx_Observaciones%>                        
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td colspan="7" align="center">
                        
                        &nbsp;
               
                        <%: Html.ActionLink("Volver", "Index", "LiquidacionVehicular", routeValues: null, htmlAttributes: new {@class="btn" })%>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <% } %>
    </form>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#Co_Siniestro").change(function () {
                llenarTextBox($("#Co_Siniestro").val());
            });
        });
        function llenarTextBox(value) {
            var selectedValue = value;
            $.ajax({
                url: '<%:Url.Action("GetDatosSiniestro", "LiquidacionVehicular")%>',
                type: 'POST',
                data: { "selectedValue": selectedValue },
                dataType: 'json',
                success: function (response) {
                    $("#txtPoliza").val(response.datosSiniestro[0].Poliza);
                    $("#txtPlaca").val(response.datosSiniestro[0].Placa);
                    $("#txtMarca").val(response.datosSiniestro[0].Marca);
                    $("#txtMontoCober").val(response.datosSiniestro[0].MontoCober);
                    $("#txtNombre").val(response.datosSiniestro[0].Nombre);
                    $("#txtApPaterno").val(response.datosSiniestro[0].ApePat);
                    $("#txtApMaterno").val(response.datosSiniestro[0].ApeMat);
                },
                error: function (error) {
                    aler("error");
                }
            });
        }
    </script>
</asp:Content>