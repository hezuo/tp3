<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Pacifico.DataAccess.EXPEDIENTE>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% if (!Request.IsAuthenticated)
    {
        @Response.Redirect("/Home/Index");   
    }%>
    <%: Styles.Render("~/Content/normalize.css") %>
    <%: Styles.Render("~/Content/tabs.css") %>
    <%: Styles.Render("~/Content/jsDatePick_ltr.min.css") %>
    <%: Styles.Render("~/Content/tabstyles.css") %>
    <script src="<%: Url.Content("~/Scripts/cbpFWTabs.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/modernizr.custom.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jsDatePick.min.1.3.js") %>" type="text/javascript"></script>
<h2>Examinar Expediente</h2>

    <div class="form-actions">
    <table width="100%">
        <tr>
            <td>&nbsp;</td>
            <td><label>Nro Expediente: <%: Html.DisplayFor(model => model.Co_Expediente) %></label></td>
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
            <td><label><strong>Asegurado:</strong></label></td>
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
                DNI:
                <%: Html.DisplayFor(model => model.ASEGURADO.Nu_DocumentoIdentidad) %>,
                <%: Html.DisplayFor(model => model.ASEGURADO.No_Asegurado) %>
                <%: Html.DisplayFor(model => model.ASEGURADO.No_ApePaterno) %>
                <%: Html.DisplayFor(model => model.ASEGURADO.No_ApeMaterno) %>
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
            <td><label><strong>Beneficiario:</strong></label>
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
                DNI:
                <%: Html.DisplayFor(model => model.BENEFICIARIO.Nu_DocIdentidad) %>, 
                <%: Html.DisplayFor(model => model.BENEFICIARIO.No_Beneficiario) %>
                <%: Html.DisplayFor(model => model.BENEFICIARIO.No_ApellidoPaterno) %>
                <%: Html.DisplayFor(model => model.BENEFICIARIO.No_ApellidoMaterno) %>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </div>

<div class="tabs tabs-style-topline">
    <nav>
        <ul>
            <li><a href="#section-topline-1"><label>Poliza</label></a></li>
            <li><a href="#section-topline-2"><label>Protocolo Jurada Domicilio</label></a></li>
            <li><a href="#section-topline-3"><label>Certificado Medico Defuncion</label></a></li>
            <li><a href="#section-topline-4"><label>Historial Clinico</label></a></li>
            

        </ul>
    </nav>
    <div class="content-wrap">
        <section id="section-topline-1">
            <div class="form-actions">
                <table width="100%">
                    <tr>
                        <td>&nbsp;</td>
                        <td><label><strong>Prima:
                        <%: Html.DisplayFor(model => model.POLIZA_VIDA.First().Ss_Prima) %></strong></label></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td><label><strong>Fecha Renovacion:
                        <%: Html.DisplayFor(model => model.POLIZA_VIDA.First().Fe_Renovacion) %></strong></label></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td><label><strong>Fecha Vencimiento:
                        <%: Html.DisplayFor(model => model.POLIZA_VIDA.First().Fe_Vencimiento) %></strong></label></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td><label><strong>Tipo Pago:
                        <%: Html.DisplayFor(model => model.POLIZA_VIDA.First().FORMA_PAGO.No_FormaPago) %></strong></label></td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
        </section>
        <section id="section-topline-2">
            <div class="form-actions">
                <table width="100%">
                    <tr>
                        <td>&nbsp;</td>
                        <td><label><strong>Direccion:
                        <%: Html.DisplayFor(model => model.PROT_JURADA_DOMICILIO.First().Tx_Direccion) %></strong></label></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td><label><strong>Fecha Celebracion:
                        <%: Html.DisplayFor(model => model.PROT_JURADA_DOMICILIO.First().Fe_Celebreacion) %></strong></label></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td><label><strong>Distrito:
                        <%: Html.DisplayFor(model => model.PROT_JURADA_DOMICILIO.First().DISTRITO.No_Distrito) %></strong></label></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td><label><strong>Nro Siniestro:
                        <%: Html.DisplayFor(model => model.PROT_JURADA_DOMICILIO.First().Nu_Siniestro) %></strong></label></td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
        </section>
        <section id="section-topline-3">
            <div class="form-actions">
                <table width="100%">
                    <tr>
                        <td>&nbsp;</td>
                        <td><label><strong>Circunscripcion:
                        <%: Html.DisplayFor(model => model.CERT_MEDICO_DEFUNCION.First().Tx_Circunscripcion) %></strong></label></td>
                        <td>&nbsp;</td>
                    </tr>
                 
                    <tr>
                        <td>&nbsp;</td>
                        <td><label><strong>Lugar Defuncion:
                        <%: Html.DisplayFor(model => model.CERT_MEDICO_DEFUNCION.First().Tx_LugarDefuncion) %></strong></label></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td><label><strong>Causa Muerte:
                        <%: Html.DisplayFor(model => model.CERT_MEDICO_DEFUNCION.First().Tx_CausaMuerte) %></strong></label></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td><label><strong>Fecha Emision:
                        <%: Html.DisplayFor(model => model.CERT_MEDICO_DEFUNCION.First().Fe_Emision) %></strong></label></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td><label><strong>Firmado Por:
                        <%: Html.DisplayFor(model => model.CERT_MEDICO_DEFUNCION.First().Tx_FirmadoPor) %></strong></label></td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
        </section>
        <section id="section-topline-4">
            <div class="form-actions">
                <table width="100%">
                    <tr>
                        <td>&nbsp;</td>
                        <td><label><strong>Hospital:
                    <%:Html.DisplayFor(model => model.HISTORIAL_CLINICO.First().No_Hospital) %></strong></label></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td><label><strong>Doctor:
                    <%: Html.DisplayFor(model => model.HISTORIAL_CLINICO.First().No_ApeDoctor) %></strong></label></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td><label><strong>Fecha Consulta:
                    <%: Html.DisplayFor(model => model.HISTORIAL_CLINICO.First().Fe_Consulta) %></strong></label></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td><label><strong>Resultado Examenes:
                    <%: Html.DisplayFor(model => model.HISTORIAL_CLINICO.First().Tx_ResultadoExamenes) %></strong></label></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td><label><strong>Diagnostico:
                    <%: Html.DisplayFor(model => model.HISTORIAL_CLINICO.First().Tx_Diagnostico) %></strong></label></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td><label><strong>Tratamiento:
                    <%: Html.DisplayFor(model => model.HISTORIAL_CLINICO.First().Tx_Tratamiento) %></strong></label></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td><label><strong>Nro. Siniestro:
                    <%: Html.DisplayFor(model => model.CERT_MEDICO_DEFUNCION.First().Nu_Siniestro) %></strong></label></td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
        </section>
        
    </div><!-- /content -->
</div><!-- /tabs -->
<%--<div>
    <%: Html.ActionLink("Atras", "Index", "Expediente", routeValues: null, htmlAttributes: new {@class="btn"})%>
</div>--%>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <script type="text/javascript">
        $(function () {
            [].slice.call(document.querySelectorAll('.tabs')).forEach(function (el) {
                new CBPFWTabs(el);
            });
        });
    </script>
</asp:Content>