<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PagedList.IPagedList<Pacifico.DataAccess.SOLICITUD_AFILIACION>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index - Solicitudes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% if (!Request.IsAuthenticated)
    {
        @Response.Redirect("/Home/Index");   
    }%>
<table width="100%">
    <tr>
        <td>  
            <ul class="nav nav-pills">
                <li><%: Html.ActionLink("Regresar al Home", "IndexPrestaciones", "Home") %></></li>
            </ul>	
        </td>
        <td align="right">
            &nbsp;
        </td>
    </tr>
</table>

<table width="100%">
    <tr>
        <td><%: Html.ActionLink("Registrar Solicitud", "Create", "Solicitud", routeValues: null, htmlAttributes: new {@class="btn"})%></td>
        <td align="right"><%: Html.ActionLink("Buscar Solicitud", "Search", "Solicitud", routeValues: null, htmlAttributes: new {@class="btn"})%></td>
    </tr>
</table>

<h4><b><font color="blue"><%: ViewData["Ok"] %></font></b></h4>

<table class="table table-striped">
    <tr>
        <th>ID</th>
        <th>Prestadora</th>
        <th>RUC</th>
        <th>Fecha Solicitud</th>
        <th>Estado</th>
        <th>&nbsp;</th>
        <th>&nbsp;</th>
    </tr>
<% foreach (var item in Model) { %>
    <tr>
        <td><%: Html.DisplayFor(modelItem => item.Co_Solicitud) %></td>
        <td><%: Html.DisplayFor(modelItem => item.PRESTADORA.Tx_RazonSocial) %></td>
        <td><%: Html.DisplayFor(modelItem => item.PRESTADORA.Nu_Ruc) %></td>
        <td><%: String.Format("{0:d}", item.Fe_Solicitud)%></td>
        <td><%: Html.DisplayFor(modelItem => item.ESTADO_SOLICITUD.No_Estado) %></td>
        <td><i class="icon-edit"></i> <%: Html.ActionLink("Modificar", "Edit", new { id=item.Co_Solicitud }) %></td>
        <td><i class="icon-file"></i> <%: Html.ActionLink("Visualizar", "Details", new { id=item.Co_Solicitud }) %></td>
    </tr>
<% } %>

</table>
<table width="100%">
    <tr>
        <td>
            <% string razon = (string)ViewData["Tx_RazonSocial"]; %>
            <% string ruc = (string)ViewData["Nu_Ruc"]; %>
            <% string fechaIni = (string)ViewData["Fe_SolicitudIni"]; %>
            <% string fechaFin = (string)ViewData["Fe_SolicitudFin"]; %>
            <% string usuario = (string)ViewData["No_UsuarioIns"]; %>
            <% string estado = (string)ViewData["Estado_Solicitud"]; %>
            <%: Html.PagedListPager(Model,page => Url.Action("Index", new {razon,ruc,fechaIni,fechaFin,usuario,estado,page,pageSize=Model.PageSize}), new PagedListRenderOptions { LinkToFirstPageFormat = "<<", LinkToPreviousPageFormat = "<", LinkToNextPageFormat = ">", LinkToLastPageFormat = ">>", MaximumPageNumbersToDisplay=3 }) %>
        </td>
        <td align="right">
            Mostrando <%: Model.FirstItemOnPage %> a <%: Model.LastItemOnPage %> de <%: Model.TotalItemCount %> Solicitudes
        </td>
    </tr>

</table> 
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>