<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Pacifico.DataAccess.EXPEDIENTE>>" %>

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
        <td><%: Html.ActionLink("Crear Nuevo Expediente", "Create", "Expediente", routeValues: null, htmlAttributes: new {@class="btn"})%></td>
        <td align="right">&nbsp;</td>
    </tr>
</table>

<h4></h4>

<table class="table table-striped" >
    <tr>
        <th>
            Nro
        </th>
        <th>
            DNI Asegurado
        </th>
        <th>
            Asegurado
        </th>
        <th>
            DNI Beneficiario
        </th>
        <th>
           Beneficiario
        </th>
        <th></th>
    </tr>
<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Co_Expediente) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.ASEGURADO.Nu_DocumentoIdentidad) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.ASEGURADO.No_Asegurado) %>
            <%: Html.DisplayFor(modelItem => item.ASEGURADO.No_ApePaterno) %>
            <%: Html.DisplayFor(modelItem => item.ASEGURADO.No_ApeMaterno) %>

        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.BENEFICIARIO.Nu_DocIdentidad) %>
        </td>
        <td>

            <%: Html.DisplayFor(modelItem => item.BENEFICIARIO.No_Beneficiario) %>


            <%: Html.DisplayFor(modelItem => item.BENEFICIARIO.No_ApePaterno) %>


            <%: Html.DisplayFor(modelItem => item.BENEFICIARIO.No_ApeMaterno) %>
        </td>
        <td>
            <i class="icon-edit"></i> <%: Html.ActionLink("Examinar Expediente", "Details", new {  id=item.Co_Expediente }) %>

            <i class="icon-edit"></i> <%: Html.ActionLink("Informe Procuradoria", "Create","Informe_Procuradoria", new { id = item.Co_Expediente },null) %>
        </td>
    </tr>
<% } %>
</table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>