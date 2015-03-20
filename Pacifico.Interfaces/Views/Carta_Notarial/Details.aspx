<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Pacifico.DataAccess.CARTA_NOTARIAL>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

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
<p>
    <%: Html.ActionLink("Edit", "Edit", new { /* id=Model.PrimaryKey */ }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>