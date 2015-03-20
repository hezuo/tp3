<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PagedList.IPagedList<Pacifico.DataAccess.SERVICIO_SEDE>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index - Servicio Sedes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% if (!Request.IsAuthenticated)
    {
        @Response.Redirect("/Home/Index");   
    }%>

    <h2>Negociar Servicios</h2>

<div class="form-actions">
    <fieldset>
    <legend><label><strong>PRESTADORA</strong></label></legend>
    <table width="100%">
        <tr>
            <td>&nbsp;</td>
            <td><label>Nombre</label></td>
            <td><label>:</label></td>
            <td><%: ViewData["RazonSocial"] %></td>
            <td>&nbsp;</td>
            <td><label>RUC</label></td>
            <td><label>:</label></td>
            <td><%: ViewData["RUC"] %></td>
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
    <legend><label><strong>SEDE</strong></label></legend>
    <table width="100%">
        <tr>
            <td>&nbsp;</td>
            <td><label>Codigo</label></td>
            <td><label>:</label></td>
            <td><%: ViewData["CoSede"] %></td>
            <td>&nbsp;</td>
            <td><label>Nombre</label></td>
            <td><label>:</label></td>
            <td><%: ViewData["NoSede"] %></td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </fieldset>
</div>

<h4><b><font color="blue"><%: ViewData["Ok"] %></font></b></h4>

<table class="table table-striped" >
    <tr>
        <th>ID</th>
        <th>Servicio</th>
        <th>Especialidad</th>
        <th>Estado</th>
        <th>Red</th>
        <th>Cobertura</th>
        <th>Copago</th>
        <th>&nbsp;</th>
    </tr>
<% foreach (var item in Model) { %>
    <tr>
        <td><%: Html.DisplayFor(modelItem => item.Co_Servicio) %></td>
        <td><%: Html.DisplayFor(modelItem => item.SERVICIO.No_Servicio) %></td>
        <td><%: Html.DisplayFor(modelItem => item.SERVICIO.ESPECIALIDAD.No_Especialidad) %></td>
        <td><%: Html.DisplayFor(modelItem => item.Tx_Estado) %></td>
        <td><%: Html.DisplayFor(modelItem => item.Co_Red) %></td>
        <td><%: Html.DisplayFor(modelItem => item.Po_Cobertura) %></td>
        <td><%: Html.DisplayFor(modelItem => item.Po_Copago) %></td>
        <td><i class="icon-edit"></i> <%: Html.ActionLink("Modificar", "Edit", new { idSede=item.Co_Sede,idServicio=item.Co_Servicio, CoSolicitud = ViewData["CoSolicitud"], CoPrestadora = ViewData["CoPrestadora"] }) %></td>
    </tr>
<% } %>
</table>

<table width="100%">
    <tr>
        <td>
            <% int codigoSolicitud = (int)ViewData["CoSolicitud"]; %>
            <% int codigoPrestadora = (int)ViewData["CoPrestadora"]; %>
            <% int codigoSede = (int)ViewData["CoSede"]; %>
            <%: Html.PagedListPager(Model,page => Url.Action("Index", new {codigoSolicitud,codigoPrestadora,codigoSede,page,pageSize=Model.PageSize}), new PagedListRenderOptions { LinkToFirstPageFormat = "<<", LinkToPreviousPageFormat = "<", LinkToNextPageFormat = ">", LinkToLastPageFormat = ">>", MaximumPageNumbersToDisplay=3 }) %>
        </td>
        <td align="right">
            Mostrando <%: Model.FirstItemOnPage %> a <%: Model.LastItemOnPage %> de <%: Model.TotalItemCount %> Prestadoras
        </td>
    </tr>
</table>

<table width="100%">
    <tr>
        <td><%: Html.ActionLink("Volver a Seleccionar Sede", "SelectSede", "NegociacionServicio", new { codigoSolicitud = ViewData["CoSolicitud"], codigoPrestadora = ViewData["CoPrestadora"] }, htmlAttributes: new {@class="btn"})%>
        <td>
            <%: Html.ActionLink("Terminar", "IndexSolicitud2", "Solicitud", routeValues: null, htmlAttributes: new {@class="btn", onclick = "return confirm('¿Desea terminar la negociacion de servicio?')" })%>
        </td>
        <td>&nbsp;</td>
    </tr>
</table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>