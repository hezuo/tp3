<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Pacifico.DataAccess.INFORME_PROCURADORIA>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
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
                <li><%: Html.ActionLink("Regresar al Home", "IndexSiniestro", "Home") %></></li>
            </ul>	
        </td>
        <td align="right">
            &nbsp;
        </td>
    </tr>
</table>

<table width="100%">
    <tr>
        <td><%: Html.ActionLink("Crear un Nuevo Informe", "Create", "Informe_Procuradoria", routeValues: null, htmlAttributes: new {@class="btn"})%></td>
        <td align="right">&nbsp;</td>
    </tr>
</table>

<h4></h4>

<table class="table table-striped" >
    <tr>
         <th>
            <%: Html.DisplayNameFor(model => model.Co_NumInfProc) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.Tx_TipoResultado) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.Tx_Conclusiones) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.Fe_Emision) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.Fl_Aprobacion) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.EXPEDIENTE.BENEFICIARIO.No_Beneficiario) %>
        </th>
        <th></th>
    </tr>
<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Co_NumInfProc) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Tx_TipoResultado) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Tx_Conclusiones) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Fe_Emision) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Fl_Aprobacion) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.EXPEDIENTE.BENEFICIARIO.No_Beneficiario) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { /* id=item.PrimaryKey */ })%> | 
            <%: Html.ActionLink("Details", "Details", new { /* id=item.PrimaryKey */ }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { /* id=item.PrimaryKey */ }) %>
        </td>
    </tr>
<% } %>
</table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>