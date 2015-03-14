<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page - My ASP.NET MVC Application
</asp:Content>

<asp:Content ID="indexFeatured" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h2>Bienvenido a la Intranet de Pacifico Seguros</h2>
                <!-- <h2><%: ViewBag.Message %></h2> -->
            </hgroup>
        </div>
    </section>
    <table width="100%">
        <tr>
            <td>  
                <% if (Request.IsAuthenticated) { %>
                <ul class="nav nav-pills">
                    <li><%: Html.ActionLink("Módulo Atención de Servicios o Prestaciones", "IndexPrestaciones", "Home") %></></li>
                </ul>
                <ul class="nav nav-pills">
                    <li><%: Html.ActionLink("Módulo Atención de Siniestros", "IndexSiniestro", "Home") %></li>
                </ul>
                <ul class="nav nav-pills">
                    <li><%: Html.ActionLink("Módulo Atención de Siniestros Vehiculares", "IndexSiniestroVehicular", "Home") %></li>
                </ul>
                <% } %>
            </td>
            <td align="right">
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>