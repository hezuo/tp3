<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Pacifico.DataAccess.LIQUIDACION_VEHICULAR>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Liquidación Vehicular
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
            <td align="right">&nbsp;
        </td>
        </tr>
    </table>
    <table width="100%">
        <tr>
            <td><%: Html.ActionLink("Registrar Liquidación Vehicular", "Create", "LiquidacionVehicular", routeValues: null, htmlAttributes: new {@class="btn"})%></td>
        </tr>
    </table>

    <h4><b><font color="blue"><%=ViewData["Ok"] %></font></b></h4>

    <table class="table table-striped">
        <tr>
            <th>C&oacute;digo
        </th>
            <th>Siniestro
        </th>
            <th>P&oacute;liza
        </th>
            <th>Placa
        </th>
            <th>Cobertura</th>
            <th>Estado</th>
            <th></th>
        </tr>

        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <%: Html.DisplayFor(modelItem => item.Co_LiquidacionVehicular) %>
        </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.SINIESTRO.Nu_Siniestro) %>
        </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.SINIESTRO.POLIZA_VEHICULAR.Co_PolizaVehicular) %>
        </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.SINIESTRO.POLIZA_VEHICULAR.VEHICULO.Nu_Placa) %>
        </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.SINIESTRO.POLIZA_VEHICULAR.Ss_MontoCobertura) %>
        </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Tx_Estado) %>
        </td>
            <td>
                <%: Html.ActionLink("Visualizar Liquidación Vehicular", "Edit", new {  id=item.Co_LiquidacionVehicular  }) %>
                      
        </td>
            <% } %>
    </table>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>