<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<Pacifico.DataAccess.INFORME_JUNTA_MEDICA>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>INFORME_JUNTA_MEDICA</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Co_NumInfJuntaMedica) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Co_NumInfJuntaMedica) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Fl_IndiciosDolo) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Fl_IndiciosDolo) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Tx_DetalleDolo) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Tx_DetalleDolo) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Tx_TipoResultado) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Tx_TipoResultado) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Tx_Conclusiones) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Tx_Conclusiones) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Fe_Emision) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Fe_Emision) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Fl_Aprobacion) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Fl_Aprobacion) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.EXPEDIENTE.Co_Expediente) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.EXPEDIENTE.Co_Expediente) %>
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