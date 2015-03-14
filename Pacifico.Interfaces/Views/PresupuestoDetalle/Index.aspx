<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Pacifico.DataAccess.PRESUPUESTO>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
PRESUPUESTO</asp:Content>

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
        <td><%: Html.ActionLink("Registrar Presupuesto", "Create", "PresupuestoDetalle", routeValues: null, htmlAttributes: new {@class="btn"})%></td>
    </tr>
</table>

<h4><b><font color="blue"><%=ViewData["Ok"] %></font></b></h4>

<table class="table table-striped" >
    <tr>
        <th>
            C&oacute;digo
        </th>
        <th>
            Presupuesto
        </th>
        <th>
            Medio de pago
        </th>
       
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Co_Presupuesto) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Nu_Presupuesto) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.FORMA_PAGO.No_FormaPago) %>
        </td>
     
<% } %>

</table>
   
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>