<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PagedList.IPagedList<Pacifico.DataAccess.DOCUMENTO_INFORME_ACCIDENTE_VEHICULAR>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Adjuntar Archivos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% if (!Request.IsAuthenticated)
    {
        @Response.Redirect("/Home/Index");   
    }%>
<h2>Adjuntar Archivos para Informe Vehicular</h2>
    <h4>
        <b>
            <font color="red">
                <p><%: ViewData["Error"] %></p>
            </font>
        </b>
    </h4>
    <h4><b><font color="blue"><%=ViewData["Ok"] %></font></b></h4>

<div class="form-actions">
    <form action="/InformeAccidenteVehicular/AdjuntarArchivos/<%= ViewData["Co_InformeVehicular"] %>" method="post" enctype="multipart/form-data">
    <table width="100%">
        <tr>
            <td>&nbsp;</td>
            <td><label for="Co_Prestadora">Siniestro</label></td> 
            <td><label>:</label></td>
            <td><%= ViewData["Nu_Siniestro"] %></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label>Informe Vehicular</label></td>
            <td><label>:</label></td>
            <td><%= ViewData["Co_InformeVehicular"] %> </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>Adjuntar Archivos</td>
            <td><label>:</label></td>
            <td colspan="6">
                <input type="file" name="file" id="file" />
            </td>
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
		        <input type="submit" value="Grabar Datos" class = "btn"/>
                &nbsp;
                <%: Html.ActionLink("Cancelar", "Index", "InformeAccidenteVehicular", routeValues: null, htmlAttributes: new {@class="btn"})%>
            </td>
            <td>&nbsp;</td>
        </tr>
</table>
</form>
    <ul>
        <% foreach (var item in Model){ %>
        <li>
            <a href=" <%: Html.DisplayFor(modelItem => item.Tx_RutaArchivo) %>">   <%: Html.DisplayFor(modelItem => item.Tx_Descripcion) %></a>
        </li>
        <% } %>
    </ul>
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>