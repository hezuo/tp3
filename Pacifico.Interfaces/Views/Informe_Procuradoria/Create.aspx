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


<h2><%: ViewBag.titulo %></h2>
    <h4>
        <b>
            <font color="red">
                <p><%: ViewData["Error"] %></p>
                <p><%: Html.ValidationMessageFor(model => model.Co_Expediente) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Co_NumInfProc) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Fe_Emision) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Fl_TipoResultado) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Tx_Conclusiones) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Fl_Aprobacion) %></p>
            </font>
        </b>
    </h4>
<% using (Html.BeginForm()) { %>
    <%: Html.AntiForgeryToken() %>

    <fieldset>
        
        <div class="editor-label" style=" border: 1px solid; padding: 11px 13px 13px 12px; ">
            <div style="display:inline-block;width:49%;vertical-align:top">
                <div class="editor-label">
                    Nro Informe
                </div>
                <div class="editor-field">
                    <label id="nroinforme">
                        <%: Html.DisplayFor(model => model.Co_NumInfProc) %>
                    </label>


                </div>
            </div>
            <div style="display:inline-block;width:49%;vertical-align:top">
                <div class="editor-label">
                    Fecha Emision
                </div>
                <div class="editor-field">
                    <label id="nroinformefecha">
                        <%: Html.DisplayFor(model => model.Fe_Emision) %>
                    </label>
                </div>
            </div>

        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Co_Expediente, "EXPEDIENTE")%>
        </div>


        <div class="editor-field" style="display:none">
            <%: Html.DropDownList("Co_Expediente", String.Empty)%>
            <%: Html.ValidationMessageFor(model => model.Co_Expediente)%>
        </div>

        <div class="editor-label" style=" border: 1px solid; padding: 11px 13px 13px 12px; ">
            <div style="display:inline-block;width:49%;vertical-align:top">
                Nro. Expediente:
                <%: Html.DisplayFor(model => model.EXPEDIENTE.Co_Expediente)%>
            </div>
            <div style="display:inline-block;width:49%;vertical-align:top">

            </div>


            <div style="display:inline-block;width:49%;vertical-align:top">
                Asegurado:
                <%: Html.DisplayFor(model => model.EXPEDIENTE.ASEGURADO.No_Asegurado)%>
                <%: Html.DisplayFor(model => model.EXPEDIENTE.ASEGURADO.No_ApePaterno)%>
                <%: Html.DisplayFor(model => model.EXPEDIENTE.ASEGURADO.No_ApeMaterno)%>
            </div>
            <div style="display:inline-block;width:49%;vertical-align:top">
                Beneficiario:
                <%: Html.DisplayFor(model => model.EXPEDIENTE.BENEFICIARIO.No_Beneficiario)%>
                <%: Html.DisplayFor(model => model.EXPEDIENTE.BENEFICIARIO.No_ApellidoPaterno)%>
                <%: Html.DisplayFor(model => model.EXPEDIENTE.BENEFICIARIO.No_ApellidoMaterno)%>
            </div>


        </div>
        <a href="#" id="btnexaminarex">Examinar Expediente</a>
        <a href="#" id="btnActualizar">Actualizar Expediente</a>
        
        <hr />
        <div class="editor-label">
            <%: Html.LabelFor(model => model.EXPEDIENTE.POLIZA_VIDA, "POLIZA DE VIDA")%>
        </div>
        <div class="editor-label" style=" border: 1px solid; padding: 11px 13px 13px 12px; ">
            <div style="display:inline-block;width:49%;vertical-align:top">
                Nro poliza:
                <%: Html.DisplayFor(model => model.EXPEDIENTE.POLIZA_VIDA.First().Co_PolizaVida)%>

            </div>
            <div style="display:inline-block;width:49%;vertical-align:top">

            </div>
            <div style="display:inline-block;width:49%;vertical-align:top">
                Prima:
                <%: Html.DisplayFor(model => model.EXPEDIENTE.POLIZA_VIDA.First().Ss_Prima)%>
            </div>
            <div style="display:inline-block;width:49%;vertical-align:top">
                Fecha Renovacion:
                <%: Html.DisplayFor(model => model.EXPEDIENTE.POLIZA_VIDA.First().Fe_Renovacion)%>
            </div>

            <div style="display:inline-block;width:49%;vertical-align:top">
                Fecha Vencimiento:
                <%: Html.DisplayFor(model => model.EXPEDIENTE.POLIZA_VIDA.First().Fe_Vencimiento)%>
            </div>
            <div style="display:inline-block;width:49%;vertical-align:top">
                Inicio Vigencia:
                <%: Html.DisplayFor(model => model.EXPEDIENTE.POLIZA_VIDA.First().Fe_InicioVigencia)%>
            </div>

        </div>





        <div class="editor-field">
            <div style="display:inline-block;width:49%;vertical-align:top">
                <div style="display:inline-block;width:13%;vertical-align:top">
                    Resultado <br />
                    Informe

                </div>
                <div style="display:inline-block;width:85%;vertical-align:top">
                    <label style="color:red;width:2px;display:inline">
                    (*)
                        </label>
                    <%: Html.TextAreaFor(model => model.Fl_TipoResultado)%>
                    <%: Html.ValidationMessageFor(model => model.Fl_TipoResultado)%>
                </div>
            </div>
            <div style="display:inline-block;width:49%;vertical-align:top">
                <div style="display:inline-block;width:15%;vertical-align:top">
                    Conclusion  <br />
                    Informe
                </div>
                <div style="display:inline-block;width:84%;vertical-align:top">
                             <label style="color:red;width:2px;display:inline">
                    (*)
                        </label>
                    <%: Html.TextAreaFor(model => model.Tx_Conclusiones)%>
                    <%: Html.ValidationMessageFor(model => model.Tx_Conclusiones)%>
                </div>
            </div>


        </div>



        <div class="editor-label" style="display:none">
            <%: Html.EditorFor(model => model.Co_NumInfProc)%>
            <%: Html.LabelFor(model => model.Fl_Aprobacion)%>
        </div>
        <div class="editor-field" style="display:none">
            <%: Html.EditorFor(model => model.Fl_Aprobacion)%>
            <%: Html.ValidationMessageFor(model => model.Fl_Aprobacion)%>
        </div>

        <label style="color: red; width: 2px; display: inline">
                    (*) Campos Obligatorios
                </label>

        <p>
            <input type="submit" value='<%: ViewBag.valueboton %>' style='<%: ViewBag.csshide %>' id="btnEnviar"  />
            
        </p>
    </fieldset>
