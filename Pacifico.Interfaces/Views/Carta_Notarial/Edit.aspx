<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Pacifico.DataAccess.CARTA_NOTARIAL>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Edit</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>CARTA_NOTARIAL</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Co_NumCartaNotarial) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Co_NumCartaNotarial) %>
            <%: Html.ValidationMessageFor(model => model.Co_NumCartaNotarial) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Tx_Descripción) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Tx_Descripción) %>
            <%: Html.ValidationMessageFor(model => model.Tx_Descripción) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Fe_Creación) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Fe_Creación) %>
            <%: Html.ValidationMessageFor(model => model.Fe_Creación) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Fe_Emision) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Fe_Emision) %>
            <%: Html.ValidationMessageFor(model => model.Fe_Emision) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Fe_Recepcion) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Fe_Recepcion) %>
            <%: Html.ValidationMessageFor(model => model.Fe_Recepcion) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Co_NumInfProc, "INFORME_PROCURADORIA") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("Co_NumInfProc", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.Co_NumInfProc) %>
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