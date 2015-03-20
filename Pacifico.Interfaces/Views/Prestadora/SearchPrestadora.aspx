<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Buscar - Prestadoras
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% if (!Request.IsAuthenticated)
    {
        @Response.Redirect("/Home/Index");   
    }%>
<h2>Buscar Prestadora</h2>

    
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
            <td><label>Fecha de Afiliacion</label></td>
            <td><label>:</label></td>
            <td><%: Html.TextBox("Fe_AfiliacionIni", ViewData["Fe_AfiliacionIni"]) %></td>
            <td><label>a</label></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td><%: Html.TextBox("Fe_AfiliacionFin", ViewData["Fe_AfiliacionFin"]) %></td>
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
		        <input type="submit" value="Buscar Prestadora" class="btn" />
                &nbsp;
                <%: Html.ActionLink("Cancelar", "IndexPrestadora", "Prestadora", routeValues: null, htmlAttributes: new {@class="btn", onclick = "return confirm('¿Desea salir de Buscar Prestadora?')" })%>
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
            $("#Fe_AfiliacionIni").datepicker({ format: 'dd-mm-yyyy', forceParse: true });
            $("#Fe_AfiliacionFin").datepicker({ format: 'dd-mm-yyyy', forceParse: true });
        });
    </script>
</asp:Content>