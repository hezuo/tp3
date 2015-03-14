<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Pacifico.DataAccess.PRESTADORA>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Editar - Prestadoras
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% if (!Request.IsAuthenticated)
    {
        @Response.Redirect("/Home/Index");   
    }%>
<h2>Modificar Prestadoras</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(true) %>

    <h4>
        <b>
            <font color="red">
                <p><%: ViewData["Error"] %>
                <p><%: Html.ValidationMessageFor(model => model.Co_Prestadora) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Tx_RazonSocial) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Nu_Ruc) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Tx_DomicilioFiscal) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Co_Distrito) %></p>
                <p><%: Html.ValidationMessageFor(model => model.No_RepresentanteLegal) %></p>
                <p><%: Html.ValidationMessageFor(model => model.No_ApePatRepresentanteLegal) %></p>
                <p><%: Html.ValidationMessageFor(model => model.No_ApeMatRepresentanteLegal) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Nu_TelefonoRepresentanteLegal) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Tx_CorreoRepresentanteLegal) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Tx_PaginaWeb) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Fe_Afiliacion) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Fl_Activo) %></p>
            </font>
        </b>
    </h4>

    <div class="form-actions">

    <table width="100%">
        <tr>
            <td>&nbsp;</td>
            <td><label for="Co_Solicitud">Código de Prestadora</label></td>
            <td><label>:</label></td>
            <td><%: Html.TextBoxFor(model => model.Co_Prestadora, new { @disabled = "disabled" }) %></td>
            <td>&nbsp;</td>
            <td><label for="Fe_Solicitud">Fecha Afiliación</label></td>
            <td><label>:</label></td>
            <td><%: Html.TextBox("Fe_Solicitud", String.Format("{0:d}", Model.Fe_Afiliacion), new { @disabled = "disabled" } ) %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="Tx_RazonSocial">Razón Social</label></td>
            <td><label>:</label></td>
            <td><%: Html.EditorFor(model => model.Tx_RazonSocial) %></td>
            <td>&nbsp;</td>
            <td><label for="Nu_Ruc">RUC<font color="red">&nbsp;*&nbsp;</font></label></td>
            <td><label>:</label></td>
            <td><%: Html.EditorFor(model => model.Nu_Ruc) %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="Tx_DomicilioFiscal">Domicilio Fiscal</label></td>
            <td><label>:</label></td>
            <td><%: Html.EditorFor(model => model.Tx_DomicilioFiscal) %></td>
            <td>&nbsp;</td>
            <td><label>Departamento<font color="red">&nbsp;*&nbsp;</font></label></td>
            <td><label>:</label></td>
            <td><%:Html.DropDownList("dsDepartamentoList", (SelectList)ViewData["dsDepartamento"], "---------Seleccione---------")%></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label>Provincia<font color="red">&nbsp;*&nbsp;</font></label></td>
            <td><label>:</label></td>
            <td><%:Html.DropDownList("dsProvinciaList", (SelectList)ViewData["dsProvincia"], "---------Seleccione---------")%></td>
            <td>&nbsp;</td>
            <td><label for="Co_Distrito">Distrito<font color="red">&nbsp;*&nbsp;</font></label></td>
            <td><label>:</label></td>
            <td><%:Html.DropDownList("dsDistritoList", (SelectList)ViewData["dsDistrito"], "---------Seleccione---------")%></td>
            <td>&nbsp;</td>
        </tr>
         <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <fieldset>
    <legend><label><strong>Datos de Representante Legal</strong></label></legend>
    <table width="100%">
        <tr>
            <td>&nbsp;</td>
            <td><label for="No_RepresentanteLegal">Nombre</label></td>
            <td><label>:</label></td>
            <td><%: Html.EditorFor(model => model.No_RepresentanteLegal) %></td>
            <td>&nbsp;</td>
            <td><label for="No_ApePatRepresentanteLegal">Apellido Paterno</label></td>
            <td><label>:</label></td>
            <td><%: Html.EditorFor(model => model.No_ApePatRepresentanteLegal) %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="No_ApeMatRepresentanteLegal">Apellido Materno</label></td>
            <td><label>:</label></td>
            <td><%: Html.EditorFor(model => model.No_ApeMatRepresentanteLegal) %></td>
            <td>&nbsp;</td>
            <td><label for="Nu_TelefonoRepresentanteLegal">Teléfono</label></td>
            <td><label>:</label></td>
            <td><%: Html.EditorFor(model => model.Nu_TelefonoRepresentanteLegal) %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="Tx_CorreoRepresentanteLegal">Correo<font color="red">&nbsp;*&nbsp;</font></label></td>
            <td><label>:</label></td>
            <td><%: Html.EditorFor(model => model.Tx_CorreoRepresentanteLegal) %></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td><%: Html.Hidden("No_UsuarioUpd", Page.User.Identity.Name) %></td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </fieldset>
    <table width="100%">
        <tr>
            <td><label><font color="red" size=2>* Campos Obligatorios</font></label></td>
            <td><input type="submit" value="Guardar Datos" class="btn" />
            &nbsp;
            <%: Html.ActionLink("Cancelar", "Index", "Prestadora", routeValues: null, htmlAttributes: new {@class="btn", onclick = "return confirm('¿Desea salir de Modificar Prestadora?')" })%>
            <td>&nbsp;</td>
        </tr>
    </table>
    </div>
<% } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#dsDepartamentoList").change(function () {
                llenarProvincias($("#dsDepartamentoList").val());
            });
        });
    </script>
    <script type="text/javascript">
        function llenarProvincias(value) {
            var selectedValue = value;
            $.ajax({
                url: '<%:Url.Action("GetProvincia", "Prestadora")%>',
                type: 'POST',
                data: { "selectedValue": selectedValue },
                dataType: 'json',
                success: function (response) {
                    var items = "";
                    var items2 = "<option value=\"\">---------Seleccione---------</option>";
                    items += "<option value=\"\">---------Seleccione---------</option>";
                    $.each(response.provList, function (i, item) {
                        items += "<option value=\"" + item + "\">" + item + "</option>";
                    });
                    $("#dsProvinciaList").html(items);
                    $("#dsDistritoList").html(items2);
                },
                error: function (error) {
                    aler("error");
                }
            });
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#dsProvinciaList").change(function () {
                llenarDistritos($("#dsProvinciaList").val(), $("#dsDepartamentoList").val());
            });
        });
    </script>
    <script type="text/javascript">
        function llenarDistritos(pro, dep) {
            var selectedProv = pro;
            var selectedDept = dep;
            $.ajax({
                url: '<%:Url.Action("GetDistrito", "Prestadora")%>',
                type: 'POST',
                data: { "selectedProv": selectedProv, "selectedDept": selectedDept },
                dataType: 'json',
                success: function (response) {
                    var items = "";
                    items += "<option value=\"\">---------Seleccione---------</option>";
                    $.each(response.distList, function (i, item) {
                        items += "<option value=\"" + item + "\">" + item + "</option>";
                    });
                    $("#dsDistritoList").html(items);
                },
                error: function (error) {
                    aler("error");
                }
            });
        }
    </script>
</asp:Content>
