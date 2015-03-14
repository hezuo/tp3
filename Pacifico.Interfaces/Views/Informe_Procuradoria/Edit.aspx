<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Pacifico.DataAccess.INFORME_PROCURADORIA>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% if (!Request.IsAuthenticated)
    {
        @Response.Redirect("/Home/Index");   
    }%>
<h2>Editar Informe Procuradoria</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(true) %>

    <h4>
        <b>
            <font color="red">
                <p><%: ViewData["Error"] %></p>
                <p><%: Html.ValidationMessageFor(model => model.Co_NumInfProc) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Tx_TipoResultado) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Tx_Conclusiones) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Fe_Emision) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Fl_Aprobacion) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Co_Expediente) %></p>
            </font>
        </b>
    </h4>

    <div class="form-actions">

    <table width="100%">
        <tr>
            <td>&nbsp;</td>
            <td><%: Html.LabelFor(model => model.Co_NumInfProc) %></td>
            <td><label>:</label></td>
            <td><%: Html.EditorFor(model => model.Co_NumInfProc) %></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><%: Html.LabelFor(model => model.Tx_TipoResultado) %></td>
            <td><label>:</label></td>
            <td><%: Html.EditorFor(model => model.Tx_TipoResultado) %></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><%: Html.LabelFor(model => model.Tx_Conclusiones) %></td>
            <td><label>:</label></td>
            <td><%: Html.EditorFor(model => model.Tx_Conclusiones) %></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><%: Html.LabelFor(model => model.Fe_Emision) %></td>
            <td><label>:</label></td>
            <td><%: Html.EditorFor(model => model.Fe_Emision) %></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><%: Html.LabelFor(model => model.Fl_Aprobacion) %></td>
            <td><label>:</label></td>
            <td><%: Html.EditorFor(model => model.Fl_Aprobacion) %></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><%: Html.LabelFor(model => model.Co_Expediente, "EXPEDIENTE") %></td>
            <td><label>:</label></td>
            <td><%: Html.DropDownList("Co_Expediente", String.Empty) %></td>
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
                <%: Html.ActionLink("Cancelar", "Index", "Informe_Procuradoria", routeValues: null, htmlAttributes: new {@class="btn", onclick = "return confirm('¿Desea salir de Modificar Informe Procuradoria?')" })%>
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