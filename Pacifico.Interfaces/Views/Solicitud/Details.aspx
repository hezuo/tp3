<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Pacifico.DataAccess.SOLICITUD_AFILIACION>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Visualizar - Solicitudes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% if (!Request.IsAuthenticated)
    {
        @Response.Redirect("/Home/Index");   
    }%>
<h2>Solicitud de Afiliación de Prestadora</h2>

<div class="form-actions">

    <table width="100%">
        <tr>
            <td>&nbsp;</td>
            <td><label for="Co_Solicitud">Código de Solicitud</label></td>
            <td><label>:</label></td>
            <td><%: Model.Co_Solicitud%></td>
            <td>&nbsp;</td>
            <td><label for="Co_Invitacion">Código de Invitación</label></td>
            <td><label>:</label></td>
            <td><%: Model.Co_Invitacion %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="Co_Prestadora">Código de Prestadora</label></td>
            <td><label>:</label></td>
            <td><%: Model.Co_Prestadora %></td>
            <td>&nbsp;</td>
            <td><label>Razón Social</label></td>
            <td><label>:</label></td>
            <td><%: Model.PRESTADORA.Tx_RazonSocial %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label>RUC</label></td>
            <td><label>:</label></td>
            <td><%: Model.PRESTADORA.Nu_Ruc %></td>
            <td>&nbsp;</td>
            <td><label>Teléfono</label></td>
            <td><label>:</label></td>
            <td><%: Model.PRESTADORA.Nu_TelefonoRepresentanteLegal %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label>Dirección</label></td>
            <td><label>:</label></td>
            <td><%: Model.PRESTADORA.Tx_DomicilioFiscal %></td>
            <td>&nbsp;</td>
            <td><label>Distrito</label></td>
            <td><label>:</label></td>
            <td><%: Model.PRESTADORA.DISTRITO.No_Distrito %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label>Provincia</label></td>
            <td><label>:</label></td>
            <td><%: Model.PRESTADORA.DISTRITO.PROVINCIA.No_Provincia %></td>
            <td>&nbsp;</td>
            <td><label>Departamento</label></td>
            <td><label>:</label></td>
            <td><%: Model.PRESTADORA.DISTRITO.PROVINCIA.DEPARTAMENTO.No_Departamento %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="Nu_Folio">Número de Folio</label></td>
            <td><label>:</label></td>
            <td><%: Model.Nu_Folio %></td>
            <td>&nbsp;</td>
            <td><label for="Fe_Solicitud">Fecha de Solicitud</label></td>
            <td><label>:</label></td>
            <td><%: String.Format("{0:d}", Model.Fe_Solicitud)%></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="No_Contacto">Nombre de Contacto</label></td>
            <td><label>:</label></td>
            <td><%: Model.No_Contacto %></td>
            <td>&nbsp;</td>
            <td><label for="No_ApePatContacto">Apellido Paterno de Contacto</label></td>
            <td><label>:</label></td>
            <td><%: Model.No_ApePatContacto %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="No_ApeMatContacto">Apellido Materno de Contacto</label></td>
            <td><label>:</label></td>
            <td><%: Model.No_ApeMatContacto %></td>
            <td>&nbsp;</td>
            <td><label for="Nu_TelefonoContacto">Teléfono de Contacto</label></td>
            <td><label>:</label></td>
            <td><%: Model.Nu_TelefonoContacto %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="Tx_CorreoContacto">Correo de Contacto</label></td>
            <td><label>:</label></td>
            <td><%: Model.Tx_CorreoContacto %></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="Co_Coordinador">Coordinador</label></td>
            <td><label>:</label></td>
            <td><%: Model.EMPLEADO.No_EmpleadoCompleto %></td>
            <td>&nbsp;</td>
            <td><label for="Co_Evaluador">Evaluador</label></td>
            <td><label>:</label></td>
            <td><%: Model.EMPLEADO1.No_EmpleadoCompleto %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="Co_Estado">Estado Solicitud</label></td>
            <td><label>:</label></td>
            <td><%: Model.ESTADO_SOLICITUD.No_Estado %></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="Fe_RegistroIns">Fecha Registro Inicial</label></td>
            <td><label>:</label></td>
            <td><%: Model.Fe_RegistroIns%></td>
            <td>&nbsp;</td>
            <td><label for="No_UsuarioIns">Usuario Registro Inicial</label></td>
            <td><label>:</label></td>
            <td><%: Model.No_UsuarioIns %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="Fe_RegistroUpd">Fecha Ultima Modificación</label></td>
            <td><label>:</label></td>
            <td><%: Model.Fe_RegistroUpd%></td>
            <td>&nbsp;</td>
            <td><label for="No_UsuarioUpd">Usuario Ultima Modificación</label></td>
            <td><label>:</label></td>
            <td><%: Model.No_UsuarioUpd %></td>
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
        <tr>
            <td>&nbsp;</td>
            <td><%: Html.ActionLink("Atras", "Index", "Solicitud", routeValues: null, htmlAttributes: new {@class="btn"})%>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
