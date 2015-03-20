<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PagedList.IPagedList<Pacifico.DataAccess.SEDE>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Select - Evaluacion Servicios
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% if (!Request.IsAuthenticated)
    {
        @Response.Redirect("/Home/Index");   
    }%>
<h2>Seleccionar Sede a Evaluar</h2>

    
<div class="form-actions">
    <fieldset>
    <legend><label><strong>SOLICITUD</strong></label></legend>
    <table width="100%">
        <tr>
            <td>&nbsp;</td>
            <td><label>Código</label></td>
            <td><label>:</label></td>
            <td><%: ViewData["CoSolicitud"] %></td>
            <td>&nbsp;</td>
            <td><label>Estado</label></td>
            <td><label>:</label></td>
            <td><%: ViewData["EstadoSolicitud"] %></td>
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
    <legend><label><strong>PRESTADORA</strong></label></legend>
    <table width="100%">
        <tr>
            <td>&nbsp;</td>
            <td><label>Código</label></td>
            <td><label>:</label></td>
            <td><%: ViewData["CoPrestadora"] %></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label>Razón Social</label></td>
            <td><label>:</label></td>
            <td><%: ViewData["RazonSocial"] %></td>
            <td>&nbsp;</td>
            <td><label>RUC</label></td>
            <td><label>:</label></td>
            <td><%: ViewData["RUC"] %></td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </fieldset>
</div>
<table width="100%">
    <tr>
        <td><%: Html.ActionLink("Registrar Sede", "CreateSede", "Sede", new { CoSolicitud = ViewData["CoSolicitud"], CoPrestadora = ViewData["CoPrestadora"] }, htmlAttributes: new { @class = "btn" })%></td>
        <td align="right">&nbsp;</td>
    </tr>
</table>
    
<h4><b><font color="blue"><%: ViewData["Ok"] %></font></b></h4>

<table class="table table-striped" >
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Direccion</th>
        <th>Distrito</th>
        <th>Provincia</th>
        <th>Departamento</th>
        <th>&nbsp;</th>
        <th>&nbsp;</th>
    </tr>
<% foreach (var item in Model) { %>
    <tr>
        <td><%: Html.DisplayFor(modelItem => item.Co_Sede) %></td>
        <td><%: Html.DisplayFor(modelItem => item.No_Sede) %></td>
        <td><%: Html.DisplayFor(modelItem => item.Tx_Direccion) %></td>
        <td><%: Html.DisplayFor(modelItem => item.DISTRITO.No_Distrito) %></td>
        <td><%: Html.DisplayFor(modelItem => item.DISTRITO.PROVINCIA.No_Provincia) %></td>
        <td><%: Html.DisplayFor(modelItem => item.DISTRITO.PROVINCIA.DEPARTAMENTO.No_Departamento) %></td>
        <td><i class="icon-edit"></i> <%: Html.ActionLink("Modificar", "EditSede", "Sede", new { id=item.Co_Sede, CoSolicitud = ViewData["CoSolicitud"], CoPrestadora = ViewData["CoPrestadora"] }, htmlAttributes: null) %></td>
        <td><i class="icon-file"></i> <%: Html.ActionLink("Servicios", "Index","EvaluacionServicio", new { codigoSolicitud = ViewData["CoSolicitud"], codigoPrestadora = ViewData["CoPrestadora"], codigoSede=item.Co_Sede }, htmlAttributes: null) %></td>
    </tr>
<% } %>
</table>

<table width="100%">
    <tr>
        <td>
            <% int codigoSolicitud = (int)ViewData["CoSolicitud"]; %>
            <% int codigoPrestadora = (int)ViewData["CoPrestadora"]; %>
            <%: Html.PagedListPager(Model,page => Url.Action("SelectSede", new {codigoSolicitud,codigoPrestadora,page,pageSize=Model.PageSize}), new PagedListRenderOptions { LinkToFirstPageFormat = "<<", LinkToPreviousPageFormat = "<", LinkToNextPageFormat = ">", LinkToLastPageFormat = ">>", MaximumPageNumbersToDisplay=3 }) %>
        </td>
        <td align="right">
            Mostrando <%: Model.FirstItemOnPage %> a <%: Model.LastItemOnPage %> de <%: Model.TotalItemCount %> Prestadoras
        </td>
    </tr>
</table>

<table width="100%">
    <tr>
        <td><%: Html.ActionLink("Terminar", "IndexSolicitud", "Solicitud", routeValues: null, htmlAttributes: new {@class="btn", onclick = "return confirm('¿Desea terminar la evaluacion de servicio?')" })%>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>