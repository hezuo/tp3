<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Pacifico.DataAccess.SOLICITUD_AFILIACION>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Editar - Solicitudes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% if (!Request.IsAuthenticated)
    {
        @Response.Redirect("/Home/Index");   
    }%>
<h2>Modificar Solicitud de Afiliación de Prestadora</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(true) %>

    <h4>
        <b>
            <font color="red">
                <p><%: ViewData["Error"] %></p>
                <p><%: Html.ValidationMessageFor(model => model.Co_Solicitud) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Co_Invitacion) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Co_Prestadora) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Fe_Solicitud) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Nu_Folio) %></p>
                <p><%: Html.ValidationMessageFor(model => model.No_Contacto) %></p>
                <p><%: Html.ValidationMessageFor(model => model.No_ApePatContacto) %></p>
                <p><%: Html.ValidationMessageFor(model => model.No_ApeMatContacto) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Nu_TelefonoContacto) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Tx_CorreoContacto) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Co_Coordinador) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Co_Evaluador) %></p>
            </font>
        </b>
    </h4>

    <div class="form-actions">

    <table width="100%">
        <tr>
            <td>&nbsp;</td>
            <td><label for="Co_Solicitud">Código de Solicitud</label></td>
            <td><label>:</label></td>
            <td><%: Html.TextBoxFor(model => model.Co_Solicitud, new { @disabled = "disabled" }) %></td>
            <td>&nbsp;</td>
            <td><label for="Fe_Solicitud">Fecha Solicitud</label></td>
            <td><label>:</label></td>
            <td><%: Html.TextBox("Fe_Solicitud", String.Format("{0:d}", Model.Fe_Solicitud), new { @disabled = "disabled" } ) %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="Co_Invitacion">Código de Invitación</label></td>
            <td><label>:</label></td>
            <td><%: Html.TextBoxFor(model => model.Co_Invitacion, new { @disabled = "disabled" }) %></td>
            <td>&nbsp;</td>
            <td><label for="Co_Prestadora">Código de Prestadora</label></td>
            <td><label>:</label></td>
            <td><%: Html.TextBoxFor(model => model.Co_Prestadora, new { @disabled = "disabled" }) %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label>Razón Social</label></td>
            <td><label>:</label></td>
            <td><%: Html.TextBoxFor(model => model.PRESTADORA.Tx_RazonSocial, new { @disabled = "disabled" }) %></td>
            <td>&nbsp;</td>
            <td><label>RUC</label></td>
            <td><label>:</label></td>
            <td><%: Html.TextBoxFor(model => model.PRESTADORA.Nu_Ruc, new { @disabled = "disabled" }) %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label>Teléfono</label></td>
            <td><label>:</label></td>
            <td><%: Html.TextBoxFor(model => model.PRESTADORA.Nu_TelefonoRepresentanteLegal, new { @disabled = "disabled" }) %></td>
            <td>&nbsp;</td>
            <td><label>Dirección</label></td>
            <td><label>:</label></td>
            <td><%: Html.TextBoxFor(model => model.PRESTADORA.Tx_DomicilioFiscal, new { @disabled = "disabled" }) %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label>Distrito</label></td>
            <td><label>:</label></td>
            <td><%: Html.TextBoxFor(model => model.PRESTADORA.DISTRITO.No_Distrito, new { @disabled = "disabled" }) %></td>
            <td>&nbsp;</td>
            <td><label>Provincia</label></td>
            <td><label>:</label></td>
            <td><%: Html.TextBoxFor(model => model.PRESTADORA.DISTRITO.PROVINCIA.No_Provincia, new { @disabled = "disabled" }) %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label>Departamento</label></td>
            <td><label>:</label></td>
            <td><%: Html.TextBoxFor(model => model.PRESTADORA.DISTRITO.PROVINCIA.DEPARTAMENTO.No_Departamento, new { @disabled = "disabled" }) %></td>
            <td>&nbsp;</td>
            <td><label>Estado de Solicitud</label></td>
            <td><label>:</label></td>
            <td><%: Html.TextBoxFor(model => model.ESTADO_SOLICITUD.No_Estado, new { @disabled = "disabled" }) %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="Nu_Folio">Número de Folio</label></td>
            <td><label>:</label></td>
            <td><%: Html.EditorFor(model => model.Nu_Folio) %></td>
            <td>&nbsp;</td>
            <td><label for="No_Contacto">Nombre de Contacto</label></td>
            <td><label>:</label></td>
            <td><%: Html.EditorFor(model => model.No_Contacto) %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="No_ApePatContacto">Apellido Paterno de Contacto</label></td>
            <td><label>:</label></td>
            <td><%: Html.EditorFor(model => model.No_ApePatContacto) %></td>
            <td>&nbsp;</td>
            <td><label for="No_ApeMatContacto">Apellido Materno de Contacto</label></td>
            <td><label>:</label></td>
            <td><%: Html.EditorFor(model => model.No_ApeMatContacto) %></td>
            <td>&nbsp;</td>
            
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="Nu_TelefonoContacto">Teléfono de Contacto</label></td>
            <td><label>:</label></td>
            <td><%: Html.EditorFor(model => model.Nu_TelefonoContacto) %></td>
            <td>&nbsp;</td>
            <td><label for="Tx_CorreoContacto">Correo de Contacto</label></td>
            <td><label>:</label></td>
            <td><%: Html.EditorFor(model => model.Tx_CorreoContacto) %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="Co_Coordinador">Coordinador</label></td>
            <td><label>:</label></td>
            <td><%:Html.DropDownList("dsEmpleadoCoordinadorList", (SelectList)ViewData["dsEmpleadoCoordinador"], "---------Seleccione---------")%></td>
            <td>&nbsp;</td>
            <td><label for="Co_Evaluador">Evaluador</label></td>
            <td><label>:</label></td>
            <td><%:Html.DropDownList("dsEmpleadoEvaluadorList", (SelectList)ViewData["dsEmpleadoEvaluador"], "---------Seleccione---------")%></td>
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
    <table width="100%">
        <tr>
            <td>&nbsp;</td>
            <td align="center"><input type="submit" value="Guardar Datos" class="btn" />
            &nbsp;
            <%: Html.ActionLink("Cancelar", "Index", "Solicitud", routeValues: null, htmlAttributes: new {@class="btn", onclick = "return confirm('¿Desea salir de Modificar Solicitud?')" })%>
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
</asp:Content>
