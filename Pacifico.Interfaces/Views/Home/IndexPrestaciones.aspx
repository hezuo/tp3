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
                <h2>Sistema integrado de atención de servicios o prestaciones</h2>
                <!-- <h2><%: ViewBag.Message %></h2> -->
            </hgroup>
        </div>
    </section>
    <table width="100%">
        <tr>
            <td>  
                <ul class="nav nav-pills">
                    <% if (Request.IsAuthenticated) { %>
                    <li><%: Html.ActionLink("Solicitudes", "Index", "Solicitud") %></></li>
                    <li><%: Html.ActionLink("Prestadoras", "Index", "Prestadora") %></li>
                    <li><%: Html.ActionLink("Servicios", "IndexSolicitud", "Solicitud") %></li>
                    <li><%: Html.ActionLink("Negociacion", "IndexSolicitud2", "Solicitud") %></li>
                    <li><%: Html.ActionLink("Evaluacion", "IndexPrestadora", "Prestadora") %></li>
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