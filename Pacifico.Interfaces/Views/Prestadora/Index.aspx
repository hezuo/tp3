<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PagedList.IPagedList<Pacifico.DataAccess.PRESTADORA>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index - Prestadoras
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
        <td><%: Html.ActionLink("Registrar Prestadora", "Create", "Prestadora", routeValues: null, htmlAttributes: new {@class="btn"})%></td>
        <td align="right"><%: Html.ActionLink("Buscar Prestadora", "Search", "Prestadora", routeValues: null, htmlAttributes: new {@class="btn"})%></td>
    </tr>
</table>

<h4><b><font color="blue"><%: ViewData["Ok"] %></font></b></h4>

<table class="table table-striped" >
    <tr>
        <th>ID</th>
        <th>Razón Social</th>
        <th>RUC</th>
        <th>Distrito</th>
        <th>Provincia</th>
        <th>Departamento</th>
        <th>Estado</th>
        <th>&nbsp;</th>
        <th>&nbsp;</th>
    </tr>
<% foreach (var item in Model) {
       var activo = "Inactiva";
       if (item.Fl_Activo == 1)
           activo = "Activa"; %>
    <tr>
        <td><%: Html.DisplayFor(modelItem => item.Co_Prestadora) %></td>
        <td><%: Html.DisplayFor(modelItem => item.Tx_RazonSocial) %></td>
        <td><%: Html.DisplayFor(modelItem => item.Nu_Ruc) %></td>
        <td><%: Html.DisplayFor(modelItem => item.DISTRITO.No_Distrito) %></td>
        <td><%: Html.DisplayFor(modelItem => item.DISTRITO.PROVINCIA.No_Provincia) %></td>
        <td><%: Html.DisplayFor(modelItem => item.DISTRITO.PROVINCIA.DEPARTAMENTO.No_Departamento) %></td>
        <td><%: activo %></td>
        <td><i class="icon-edit"></i> <%: Html.ActionLink("Modificar", "Edit", new { id=item.Co_Prestadora }) %></td>
        <td><i class="icon-file"></i> <%: Html.ActionLink("Visualizar", "Details", new { id=item.Co_Prestadora }) %></td>
    </tr>
<% } %>
</table>

<table width="100%">
    <tr>
        <td>
            <% string razon = (string)ViewData["Tx_RazonSocial"]; %>
            <% string ruc = (string)ViewData["Nu_Ruc"]; %>
            <% string fechaIni = (string)ViewData["Fe_AfiliacionIni"]; %>
            <% string fechaFin = (string)ViewData["Fe_AfiliacionFin"]; %>
            <% string estado = (string)ViewData["Fl_Activo"]; %>
            <%: Html.PagedListPager(Model,page => Url.Action("Index", new {razon,ruc,fechaIni,fechaFin,estado,page,pageSize=Model.PageSize}), new PagedListRenderOptions { LinkToFirstPageFormat = "<<", LinkToPreviousPageFormat = "<", LinkToNextPageFormat = ">", LinkToLastPageFormat = ">>", MaximumPageNumbersToDisplay=3 }) %>
        </td>
        <td align="right">
            Mostrando <%: Model.FirstItemOnPage %> a <%: Model.LastItemOnPage %> de <%: Model.TotalItemCount %> Prestadoras
        </td>
    </tr>
</table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
