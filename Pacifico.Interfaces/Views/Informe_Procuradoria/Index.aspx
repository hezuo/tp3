<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Pacifico.DataAccess.INFORME_PROCURADORIA>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% if (!Request.IsAuthenticated)
    {
        @Response.Redirect("/Home/Index");
    }%>
<h2>Lista de Informes de Procuradoria</h2>
<label id="lblmsg" style="<%:ViewBag.css %>">
    No Existen expedientes por evaluar
</label>


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
        <td>
            <%: Html.ActionLink("Crear un Nuevo Informe Procuraduria", "Create", new { id = 0, ac = 0 }, new { @class="btn"})%>
            


        </td>
        <td align="right">&nbsp;</td>
    </tr>
</table>
     <br />

<table class="table table-striped">
    <tr>
        <th>
            Nro informe
        </th>
        <th>
            Fecha Emision
        </th>
        <th>
           Nro Expediente
        </th>
        
        
        <th>
            Asegurado
        </th>
        <th></th>
    </tr>

<%foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Co_NumInfProc) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Fe_Emision)%>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.EXPEDIENTE.Co_Expediente)%>
        </td>
        
 
        <td>
            <%:Html.DisplayFor(modelItem => item.EXPEDIENTE.ASEGURADO.No_Asegurado )%>
            <%:Html.DisplayFor(modelItem => item.EXPEDIENTE.ASEGURADO.No_ApePaterno)%>
            <%:Html.DisplayFor(modelItem => item.EXPEDIENTE.ASEGURADO.No_ApeMaterno)%>

        </td>
        <td>
            
            <%: Html.ActionLink("Editar", "Create", new { id = item.EXPEDIENTE.Co_Expediente, ac=1 })%> |
            <%: Html.ActionLink("Ver", "Create", new { id = item.EXPEDIENTE.Co_Expediente,ac=2 }) %> |
        </td>
    </tr>
<% } %>

</table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>