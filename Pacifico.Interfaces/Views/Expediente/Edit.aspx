<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Pacifico.DataAccess.EXPEDIENTE>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% if (!Request.IsAuthenticated)
    {
        @Response.Redirect("/Home/Index");   
    }%>
<h2>Editar Expediente</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(true) %>

    <h4>
        <b>
            <font color="red">
                <p><%: ViewData["Error"] %></p>
                <p><%: Html.ValidationMessageFor(model => model.Co_Expediente) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Co_Asegurado) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Co_Beneficiario) %></p>
            </font>
        </b>
    </h4>

    <div class="form-actions">

    <table width="100%">
        <tr>
            <td>&nbsp;</td>
            <td><%: Html.LabelFor(model => model.Co_Expediente) %></td>
            <td><label>:</label></td>
            <td><%: Html.EditorFor(model => model.Co_Expediente) %></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><%: Html.LabelFor(model => model.Co_Asegurado, "ASEGURADO") %></td>
            <td><label>:</label></td>
            <td><%: Html.DropDownList("Co_Asegurado", String.Empty) %></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><%: Html.LabelFor(model => model.Co_Beneficiario, "BENEFICIARIO") %></td>
            <td><label>:</label></td>
            <td><%: Html.DropDownList("Co_Beneficiario", String.Empty) %></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td colspan="7" align="center">
		        <input type="submit" value="Guardar Datos" class = "btn"/>
                &nbsp;
                <%: Html.ActionLink("Cancelar", "Index", "Expediente", routeValues: null, htmlAttributes: new {@class="btn", onclick = "return confirm('¿Desea salir de Modificar Expediente?')" })%>
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