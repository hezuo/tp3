<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Pacifico.DataAccess.PRESUPUESTO>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
CONSULTAR PRESUPUESTO</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% if (!Request.IsAuthenticated)
    {
        @Response.Redirect("/Home/Index");
    }%>


         <div>
            <div style="text-align:center;"><h2>Consultar Presupuesto</h2>
         </div>
            </div>           
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


<h4><b><font color="blue"><%=ViewData["Ok"] %></font></b></h4>

<table class="table table-striped" >
    <tr>
        <th>
            C&oacute;digo
        </th>
        <th>
            Asegurado
        </th>
        <th>
            Tel&eacute;fono
        </th>
        <th>
            Estado
        </th>
        <th>
            Evaluar
        </th>
       
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Co_Presupuesto) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.SINIESTRO.POLIZA_VEHICULAR.ASEGURADO.No_ApePaterno) %>
            <%: Html.DisplayFor(modelItem => item.SINIESTRO.POLIZA_VEHICULAR.ASEGURADO.No_ApeMaterno) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.SINIESTRO.POLIZA_VEHICULAR.ASEGURADO.Nu_Telefono1) %>
        </td>
        <td>
            <% if (item.Fl_Estado == 2)
               {%>
            Pendiente
               <%  }
               else if (item.Fl_Estado == 3) {%>
            Cerrado
               <% }  %>
        </td>

        <td>
            <% if (item.Fl_Estado == 2)
               { %>
                   <%: Html.ActionLink("Evaluar Presupuesto", "Evaluar", new { codPresupuesto = item.Co_Presupuesto } )   %>
            <%   }  %>
        </td>

     
<% } %>

</table>
   
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>