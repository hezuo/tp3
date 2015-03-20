<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Pacifico.DataAccess.EVALUACION_PRESTADORA>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Registrar - Criterios
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% if (!Request.IsAuthenticated)
    {
        @Response.Redirect("/Home/Index");   
    }%>
<h2>Registrar Criterio</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(true) %>

    <h4>
        <b>
            <font color="red">
                <p><%: ViewData["Error"] %></p>
                <p><%: Html.ValidationMessageFor(model => model.Co_Criterio) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Nu_Puntaje) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Tx_Observacion) %></p>
            </font>
        </b>
    </h4>

    <div class="form-actions">
    <table width="100%">
        <tr>
            <td>&nbsp;</td>
            <td><label>Criterio<font color="red">&nbsp;*&nbsp;</font></label></td>
            <td><label>:</label></td>
            <td><%:Html.DropDownList("dsCriterioList", (SelectList)ViewData["dsCriterio"], "---------Seleccione---------")%></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="Po_Peso">Peso</label></td>
            <td><label>:</label></td>
            <td><%: Html.TextBox("Po_Peso", "", new { @disabled = "disabled" } )%></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="Nu_Puntaje">Puntaje<font color="red">&nbsp;*&nbsp;</font></label></td>
            <td><label>:</label></td>
            <td><%: Html.EditorFor(model => model.Nu_Puntaje) %></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label for="Tx_Observacion">Observacion de Criterio<font color="red">&nbsp;*&nbsp;</font></label></td>
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
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td><%: Html.Hidden("co_Prestadora", ViewData["co_Prestadora"]) %></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
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
                <%: Html.ActionLink("Cancelar", "Index", "EvaluacionPrestadora", new { codigoPrestadora = ViewData["co_Prestadora"] }, htmlAttributes: new { @class = "btn", onclick = "return confirm('¿Desea salir de Registrar Criterio?')" })%>
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
    <%: Scripts.Render("~/bundles/jqueryval") %>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#dsCriterioList").change(function () {
                mostrarPeso($("#dsCriterioList").val());
            });
        });
    </script>
    <script type="text/javascript">
        function mostrarPeso(value) {
            var selectedValue = value;
            $.ajax({
                url: '<%:Url.Action("GetPeso", "EvaluacionPrestadora")%>',
                type: 'POST',
                data: { "selectedValue": selectedValue },
                dataType: 'json',
                success: function (response) {
                    var items = "";
                    $.each(response.pesoList, function (i, item) {
                        items += item;
                    });
                    $("#Po_Peso").val(items+=" %");
                },
                error: function (error) {
                    aler("error");
                }
            });
        }
    </script>
</asp:Content>