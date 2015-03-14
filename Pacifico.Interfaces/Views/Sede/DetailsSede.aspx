<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Pacifico.DataAccess.SEDE>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Visualizar - Sedes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% if (!Request.IsAuthenticated)
    {
        @Response.Redirect("/Home/Index");   
    }%>
<h2>Sede</h2>

<div class="form-actions">
    <table width="100%">
        <tr>
            <td>&nbsp;</td>
            <td><label for="Co_Sede">Codigo</label></td>
            <td><label>:</label></td>
            <td><%: Model.Co_Sede %></td>
            <td>&nbsp;</td>
            <td><label for="No_Sede">Nombre</label></td>
            <td><label>:</label></td>
            <td><%: Model.No_Sede %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="Tx_Direccion">Direccion</label></td>
            <td><label>:</label></td>
            <td><%: Model.Tx_Direccion %></td>
            <td>&nbsp;</td>
            <td><label>Distrito</label></td>
            <td><label>:</label></td>
            <td><%: Model.DISTRITO.No_Distrito %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label>Provincia</label></td>
            <td><label>:</label></td>
            <td><%: Model.DISTRITO.PROVINCIA.No_Provincia %></td>
            <td>&nbsp;</td>
            <td><label>Departamento</label></td>
            <td><label>:</label></td>
            <td><%: Model.DISTRITO.PROVINCIA.DEPARTAMENTO.No_Departamento %></td>
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
            <td><%: Model.No_Contacto %></td>
            <td>&nbsp;</td>
            <td><label for="No_ApePatContacto">Apellido Paterno</label></td>
            <td><label>:</label></td>
            <td><%: Model.No_ApePatContacto %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="No_ApeMatContacto">Apellito Materno</label></td>
            <td><label>:</label></td>
            <td><%: Model.No_ApeMatContacto %></td>
            <td>&nbsp;</td>
            <td><label for="Nu_Telefono">Teléfono</label></td>
            <td><label>:</label></td>
            <td><%: Model.Nu_Telefono %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="Tx_CorreoContacto">Correo</label></td>
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
    </fieldset>
    <fieldset>
    <legend><label><strong>Datos de Control</strong></label></legend>
    <table width="100%">
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
    </table>
    </fieldset>
    <table width="100%">
        <tr>
            <td><%: Html.ActionLink("Atras", "IndexSede", "Sede", new { codigoSolicitud = ViewData["CoSolicitud"], codigoPrestadora = ViewData["CoPrestadora"] }, htmlAttributes: new {@class="btn"})%>
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
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>