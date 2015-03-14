<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Pacifico.DataAccess.USUARIO>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    LogIn - Pacifico
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Ingrese Usuario y Contraseña</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(true) %>

    <h4>
        <b>
            <font color="red">
                <p><%: ViewData["Error"] %></p>
                <p><%: Html.ValidationMessageFor(model => model.No_Usuario) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Tx_Password) %></p>
            </font>
        </b>
    </h4>

    <div class="form-actions">

    <table>
        <tr>
            <td>&nbsp;</td>
            <td><label for="No_Usuario">Usuario</label></td>
            <td><label>:</label></td>
            <td><%: Html.EditorFor(model => model.No_Usuario) %></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="Tx_Password">Password</label></td>
            <td><label>:</label></td>
            <td><%: Html.PasswordFor(model => model.Tx_Password) %></td>
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
            <td><input type="submit" value="Iniciar Sesión" class = "btn"/></td>
            <td>&nbsp;</td>
            <td><%: Html.ActionLink("Cancelar", "Index", "Home", routeValues: null, htmlAttributes: new { @class="btn" }) %></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
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
