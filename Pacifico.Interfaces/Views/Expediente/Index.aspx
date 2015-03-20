<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Pacifico.DataAccess.EXPEDIENTE>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% if (!Request.IsAuthenticated)
    {
        @Response.Redirect("/Home/Index");
    }%>
    <h2>Lista de Expedientes </h2>
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
    <br />
   
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


            <%: Html.DisplayFor(modelItem => item.BENEFICIARIO.No_ApellidoPaterno) %>


            <%: Html.DisplayFor(modelItem => item.BENEFICIARIO.No_ApellidoMaterno) %>
        </td>
        <td>
            <%--<i class="icon-edit"></i> <%: Html.ActionLink("Examinar Expediente", "CReate", new {  id=item.Co_Expediente }) %>
            --%>
            


                 <%: Html.ActionLink("Editar", "Create",new {id=item.Co_Expediente })%>
            

        </td>
    </tr>
<% } %>
</table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>