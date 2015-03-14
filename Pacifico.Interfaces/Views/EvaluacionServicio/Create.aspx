<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Pacifico.DataAccess.SERVICIO_SEDE>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Registrar - Servicios
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% if (!Request.IsAuthenticated)
    {
        @Response.Redirect("/Home/Index");   
    }%>
<h2>Registrar Servicio</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(true) %>

    <h4>
        <b>
            <font color="red">
                <p><%: ViewData["Error"] %></p>
                <p><%: Html.ValidationMessageFor(model => model.Tx_Estado) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Tx_Observacion) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Co_Servicio) %></p>
            </font>
        </b>
    </h4>

    <div class="form-actions">
    <table width="100%">
        <tr>
            <td>&nbsp;</td>
            <td><label>Servicio<font color="red">&nbsp;*&nbsp;</font></label></td>
            <td><label>:</label></td>
            <td><%:Html.DropDownList("dsServicioList", (SelectList)ViewData["dsServicio"], "---------Seleccione---------")%></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label>Estado<font color="red">&nbsp;*&nbsp;</font></label></td>
            <td><label>:</label></td>
            <td><select name="Tx_Estado" id="Tx_Estado">
                <option value="Acreditado">Acreditado</option>
                <option value="Desacreditado">Desacreditado</option>
                </select>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="Tx_Observacion">Observacion de Evaluacion<font color="red">&nbsp;*&nbsp;</font></label></td>
            <td><label>:</label></td>
            <td><%: Html.TextAreaFor(model => model.Tx_Observacion) %></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><%: Html.Hidden("co_Solicitud", ViewData["co_Solicitud"]) %></td>
            <td>&nbsp;</td>
            <td><%: Html.Hidden("co_Prestadora", ViewData["co_Prestadora"]) %></td>
            <td>&nbsp;</td>
            <td><%: Html.Hidden("co_Sede",  ViewData["co_Sede"]) %></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <table width="100%">
        <tr>
            <td><label><font color="red" size=2>* Campos Obligatorios</font></label></td>
            <td>
		        <input type="submit" value="Grabar Datos" class = "btn"/>
                &nbsp;
                <%: Html.ActionLink("Cancelar", "Index", "EvaluacionServicio",  new { codigoSolicitud = ViewData["co_Solicitud"], codigoPrestadora = ViewData["co_Prestadora"] , codigoSede = ViewData["co_Sede"]}, htmlAttributes: new {@class="btn", onclick = "return confirm('¿Desea salir de Registrar Servicio?')" })%>
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