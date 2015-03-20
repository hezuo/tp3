<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<Pacifico.DataAccess.INFORME_JUNTA_MEDICA>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Edit</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>INFORME_JUNTA_MEDICA</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Co_NumInfJuntaMedica) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Co_NumInfJuntaMedica) %>
            <%: Html.ValidationMessageFor(model => model.Co_NumInfJuntaMedica) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Fl_IndiciosDolo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Fl_IndiciosDolo) %>
            <%: Html.ValidationMessageFor(model => model.Fl_IndiciosDolo) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Tx_DetalleDolo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Tx_DetalleDolo) %>
            <%: Html.ValidationMessageFor(model => model.Tx_DetalleDolo) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Tx_TipoResultado) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Tx_TipoResultado) %>
            <%: Html.ValidationMessageFor(model => model.Tx_TipoResultado) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Tx_Conclusiones) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Tx_Conclusiones) %>
            <%: Html.ValidationMessageFor(model => model.Tx_Conclusiones) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Fe_Emision) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Fe_Emision) %>
            <%: Html.ValidationMessageFor(model => model.Fe_Emision) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Fl_Aprobacion) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Fl_Aprobacion) %>
            <%: Html.ValidationMessageFor(model => model.Fl_Aprobacion) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Co_Expediente, "EXPEDIENTE") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("Co_Expediente", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.Co_Expediente) %>
        </div>

        <p>
            <input type="submit" value="Save" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>