<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Buscar - Solicitudes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% if (!Request.IsAuthenticated)
    {
        @Response.Redirect("/Home/Index");   
    }%>
<h2>Buscar Solicitud de Afiliación</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.AntiForgeryToken() %>

    <h4>
        <b>
            <font color="red">
                <p><%: ViewData["Error"] %></p>
            </font>
        </b>
    </h4>
    <div class="form-actions">

<table width="100%">
        <tr>  
            <td>&nbsp;</td>
            <td><label>Razón Social</label></td> 
            <td><label>:</label></td>
            <td><%: Html.TextBox("Tx_RazonSocial", ViewData["Tx_RazonSocial"]) %></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label>RUC</label></td>
            <td><label>:</label></td>
            <td><%: Html.TextBox("Nu_Ruc", ViewData["Nu_Ruc"]) %></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label>Fecha de Registro</label></td>
            <td><label>:</label></td>
            <td><%: Html.TextBox("Fe_SolicitudIni", ViewData["Fe_SolicitudIni"]) %></td>
            <td><label>a</label></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td><%: Html.TextBox("Fe_SolicitudFin", ViewData["Fe_SolicitudFin"]) %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label>Responsable de Registro</label></td>
            <td><label>:</label></td>
            <td><%: Html.TextBox("No_UsuarioIns", ViewData["No_UsuarioIns"]) %></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label>Estado</label></td>
            <td><label>:</label></td>
            <td><%:Html.DropDownList("dsEstadoSolicitudList", (SelectList)ViewData["dsEstadoSolicitud"], "---------Seleccione---------")%></td>
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
        <tr>
            <td>&nbsp;</td>
            <td colspan="7" align="center">
		        <input type="submit" value="Buscar Solicitud" class="btn" />
                &nbsp;
                <%: Html.ActionLink("Cancelar", "Index", "Solicitud", routeValues: null, htmlAttributes: new {@class="btn", onclick = "return confirm('¿Desea salir de Buscar Solicitud?')" })%>
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
    <link href="/Content/bootstrap-datetimepicker.css" rel="stylesheet">
    <link href="/Content/datepicker.css" rel="stylesheet">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
    <script src="/Scripts/bootstrap-datepicker.js"></script>
    <script src="/Scripts/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#Fe_SolicitudIni").datepicker({ format: 'dd-mm-yyyy', forceParse: true });
            $("#Fe_SolicitudFin").datepicker({ format: 'dd-mm-yyyy', forceParse: true });
        });
    </script>
</asp:Content>
