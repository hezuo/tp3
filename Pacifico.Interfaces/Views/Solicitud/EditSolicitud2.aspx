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
            <font color="blue">
                <p><%: ViewData["Ok"] %></p>
            </font>
            <font color="red">
                <p><%: ViewData["Error"] %></p>
                <p><%: Html.ValidationMessageFor(model => model.Tx_EvaluacionServicios) %></p>
            </font>
        </b>
    </h4>
    
    <div class="form-actions">

    <table width="100%">
        <tr>
            <td>&nbsp;</td>
            <td><label for="Co_Solicitud">Código de Solicitud</label></td>
            <td><label>:</label></td>
            <td><%: Model.Co_Solicitud%></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="Co_Prestadora">Código de Prestadora</label></td>
            <td><label>:</label></td>
            <td><%: Model.Co_Prestadora %></td>
            <td>&nbsp;</td>
            <td><label>RUC</label></td>
            <td><label>:</label></td>
            <td><%: Model.PRESTADORA.Nu_Ruc %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label>Razón Social</label></td>
            <td><label>:</label></td>
            <td><%: Model.PRESTADORA.Tx_RazonSocial %></td>
            <td>&nbsp;</td>
            <td><label>Dirección</label></td>
            <td><label>:</label></td>
            <td><%: Model.PRESTADORA.Tx_DomicilioFiscal %></td>
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
            <td><label for="No_Contacto">Nombre</label></td>
            <td><label>:</label></td>
            <td><%: Model.No_Contacto %></td>
            <td>&nbsp;</td>
            <td><label for="No_ApePatContacto">Apellido Paterno</label></td>
            <td><label>:</label></td>
            <td><%: Model.No_ApePatContacto %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="No_ApeMatContacto">Apellido Materno</label></td>
            <td><label>:</label></td>
            <td><%: Model.No_ApeMatContacto %></td>
            <td>&nbsp;</td>
            <td><label for="Tx_CorreoContacto">Correo</label></td>
            <td><label>:</label></td>
            <td><%: Model.Tx_CorreoContacto %></td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </fieldset>
    <table width="100%">
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
        <tr>
            <td>&nbsp;</td>
            <td><label for="Tx_ObservacionNegociador">Resume de Negociacion</label></td>
            <td><label>:</label></td>
            <td><%: Html.TextAreaFor(model => model.Tx_ObservacionNegociador) %></td>
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
    <table width="100%">
        <tr>
            <td>&nbsp;</td>
            <td align="center"><input type="submit" value="Guardar Datos" class="btn" />
            &nbsp;
            <%: Html.ActionLink("Cancelar", "IndexSolicitud2", "Solicitud", routeValues: null, htmlAttributes: new {@class="btn", onclick = "return confirm('¿Desea salir de Modificar Solicitud?')" })%>
            <td align="right">
            </td><td>&nbsp;</td>
        </tr>
    </table>
    </div>
<% } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>