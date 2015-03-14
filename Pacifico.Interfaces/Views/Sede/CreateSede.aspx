<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Pacifico.DataAccess.SEDE>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Registrar - Sedes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% if (!Request.IsAuthenticated)
    {
        @Response.Redirect("/Home/Index");   
    }%>
<h2>Registrar Sede</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(true) %>

    <h4>
        <b>
            <font color="red">
                <p><%: ViewData["Error"] %></p>
                <p><%: Html.ValidationMessageFor(model => model.No_Sede) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Tx_Direccion) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Co_Distrito) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Nu_Telefono) %></p>
                <p><%: Html.ValidationMessageFor(model => model.No_Contacto) %></p>
                <p><%: Html.ValidationMessageFor(model => model.No_ApePatContacto) %></p>
                <p><%: Html.ValidationMessageFor(model => model.No_ApeMatContacto) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Tx_CorreoContacto) %></p>
            </font>
        </b>
    </h4>

    <div class="form-actions">

    <table width="100%">
        <tr>
            <td>&nbsp;</td>
            <td><label for="No_Sede">Nombre Sede</label></td>
            <td><label>:</label></td>
            <td><%: Html.EditorFor(model => model.No_Sede) %></td>
            <td>&nbsp;</td>
            <td><label for="Tx_Direccion">Direccion</label></td>
            <td><label>:</label></td>
            <td><%: Html.EditorFor(model => model.Tx_Direccion) %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label>Departamento<font color="red">&nbsp;*&nbsp;</font></label></td>
            <td><label>:</label></td>
            <td><%:Html.DropDownList("dsDepartamentoList", (SelectList)ViewData["dsDepartamento"], "---------Seleccione---------")%></td>
            <td>&nbsp;</td>
            <td><label>Provincia<font color="red">&nbsp;*&nbsp;</font></label></td>
            <td><label>:</label></td>
            <td><%:Html.DropDownList("dsProvinciaList", (SelectList)ViewData["dsProvincia"], "---------Seleccione---------")%></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="Co_Distrito">Distrito<font color="red">&nbsp;*&nbsp;</font></label></td>
            <td><label>:</label></td>
            <td><%:Html.DropDownList("dsDistritoList", (SelectList)ViewData["dsDistrito"], "---------Seleccione---------")%></td>
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
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <fieldset>
    <legend><label><strong>Datos de Contacto</strong></label></legend>
    <table width="100%">
        <tr>
            <td>&nbsp;</td>
            <td><label for="No_Contacto">Nombre</label></td>
            <td><label>:</label></td>
            <td><%: Html.EditorFor(model => model.No_Contacto) %></td>
            <td>&nbsp;</td>
            <td><label for="No_ApePatContacto">Apellido Paterno</label></td>
            <td><label>:</label></td>
            <td><%: Html.EditorFor(model => model.No_ApePatContacto) %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="No_ApeMatContacto">Apellido Materno</label></td>
            <td><label>:</label></td>
            <td><%: Html.EditorFor(model => model.No_ApeMatContacto) %></td>
            <td>&nbsp;</td>
            <td><label for="Nu_Telefono">Telefono</label></td>
            <td><label>:</label></td>
            <td><%: Html.EditorFor(model => model.Nu_Telefono) %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="Tx_CorreoContacto">Correo<font color="red">&nbsp;*&nbsp;</font></label></td>
            <td><label>:</label></td>
            <td><%: Html.EditorFor(model => model.Tx_CorreoContacto) %></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><%: Html.Hidden("Co_Solicitud", ViewData["co_Solicitud"]) %></td>
            <td>&nbsp;</td>
            <td><%: Html.Hidden("Co_Prestadora", ViewData["Co_Prestadora"]) %></td>
            <td>&nbsp;</td>
            <td><%: Html.Hidden("No_UsuarioIns", Page.User.Identity.Name) %></td>
            <td>&nbsp;</td>
            <td><%: Html.Hidden("No_UsuarioUpd", Page.User.Identity.Name) %></td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </fieldset>
    <table width="100%">
        <tr>
            <td><label><font color="red" size=2>* Campos Obligatorios</font></label></td>
            <td>
		        <input type="submit" value="Grabar Datos" class = "btn"/>
                &nbsp;
                <%: Html.ActionLink("Cancelar", "SelectSede", "EvaluacionServicio",  new { codigoSolicitud = ViewData["co_Solicitud"], codigoPrestadora = ViewData["Co_Prestadora"] }, htmlAttributes: new {@class="btn", onclick = "return confirm('¿Desea salir de Registrar Sede?')" })%>
            </td>
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