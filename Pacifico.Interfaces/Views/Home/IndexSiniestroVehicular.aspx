<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page - My ASP.NET MVC Application
</asp:Content>

<asp:Content ID="indexFeatured" ContentPlaceHolderID="FeaturedContent" runat="server">
    <% if (!Request.IsAuthenticated)
    {
        @Response.Redirect("/Home/Index");   
    }%>
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Sistema integrado de atencion de siniestros vehiculares</h1>
                <!-- <h2><%: ViewBag.Message %></h2> --> 
            </hgroup>
        </div>
    </section>
    <table width="100%">
        <tr>
            <td>  
                <ul class="nav nav-pills">
                    <% if (Request.IsAuthenticated) { %>
                    <li><%: Html.ActionLink("Accidentes Vehiculares", "Index", "InformeAccidenteVehicular") %></li>
                    <li><%: Html.ActionLink("Liquidaciones Vehiculares", "Index", "LiquidacionVehicular") %></li>
                    <li><%: Html.ActionLink("Presupuestos", "Index", "PresupuestoDetalle") %></li>
                    <% } %>
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
            <ul class="nav nav-pills">
                <li><%: Html.ActionLink("Salir del Módulo", "Index", "Home") %></></li>
            </ul>	
        </td>
        <td align="right">
            &nbsp;
        </td>
    </tr>
    </table>
</asp:Content>