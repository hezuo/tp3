<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Pacifico.DataAccess.SOLICITUD_AFILIACION>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Registrar - Solicitudes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% if (!Request.IsAuthenticated)
    {
        @Response.Redirect("/Home/Index");   
    }%>
<h2>Registrar Solicitud de Afiliación</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(true) %>

    <h4>
        <b>
            <font color="red">
                <p><%: ViewData["Error"] %></p>
                <p><%: Html.ValidationMessageFor(model => model.Co_Prestadora) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Co_Invitacion) %></p>
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
            <td><label for="Co_Prestadora">Código de Prestadora</label></td> 
            <td><label>:</label></td>
            <td><%: Html.TextBox("Co_Prestadora", ViewData["CodigoPrestadora"]) %></td>
            <td>&nbsp;</td>
            <td valign="top"><%:Html.ActionLink("Validar Prestadora", "Create", "Solicitud",  routeValues: null,  htmlAttributes: new {@class="btn" , id = "validarPrestadora"})%></td>
            <td>&nbsp;</td>
            <td valign="top"><%:Html.ActionLink("Seleccionar Prestadora", "Select", "Prestadora",  routeValues: null,  htmlAttributes: new {@class="btn"})%></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label>Razón Social</label></td>
            <td><label>:</label></td>
            <td><%: Html.TextBox("RazonSocial", ViewData["RazonSocial"], new { @disabled = "disabled" }) %></td>
            <td>&nbsp;</td>
            <td><label>RUC</label></td>
            <td><label>:</label></td>
            <td><%: Html.TextBox("RUC", ViewData["RUC"], new { @disabled = "disabled" }) %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="Co_Invitacion">Código de Invitación</label></td>
            <td><label>:</label></td>
            <td><%: Html.TextBox("Co_Invitacion", ViewData["CodigoInvitacion"]) %></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
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
            <td> <%: Html.EditorFor(model => model.No_ApePatContacto) %></td>
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
            <td><%: Html.Hidden("No_UsuarioIns", Page.User.Identity.Name) %></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td><%: Html.Hidden("No_UsuarioUpd", Page.User.Identity.Name) %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td colspan="7" align="center">
		        <input type="submit" value="Grabar Datos" class="btn" />
                &nbsp;
                <%: Html.ActionLink("Cancelar", "Index", "Solicitud", routeValues: null, htmlAttributes: new {@class="btn", onclick = "return confirm('¿Desea salir de Registrar Solicitud?')" })%>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </div>
<% } %>

<div>
    
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
    <script type="text/javascript">
        $(function () {
            $('#validarPrestadora').click(function () {
                var pre = $('#Co_Prestadora').val();
                var inv = $('#Co_Invitacion').val();
                var fol = $('#Nu_Folio').val();
                var con = $('#No_Contacto').val();
                var pat = $('#No_ApePatContacto').val();
                var mat = $('#No_ApeMatContacto').val();
                var tel = $('#Nu_TelefonoContacto').val();
                var cor = $('#Tx_CorreoContacto').val();
                var coo = $('#dsEmpleadoCoordinadorList').val();
                var eva = $('#dsEmpleadoEvaluadorList').val();
                this.href = this.href + '?CoPrestadora=' + encodeURIComponent(pre);
                this.href = this.href + '&CoInvitacion=' + encodeURIComponent(inv);
                this.href = this.href + '&NuFolio=' + encodeURIComponent(fol);
                this.href = this.href + '&NoContacto=' + encodeURIComponent(con);
                this.href = this.href + '&NoApePatContacto=' + encodeURIComponent(pat);
                this.href = this.href + '&NoApeMatContacto=' + encodeURIComponent(mat);
                this.href = this.href + '&NuTelefonoContacto=' + encodeURIComponent(tel);
                this.href = this.href + '&TxCorreoContacto=' + encodeURIComponent(cor);
                this.href = this.href + '&CoordinadorList=' + encodeURIComponent(coo);
                this.href = this.href + '&EvaluadorList=' + encodeURIComponent(eva);
            });
        });
    </script>

</asp:Content>