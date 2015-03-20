<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Pacifico.DataAccess.CARTA_NOTARIAL>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>CARTA_NOTARIAL</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Co_NumCartaNotarial) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Co_NumCartaNotarial) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Tx_Descripción) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Tx_Descripción) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Fe_Creación) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Fe_Creación) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Fe_Emision) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Fe_Emision) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Fe_Recepcion) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Fe_Recepcion) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.INFORME_PROCURADORIA.Fl_TipoResultado) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.INFORME_PROCURADORIA.Fl_TipoResultado) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <%: Html.AntiForgeryToken() %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>