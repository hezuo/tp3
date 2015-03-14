<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Pacifico.DataAccess.INFORME_PROCURADORIA>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
    <% if (!Request.IsAuthenticated)
    {
        @Response.Redirect("/Home/Index");   
    }%>

    <%: Styles.Render("~/Content/normalize.css") %>
    <%: Styles.Render("~/Content/tabs.css") %>
    <%: Styles.Render("~/Content/jsDatePick_ltr.min.css") %>
    <%: Styles.Render("~/Content/tabstyles.css") %>
    <%: Styles.Render("~/Content/jquery.lightbox.css") %>
    <script src="<%: Url.Content("~/Scripts/cbpFWTabs.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/modernizr.custom.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jsDatePick.min.1.3.js") %>" type="text/javascript"></script>
	<script type="text/javascript">
	     $(document).ready(function () {
	         $('.lightbox').lightbox();
	     });
    </script>

<h2>Informe Procuradoria</h2>
    <h4>
        <b>
            <font color="red">
                <p><%: ViewData["Error"] %></p>
                <p><%: Html.ValidationMessageFor(model => model.Co_Expediente) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Co_NumInfProc) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Fe_Emision) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Tx_TipoResultado) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Tx_Conclusiones) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Fl_Aprobacion) %></p>
            </font>
        </b>
    </h4>
<% using (Html.BeginForm()) { %>
    <%: Html.AntiForgeryToken() %>

    <div class="form-actions">
    <table width="100%">
        <tr>
            <td>&nbsp;</td>
            <td><label><strong>EXPEDIENTE</strong></label></td>
            <td>&nbsp;</td>
            <td style="display:none"><%: Html.DropDownList("Co_Expediente", String.Empty)%></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                Nro. Expediente:
                <%: Html.DisplayFor(model => model.EXPEDIENTE.Co_Expediente) %>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
               <%--<a href="../../Expediente/Details/1?lightbox[iframe]=true&lightbox[width]=800&lightbox[height]=600" class="lightbox" id="btnexaminarex">Open Google</a>--%>
                <a href="#" id="btnexaminarex">Examinar Expediente</a>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>Asegurado:
                <%: Html.DisplayFor(model => model.EXPEDIENTE.ASEGURADO.No_Asegurado) %>
                <%: Html.DisplayFor(model => model.EXPEDIENTE.ASEGURADO.No_ApePaterno) %>
                <%: Html.DisplayFor(model => model.EXPEDIENTE.ASEGURADO.No_ApeMaterno) %>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>Beneficiario:
                <%: Html.DisplayFor(model => model.EXPEDIENTE.BENEFICIARIO.No_Beneficiario) %>
                <%: Html.DisplayFor(model => model.EXPEDIENTE.BENEFICIARIO.No_ApePaterno) %>
                <%: Html.DisplayFor(model => model.EXPEDIENTE.BENEFICIARIO.No_ApeMaterno) %>
            </td>
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
            <td><label><strong>POLIZA DE VIDA</strong></label></td>
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
            <td>
                Nro Poliza:
                <%: Html.DisplayFor(model => model.EXPEDIENTE.POLIZA_VIDA.First().Co_PolizaVida) %>
            </td>
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
            <td>Prima:
                <%: Html.DisplayFor(model => model.EXPEDIENTE.POLIZA_VIDA.First().Ss_Prima) %>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>Fecha de Renovacion:
                <%: Html.DisplayFor(model => model.EXPEDIENTE.POLIZA_VIDA.First().Fe_Renovacion) %>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>Fecha Vencimiento:
                <%: Html.DisplayFor(model => model.EXPEDIENTE.POLIZA_VIDA.First().Fe_Vencimiento) %>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>Inicio Vigencia:
                <%: Html.DisplayFor(model => model.EXPEDIENTE.POLIZA_VIDA.First().Fe_InicioVigencia) %>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <table width="100%">
        <tr>
            <td>&nbsp;</td>
            <td style="display:none"><%: Html.LabelFor(model => model.Co_NumInfProc) %></td>
            <td>&nbsp;</td>
            <td style="display:none"><%: Html.EditorFor(model => model.Co_NumInfProc)%></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label>Fecha Emision</label></td>
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
            <td><label>Resultado Informe</label></td>
            <td><label>:</label></td>
            <td><%: Html.TextAreaFor(model => model.Tx_TipoResultado) %></td>
            <td>&nbsp;</td>
            <td><label>Conclusion Informe</label></td>
            <td><label>:</label></td>
            <td><%: Html.TextAreaFor(model => model.Tx_Conclusiones) %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td style="display:none"><%: Html.LabelFor(model => model.Fl_Aprobacion) %></td>
            <td>&nbsp;</td>
            <td style="display:none"><%: Html.EditorFor(model => model.Fl_Aprobacion) %></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td colspan="7" align="center">
		        <input type="submit" value="Crear Informe" class = "btn"/>
                &nbsp;
                <%: Html.ActionLink("Cancelar", "Index", "Expediente", routeValues: null, htmlAttributes: new {@class="btn", onclick = "return confirm('¿Desea salir de Registrar Informe Procuradoria?')" })%>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </div>
<% } %>

    </form>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <script src="<%: Url.Content("~/Scripts/jquery-1.8.1.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.lightbox.js") %>" type="text/javascript"></script>

    <script type="text/javascript">
        $("#btnexaminarex").click(function () {
            $.lightbox("../../Expediente/Details/" + $("#Co_Expediente").val(), {
                'width': 800,
                'height': 600,
                'iframe': true
            });
            return false;
        });

        window.onload = function () {
            new JsDatePick({
                useMode: 2,
                target: "Fe_Emision",
                dateFormat: "%d/%m/%Y"
                /*selectedDate:{				This is an example of what the full configuration offers.
                    day:5,						For full documentation about these settings please see the full version of the code.
                    month:9,
                    year:2006
                },
                yearsRange:[1978,2020],
                limitToToday:false,
                cellColorScheme:"beige",
                dateFormat:"%m-%d-%Y",
                imgPath:"img/",
                weekStartDay:1*/
            });


        };
</script>
</asp:Content>