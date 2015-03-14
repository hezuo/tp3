<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Pacifico.DataAccess.PRESTADORA>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Visualizar - Prestadoras
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% if (!Request.IsAuthenticated)
    {
        @Response.Redirect("/Home/Index");   
    }%>
<h2>Prestadora</h2>

<div class="form-actions">
    <% var activo = "Inactiva";
       if (Model.Fl_Activo == 1)
           activo = "Activa";
       %>
    <table width="100%">
        <tr>
            <td>&nbsp;</td>
            <td><label for="Co_Prestadora">Código de Prestadora</label></td>
            <td><label>:</label></td>
            <td><%: Model.Co_Prestadora%></td>
            <td>&nbsp;</td>
            <td><label for="Tx_RazonSocial">Razón Social</label></td>
            <td><label>:</label></td>
            <td><%: Model.Tx_RazonSocial %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="Nu_Ruc">RUC</label></td>
            <td><label>:</label></td>
            <td><%: Model.Nu_Ruc %></td>
            <td>&nbsp;</td>
            <td><label for="Tx_DomicilioFiscal">Domicilio Fiscal</label></td>
            <td><label>:</label></td>
            <td><%: Model.Tx_DomicilioFiscal %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label>Distrito</label></td>
            <td><label>:</label></td>
            <td><%: Model.DISTRITO.No_Distrito %></td>
            <td>&nbsp;</td>
            <td><label>Provincia</label></td>
            <td><label>:</label></td>
            <td><%: Model.DISTRITO.PROVINCIA.No_Provincia %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label>Departamento</label></td>
            <td><label>:</label></td>
            <td><%: Model.DISTRITO.PROVINCIA.DEPARTAMENTO.No_Departamento %></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="No_RepresentanteLegal">Nombre Representante Legal</label></td>
            <td><label>:</label></td>
            <td><%: Model.No_RepresentanteLegal %></td>
            <td>&nbsp;</td>
            <td><label for="No_ApePatRepresentanteLegal">Apellido Paterno Representante Legal</label></td>
            <td><label>:</label></td>
            <td><%: Model.No_ApePatRepresentanteLegal %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="No_ApeMatRepresentanteLegal">Apellito Materno Representante Legal</label></td>
            <td><label>:</label></td>
            <td><%: Model.No_ApeMatRepresentanteLegal %></td>
            <td>&nbsp;</td>
            <td><label for="Nu_TelefonoRepresentanteLegal">Teléfono Representante Legal</label></td>
            <td><label>:</label></td>
            <td><%: Model.Nu_TelefonoRepresentanteLegal %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="Tx_CorreoRepresentanteLegal">Correo Represetante Legal</label></td>
            <td><label>:</label></td>
            <td><%: Model.Tx_CorreoRepresentanteLegal %></td>
            <td>&nbsp;</td>
            <td><label for="Tx_PaginaWeb">Página Web</label></td>
            <td><label>:</label></td>
            <td><%: Model.Tx_PaginaWeb %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="Fe_Afiliacion">Fecha Afiliación</label></td>
            <td><label>:</label></td>
            <td><%: String.Format("{0:d}", Model.Fe_Afiliacion)%></td>
            <td>&nbsp;</td>
            <td><label for="Fl_Activo">Estado</label></td>
            <td><label>:</label></td>
            <td><%: activo %></td>
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
            <td><%: Html.ActionLink("Atras", "Index", "Prestadora", routeValues: null, htmlAttributes: new {@class="btn"})%>
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