<% } %>

    </form>
    <div>

    <%: Html.ActionLink("Regresar a la Lista", "Index") %>
</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">

    <%:  Styles.Render("~/Content/normalize.css")%>
<%:Styles.Render("~/Content/tabs.css")%>
<%:Styles.Render("~/Content/jsDatePick_ltr.min.css")%>
<%:Styles.Render("~/Content/tabstyles.css")%>

<%:Styles.Render("~/Content/jquery.lightbox.css")%>



<script src="<%: Url.Content("~/Scripts/cbpFWTabs.js")%>" type="text/javascript"></script>
<script src="<%:Url.Content("~/Scripts/modernizr.custom.js")%>" type="text/javascript"></script>
<script src="<%:Url.Content("~/Scripts/jsDatePick.min.1.3.js")%>" type="text/javascript"></script>

       <%: Scripts.Render("~/Scripts/jquery-1.8.1.js")%>
        <%:Scripts.Render("~/Scripts/jquery.lightbox.js") %>

    <script type="text/javascript">

        $(document).ready(function () {
            if ('@ViewBag.csshide' == 'display:none;') {
                $("#Fl_TipoResultado").prop("disabled", true);
                $("#Tx_Conclusiones").prop("disabled", true);
            }
            if ($("#nroinforme").html().trim() == '0') {
                $("#nroinforme").html('Por generar');
            }
            if ($("#nroinforme").html().trim() == 'Por generar') {
                $("#nroinformefecha").html('Por generar');
            }


            $("#btnEnviar").click(function () {

                if ($('#Fl_TipoResultado').val() == '' && $('#Tx_Conclusiones').val() == '') {
                    alert('Falta ingresar resultado y conclusiones');
                    return false;
                }
                if ($('#Fl_TipoResultado').val() == '') {
                    alert('Falta ingresar resultado');
                    return false;
                }
                if ($('#Tx_Conclusiones').val() == '') {
                    alert('Falta ingresar conclusiones');
                    return false;
                }
            });

            $("#btnexaminarex").click(function () {

                $.lightbox("../../Expediente/Details/" + $("#Co_Expediente").val(), {
                    'width': 800,
                    'height': 600,
                    'iframe': true
                });
                return false;
            });
            $("#btnActualizar").click(function () {
                window.location.assign("../../Expediente/Create/" + +$("#Co_Expediente").val());
                return false;
            });

        });

</script>
</asp:Content>