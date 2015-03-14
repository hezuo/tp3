<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Pacifico.DataAccess.INFORME_ACCIDENTE_VEHICULAR>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Informe de Accidentes Vehiculares
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
                <li><%: Html.ActionLink("Regresar al Home", "IndexSiniestroVehicular", "Home") %></></li>
            </ul>	
        </td>
        <td align="right">
            &nbsp;
        </td>
    </tr>
</table>

<table width="100%">
    <tr>
        <td><%: Html.ActionLink("Registrar Informe Accidente Vehicular", "Create", "InformeAccidenteVehicular", routeValues: null, htmlAttributes: new {@class="btn"})%></td>
    </tr>
</table>

<h4><b><font color="blue"><%=ViewData["Ok"] %></font></b></h4>

<table class="table table-striped" >
    <tr>
        <th>
            C&oacute;digo
        </th>
        <th>
            Siniestro
        </th>
        <th>
            Fecha
        </th>
        <th>
            Direcci&oacute;n
        </th>        
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Co_InformeAccidenteVehicular) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.SINIESTRO.Nu_Siniestro) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Fe_InformeAccidentVehicular) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Tx_Direccion) %>
        </td>        
        <td>
            <%: Html.ActionLink("Modificar Informe Accidente Vehicular", "Edit", new {  id=item.Co_InformeAccidenteVehicular  }) %>
                      
        </td>
<% } %>

</table>
   
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>