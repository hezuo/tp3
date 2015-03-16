<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Pacifico.DataAccess.LIQUIDACION_VEHICULAR>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Ingresar - Liquidación Vehicular
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create</h2>
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
                        <%:Html.DropDownListFor(model => model.Co_Siniestro, (SelectList)ViewData["coSiniestroList"], "---------Seleccione---------")%>
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <label>Nro. Póliza<span id="lblNroPoliza" class="required">(*)</span></label></td>
                    <td>
                        <label>:</label></td>
                    <td><span id="txtPoliza"></span></td>
                    <td>&nbsp;</td>
                    <td>
                        <label>Placa<span id="Span1" class="required">(*)</span></label></td>
                    <td>
                        <label>:</label></td>
                    <td><span id="txtPlaca"></span></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <label>Marca<span id="Span2" class="required">(*)</span></label></td>
                    <td>
                        <label>:</label></td>
                    <td>
                        <span id="txtMarca"></span>
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <label>Monto Cobertura<span id="Span3" class="required">(*)</span></label></td>
                    <td>
                        <label>:</label></td>
                    <td>
                        <span id="txtMontoCober"></span>     

                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="height: 23px"></td>
                    <td style="height: 23px">
                        <label>Nom. Asegurado<span id="Span4" class="required">(*)</span></label></td>
                    <td style="height: 23px">
                        <label>:</label></td>
                    <td style="height: 23px">
                        <span id="txtNombre"></span>                        
                    </td>
                    <td style="height: 23px"></td>
                    <td style="height: 23px">
                        <label>Ap. Paterno<span id="Span5" class="required">(*)</span></label></td>
                    <td style="height: 23px">
                        <label>:</label></td>
                    <td style="height: 23px"><span id="txtApPaterno"></span></td>
                    <td style="height: 23px"></td>
                    <td style="height: 23px">
                        <label>Ap. Materno<span id="Span6" class="required">(*)</span></label></td>
                    <td style="height: 23px">
                        <label>:</label></td>
                    <td style="height: 23px"><span id="txtApMaterno"></span></td>
                    <td style="height: 23px"></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <label>Observaciones<span id="Span7" class="required">(*)</span></label></td>
                    <td>
                        <label>:</label></td>
                    <td colspan="10">
                        <%:Html.TextAreaFor(model => model.Tx_Observaciones, new { @class = "required" })%>                        
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td colspan="7" align="center">
                        <input type="submit" value="Grabar Datos" class="btn" />
                        &nbsp;
               
                        <%: Html.ActionLink("Cancelar", "Index", "LiquidacionVehicular", routeValues: null, htmlAttributes: new {@class="btn", onclick = "return confirm('¿Desea salir de Registrar Expediente?')" })%>
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
                    $("#txtPoliza").text(response.datosSiniestro[0].Poliza);
                    $("#txtPlaca").text(response.datosSiniestro[0].Placa);
                    $("#txtMarca").text(response.datosSiniestro[0].Marca);
                    $("#txtMontoCober").text(response.datosSiniestro[0].MontoCober);
                    $("#txtNombre").text(response.datosSiniestro[0].Nombre);
                    $("#txtApPaterno").text(response.datosSiniestro[0].ApePat);
                    $("#txtApMaterno").text(response.datosSiniestro[0].ApeMat);
                },
                error: function (error) {
                    aler("error");
                }
            });
        }
    </script>
</asp:Content>
