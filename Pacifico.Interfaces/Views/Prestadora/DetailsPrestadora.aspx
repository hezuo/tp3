<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Pacifico.DataAccess.EVALUACION_PRESTADORA>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details - Evaluacion Prestadora
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% if (!Request.IsAuthenticated)
    {
        @Response.Redirect("/Home/Index");   
    }%>
<h2>Detalle de Evaluacion de Prestadora</h2>

    
<div class="form-actions">
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

<table class="table table-striped" >
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Peso (%)</th>
        <th>Puntaje</th>
        <th>Total</th>
    </tr>
<%  decimal pesoTotal = 0;
    decimal puntajeTotal = 0;
    decimal Total = 0;
    foreach (var item in Model) {

        decimal peso = item.CRITERIO_EVALUACION.Po_Peso;
        decimal puntaje = item.Nu_Puntaje;
        decimal totalCriterio = ((peso / 100) * puntaje);
        
        pesoTotal = pesoTotal + item.CRITERIO_EVALUACION.Po_Peso;
        puntajeTotal = puntajeTotal + item.Nu_Puntaje;
        Total = Total + totalCriterio; %>
    <tr>
        <td><%: Html.DisplayFor(modelItem => item.Co_Criterio) %></td>
        <td><%: Html.DisplayFor(modelItem => item.CRITERIO_EVALUACION.No_Criterio) %></td>
        <td><%: Html.DisplayFor(modelItem => item.CRITERIO_EVALUACION.Po_Peso) %></td>
        <td><%: Html.DisplayFor(modelItem => item.Nu_Puntaje) %></td>
        <td><%: totalCriterio %></td>
    </tr>
<% } %>
    <tr>
        <th>&nbsp;</th>
        <th>Total</th>
        <th><%: pesoTotal %></th>
        <th><%: puntajeTotal %></th>
        <th><%: Total %></th>
    </tr>
</table>

<table width="100%">
    <tr>
        <td><%: Html.ActionLink("Atras", "IndexPrestadora", "Prestadora", routeValues: null, htmlAttributes: new {@class="btn"})%>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>