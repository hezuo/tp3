<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Pacifico.DataAccess.INFORME_PROCURADORIA>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% if (!Request.IsAuthenticated)
    {
        @Response.Redirect("/Home/Index");   
    }%>
<h2>Borrar Informe Procuradoria</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.AntiForgeryToken() %>

    <div class="form-actions">

    <table width="100%">
        <tr>
            <td>&nbsp;</td>
            <td><%: Html.DisplayNameFor(model => model.Co_NumInfProc) %></td>
            <td><label>:</label></td>
            <td><%: Html.DisplayFor(model => model.Co_NumInfProc) %></td>
            <td>&nbsp;</td>
            <td><%: Html.DisplayNameFor(model => model.Tx_TipoResultado) %></td>
            <td><label>:</label></td>
            <td><%: Html.DisplayFor(model => model.Tx_TipoResultado) %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><%: Html.DisplayNameFor(model => model.Tx_Conclusiones) %></td>
            <td><label>:</label></td>
            <td><%: Html.DisplayFor(model => model.Tx_Conclusiones) %></td>
            <td>&nbsp;</td>
            <td><%: Html.DisplayNameFor(model => model.Fe_Emision) %></td>
            <td><label>:</label></td>
            <td><%: Html.DisplayFor(model => model.Fe_Emision) %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><%: Html.DisplayNameFor(model => model.Fl_Aprobacion) %></td>
            <td><label>:</label></td>
            <td><%: Html.DisplayFor(model => model.Fl_Aprobacion) %></td>
            <td>&nbsp;</td>
            <td><%: Html.DisplayNameFor(model => model.EXPEDIENTE.BENEFICIARIO.No_Beneficiario) %></td>
            <td><label>:</label></td>
            <td><%: Html.DisplayFor(model => model.EXPEDIENTE.BENEFICIARIO.No_Beneficiario) %></td>
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
                <%: Html.ActionLink("Cancelar", "Index", "Informe_Procuradoria", routeValues: null, htmlAttributes: new {@class="btn"})%>
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