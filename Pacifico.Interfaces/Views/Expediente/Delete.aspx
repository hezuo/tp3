<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Pacifico.DataAccess.EXPEDIENTE>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% if (!Request.IsAuthenticated)
    {
        @Response.Redirect("/Home/Index");   
    }%>
<h2>Borrar Expediente</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.AntiForgeryToken() %>

    <div class="form-actions">

    <table width="100%">
        <tr>
            <td>&nbsp;</td>
            <td><%: Html.DisplayNameFor(model => model.Co_Expediente) %></td>
            <td><label>:</label></td>
            <td><%: Html.DisplayFor(model => model.Co_Expediente) %></td>
            <td>&nbsp;</td>
            <td><%: Html.DisplayNameFor(model => model.ASEGURADO.Nu_DocumentoIdentidad) %></td>
            <td><label>:</label></td>
            <td><%: Html.DisplayFor(model => model.ASEGURADO.Nu_DocumentoIdentidad) %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><%: Html.DisplayNameFor(model => model.BENEFICIARIO.Nu_DocIdentidad) %></td>
            <td><label>:</label></td>
            <td><%: Html.DisplayFor(model => model.BENEFICIARIO.Nu_DocIdentidad) %></td>
            <td>&nbsp;</td>
            <td><%: Html.DisplayNameFor(model => model.BENEFICIARIO.No_Beneficiario) %></td>
            <td><label>:</label></td>
            <td><%: Html.DisplayFor(model => model.BENEFICIARIO.No_Beneficiario) %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><%: Html.DisplayNameFor(model => model.BENEFICIARIO.No_ApePaterno) %></td>
            <td><label>:</label></td>
            <td><%: Html.DisplayFor(model => model.BENEFICIARIO.No_ApePaterno) %></td>
            <td>&nbsp;</td>
            <td><%: Html.DisplayNameFor(model => model.BENEFICIARIO.Nu_DocIdentidad) %></td>
            <td><label>:</label></td>
            <td><%: Html.DisplayFor(model => model.BENEFICIARIO.Nu_DocIdentidad) %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><%: Html.DisplayNameFor(model => model.BENEFICIARIO.No_ApeMaterno) %></td>
            <td><label>:</label></td>
            <td><%: Html.DisplayFor(model => model.BENEFICIARIO.No_ApeMaterno) %></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td colspan="7" align="center">
		        <input type="submit" value="Borrar Datos" class = "btn"/>
                &nbsp;
                <%: Html.ActionLink("Cancelar", "Index", "Expediente", routeValues: null, htmlAttributes: new {@class="btn"})%>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </div>
<% } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>