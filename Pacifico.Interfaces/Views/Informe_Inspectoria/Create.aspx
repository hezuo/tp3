<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Pacifico.DataAccess.INFORME_INSPECTORIA>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: ViewBag.titulo %></h2>
    <form id="form1" runat="server">
        <% using (Html.BeginForm())
           { %>
        <%: Html.AntiForgeryToken() %>
        <fieldset>

            <div class="editor-label" style="border: 1px solid; padding: 11px 13px 13px 12px;">
                <div style="display: inline-block; width: 49%; vertical-align: top">
                    <div class="editor-label">
                        Nro Informe
                    </div>
                    <div class="editor-field">
                        <label id="nroinforme">
                            <%: Html.DisplayFor(model => model.Co_NumInfInspect) %>
                        </label>
                    </div>
                </div>
                <div style="display: inline-block; width: 49%; vertical-align: top">
                    <div class="editor-label">
                        Fecha Emision
                    </div>
                    <div class="editor-field">
                        <label id="nroinformefecha">
                            <%: Html.DisplayFor(model => model.Fe_Emision)%>
                        </label>
                    </div>
                </div>


            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.Co_Expediente, "EXPEDIENTE")%>
            </div>



            <div class="editor-field" style="display: none">
                <%: Html.DropDownList("Co_Expediente", String.Empty)%>
                <%: Html.ValidationMessageFor(model => model.Co_Expediente)%>
            </div>

            <div class="editor-label" style="border: 1px solid; padding: 11px 13px 13px 12px;">
                <div style="display: inline-block; width: 49%; vertical-align: top">
                    Nro. Expediente:
                <%: Html.DisplayFor(model => model.EXPEDIENTE.Co_Expediente)%>
                </div>
                <div style="display: inline-block; width: 49%; vertical-align: top">
                </div>


                <div style="display: inline-block; width: 49%; vertical-align: top">
                    Asegurado:
                <%: Html.DisplayFor(model => model.EXPEDIENTE.ASEGURADO.No_Asegurado)%>
                    <%: Html.DisplayFor(model => model.EXPEDIENTE.ASEGURADO.No_ApePaterno)%>
                    <%: Html.DisplayFor(model => model.EXPEDIENTE.ASEGURADO.No_ApeMaterno)%>
                </div>
                <div style="display: inline-block; width: 49%; vertical-align: top">
                    Beneficiario:
                <%: Html.DisplayFor(model => model.EXPEDIENTE.BENEFICIARIO.No_Beneficiario)%>
                    <%: Html.DisplayFor(model => model.EXPEDIENTE.BENEFICIARIO.No_ApellidoPaterno)%>
                    <%: Html.DisplayFor(model => model.EXPEDIENTE.BENEFICIARIO.No_ApellidoMaterno)%>
                </div>


            </div>

            <a href="#" id="btnexaminarex">Examinar Expediente</a>
            <hr />
            <div class="editor-label">
                <%: Html.LabelFor(model => model.EXPEDIENTE.POLIZA_VIDA, "POLIZA DE VIDA")%>
            </div>
            <div class="editor-label" style="border: 1px solid; padding: 11px 13px 13px 12px;">
                <div style="display: inline-block; width: 49%; vertical-align: top">
                    Nro poliza:
                <%: Html.DisplayFor(model => model.EXPEDIENTE.POLIZA_VIDA.First().Co_PolizaVida)%>
                </div>
                <div style="display: inline-block; width: 49%; vertical-align: top">
                </div>
                <div style="display: inline-block; width: 49%; vertical-align: top">
                    Prima:
                <%: Html.DisplayFor(model => model.EXPEDIENTE.POLIZA_VIDA.First().Ss_Prima)%>
                </div>
                <div style="display: inline-block; width: 49%; vertical-align: top">
                    Fecha Renovacion:
                <%: Html.DisplayFor(model => model.EXPEDIENTE.POLIZA_VIDA.First().Fe_Renovacion)%>
                </div>

                <div style="display: inline-block; width: 49%; vertical-align: top">
                    Fecha Vencimiento:
                <%: Html.DisplayFor(model => model.EXPEDIENTE.POLIZA_VIDA.First().Fe_Vencimiento)%>
                </div>
                <div style="display: inline-block; width: 49%; vertical-align: top">
                    Inicio Vigencia:
                <%: Html.DisplayFor(model => model.EXPEDIENTE.POLIZA_VIDA.First().Fe_InicioVigencia)%>
                </div>

            </div>



            <div class="editor-label" style="display: none">
                <%: Html.LabelFor(model => model.Co_NumInfInspect)%>

                <%: Html.EditorFor(model => model.Fe_Emision)%>
                <%: Html.ValidationMessageFor(model => model.Fe_Emision)%>
            </div>
            <div class="editor-field" style="display: none">
                <%: Html.EditorFor(model => model.Co_NumInfInspect)%>
                <%: Html.ValidationMessageFor(model => model.Co_NumInfInspect)%>
            </div>

            <div class="editor-label">
                Indicio Dolo  <label style="color: red; width: 2px; display: inline">
                    (*)
                </label>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("Fl_IndiciosDolo")%>
            </div>

            <div class="editor-label">
                Conclusiones           
                <label style="color: red; width: 2px; display: inline">
                    (*)
                </label>
            </div>
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.Tx_Conclusiones)%>
                <%: Html.ValidationMessageFor(model => model.Tx_Conclusiones)%>
            </div>

            <div class="editor-label" style="display: none">
                Documentos de Análisis
            </div>
            <div class="editor-field" style="display: none">
                <%: Html.EditorFor(model => model.Fl_DocAnali)%>
                <%: Html.ValidationMessageFor(model => model.Fl_DocAnali)%>
            </div>

            <div class="editor-label" style="display: none">
                Documentos Observados
            </div>
            <div class="editor-field" style="display: none">
                <%: Html.EditorFor(model => model.Tx_DocsObs)%>
                <%: Html.ValidationMessageFor(model => model.Tx_DocsObs)%>
            </div>



            <div class="editor-label">
                Resultados           
                <label style="color: red; width: 2px; display: inline">
                    (*)
                </label>
            </div>
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.Tx_Resultados)%>
                <%: Html.ValidationMessageFor(model => model.Tx_Resultados)%>
            </div>
                      <label style="color: red; width: 2px; display: inline">
                    (*) Campos Obligatorios
                </label>


            <p>
                <input type="submit" value='<%: ViewBag.valueboton %>' style='<%: ViewBag.csshide%>' id="btnEnviar" />
            </p>
        </fieldset>
        <% } %>

        <div>
            <%: Html.ActionLink("Regresar a la Lista", "Index")%>
        </div>

    </form>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%:  Styles.Render("~/Content/normalize.css")%>
    <%:Styles.Render("~/Content/tabs.css") %>
    <%:Styles.Render("~/Content/jsDatePick_ltr.min.css")%>
    <%:Styles.Render("~/Content/tabstyles.css")%>
    <%:Styles.Render("~/Content/jquery.lightbox.css")%>
    <script src="<%:Url.Content("~/Scripts/cbpFWTabs.js")%>" type="text/javascript"></script>
    <script src="<%:Url.Content("~/Scripts/modernizr.custom.js")%>" type="text/javascript"></script>
    <script src="<%:Url.Content("~/Scripts/jsDatePick.min.1.3.js")%>" type="text/javascript"></script>


    <%: Scripts.Render("~/Scripts/jquery-1.8.1.js")%>
    <%:Scripts.Render("~/Scripts/jquery.lightbox.js") %>

    <script type="text/javascript">

        $(document).ready(function () {


            function InsertarActualizarEx() {
                //Obtener valores del div que esta en _EditProducto.cshtml
                var idexpediente = $("#idexpediente").val();
                var idexpediente = $("#idexpediente").val();
                var idexpediente = $("#idexpediente").val();




                var jsonData = "";

                if (idexpediente != "" && idexpediente != null) {
                    //Construir el json
                    jsonData = { "IdExpediente": idexpediente, "CodigoCliente": "test", "NombresCliente": "test", "ApellidosCliente": "test", "CodigoBeneficiario": "test", "NombresBeneficiario": "test", "ApellidosBeneficiario": "test" };
                    //Llamar a producto.insertProducto pasandole el json
                    expediente.updateExpediente(jsonData);
                } else {
                    //Construir el json
                    jsonData = { "CodigoCliente": "test", "NombresCliente": "test", "ApellidosCliente": "test", "CodigoBeneficiario": "test", "NombresBeneficiario": "test", "ApellidosBeneficiario": "test" };
                    //jsonData = { "circunscripcion": "k", "anio": "k", "lugar_De_Defuncion": "k", "causa_De_Muerte": "k", "fecha_De_Emision": "k", "firmado_por": "k", "ubigeo": "k", "num_siniestro": "k" }
                    //jsonData = { "circunscripcion": Circunscripcion};
                    //Llamar a producto.insertProducto pasandole el json
                    console.log(jsonData);
                    expediente.insertExpediente(jsonData);
                }
            };





            if ($("#btnEnviar").attr("style") == 'display:none;') {
                $("#Tx_DetalleDolo").prop("disabled", true);
                $("#Tx_Conclusiones").prop("disabled", true);
                $("#Tx_Resultados").prop("disabled", true);
                $("#Fl_IndiciosDolo").prop("disabled", true);


            }
            if ($("#nroinforme").html().trim() == '0') {
                $("#nroinforme").html('Por generar');
            }
            if ($("#nroinforme").html().trim() == 'Por generar') {
                $("#nroinformefecha").html('Por generar');
            }
            $("#Fl_Indicios_Dolo").val('false');
            $("#Fl_Doc_Anali").val('false');



            $("#btnEnviar").click(function () {


                var mensaje = "";

                if ($('#Fl_IndiciosDolo').val() == '') {
                    mensaje = mensaje + "Falta Ingresar Indicio Dolo \n"
                }

                if ($('#Tx_Resultados').val() == '') {
                    mensaje = mensaje + "Falta Ingresar Resultados \n"
                }
                if ($('#Tx_Conclusiones').val() == '') {
                    mensaje = mensaje + "Falta Ingresar Conclusiones \n"
                }

                if (mensaje.length > 0) {
                    alert(mensaje);
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
        });

    </script>
</asp:Content>