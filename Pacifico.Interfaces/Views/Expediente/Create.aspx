<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Pacifico.DataAccess.EXPEDIENTE>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% if (!Request.IsAuthenticated)
       {
           @Response.Redirect("/Home/Index");
       }%>
    <h2><%: ViewBag.titulo %></h2>

    <% using (Html.BeginForm())
       { %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>


        <div class="editor-label" style="display: none">
            <%: Html.LabelFor(model => model.Co_Expediente) %>
        </div>
        <div class="editor-field" style="display: none">
            <%:Html.EditorFor(model => model.Co_Expediente) %>
            <%: Html.ValidationMessageFor(model => model.Co_Expediente) %>
        </div>

        <div class="editor-label">
            <%:Html.LabelFor(model => model.Co_Asegurado, "ASEGURADO", new { @style= "display:inline-block" }) %>
            <label style="color: red; width: 2px; display: inline">
                (*)
            </label>
        </div>
        <div class="editor-field">

            <%:Html.DropDownList("Co_Asegurado", String.Empty) %>
            <%:Html.ValidationMessageFor(model => model.Co_Asegurado) %>
        </div>

        <div class="editor-label">
            <%:Html.LabelFor(model => model.Co_Beneficiario, "BENEFICIARIO",new { @style= "display:inline-block" }) %>
            <label style="color: red; width: 2px; display: inline">
                (*)
            </label>
        </div>
        <div class="editor-field">

            <%:Html.DropDownList("Co_Beneficiario", String.Empty) %>
            <%:Html.ValidationMessageFor(model => model.Co_Beneficiario) %>
        </div>









        <div class="tabs tabs-style-topline">
            <nav>
                <ul>
                    <li><a href="#section-topline-1"><span>Poliza</span></a></li>
                    <li><a href="#section-topline-2"><span>Protocolo Jurada Domicilio</span></a></li>
                    <li><a href="#section-topline-3"><span>Certificado Médico de Defunción</span></a></li>
                    <li><a href="#section-topline-4"><span>Historial Clinico</span></a></li>


                </ul>
            </nav>
            <div class="content-wrap">
                <section id="section-topline-1">
                    <div style="color: black">
                        <fieldset>

                            <div class="editor-field" style="display: none">
                                <%:Html.EditorFor(model => model.POLIZA_VIDA.First().Co_PolizaVida) %>
                            </div>

                            Prima:<label style="color: red; width: 2px; display: inline">
                                (*)
                            </label>
                            <%: Html.EditorFor(model => model.POLIZA_VIDA.First().Ss_Prima) %><br />

                            Fecha Vigencia:<label style="color: red; width: 2px; display: inline">
                                (*)
                            </label>
                            <%: Html.EditorFor(model => model.POLIZA_VIDA.First().Fe_InicioVigencia) %><br />


                            Fecha Renovacion:<label style="color: red; width: 2px; display: inline">
                                (*)
                            </label>
                            <%:Html.EditorFor(model => model.POLIZA_VIDA.First().Fe_Renovacion) %><br />

                            Fecha Vencimiento:<label style="color: red; width: 2px; display: inline">
                                (*)
                            </label>
                            <%: Html.EditorFor(model => model.POLIZA_VIDA.First().Fe_Vencimiento) %>
                            <br />

                            Tipo Pago:<label style="color: red; width: 2px; display: inline">
                                (*)
                            </label>
                            <%: Html.DropDownList("Co_FormaPago", String.Empty) %>
                        </fieldset>


                    </div>
                </section>
                <section id="section-topline-2">
                    <div style="color: black">

                        <fieldset>


                            <div class="editor-field" style="display: none">
                                <%:Html.EditorFor(model => model.PROT_JURADA_DOMICILIO.First().Co_Protocolo) %>
                            </div>


                            Direccion:<label style="color: red; width: 2px; display: inline">
                                (*)
                            </label>
                            <%: Html.EditorFor(model => model.PROT_JURADA_DOMICILIO.First().Tx_Direccion)%><br />

                            Fecha Celebracion:<label style="color: red; width: 2px; display: inline">
                                (*)
                            </label>
                            <%:Html.EditorFor(model => model.PROT_JURADA_DOMICILIO.First().Fe_Celebreacion)%><br />

                            Distrito:<label style="color: red; width: 2px; display: inline">
                                (*)
                            </label>
                            <%: Html.DropDownList("Co_Distrito", String.Empty)%>
                        </fieldset>
                    </div>
                </section>
                <section id="section-topline-3">
                    <div style="color: black">

                        <fieldset>

                            <div class="editor-field" style="display: none">
                                <%:Html.EditorFor(model => model.CERT_MEDICO_DEFUNCION.First().Co_Folio) %>
                            </div>

                            Circunscripcion:<label style="color: red; width: 2px; display: inline">
                                (*)
                            </label>
                            <%: Html.EditorFor(model => model.CERT_MEDICO_DEFUNCION.First().Tx_Circunscripcion) %><br />

                            
                            Lugar Defuncion:<label style="color: red; width: 2px; display: inline">
                                (*)
                            </label>
                            <%:Html.EditorFor(model => model.CERT_MEDICO_DEFUNCION.First().Tx_LugarDefuncion)%><br />

                            Causa Muerte:<label style="color: red; width: 2px; display: inline">
                                (*)
                            </label>
                            <%:Html.EditorFor(model => model.CERT_MEDICO_DEFUNCION.First().Tx_CausaMuerte)%><br />

                            Fecha Emision:<label style="color: red; width: 2px; display: inline">
                                (*)
                            </label>
                            <%: Html.EditorFor(model => model.CERT_MEDICO_DEFUNCION.First().Fe_Emision)%><br />

                            Firmado Por:<label style="color: red; width: 2px; display: inline">
                                (*)
                            </label>
                            <%:Html.EditorFor(model => model.CERT_MEDICO_DEFUNCION.First().Tx_FirmadoPor) %><br />




                        </fieldset>

                    </div>

                </section>
                <section id="section-topline-4">

                    <div style="color: black">


                        <fieldset>

                            <div class="editor-field" style="display: none">
                                <%:Html.EditorFor(model => model.HISTORIAL_CLINICO.First().Co_HistorialCli) %>
                            </div>

                            Hospital:<label style="color: red; width: 2px; display: inline">
                                (*)
                            </label>
                            <%: Html.EditorFor(model => model.HISTORIAL_CLINICO.First().No_Hospital)%><br />

                            Doctor:<label style="color: red; width: 2px; display: inline">
                                (*)
                            </label>
                            <%: Html.EditorFor(model => model.HISTORIAL_CLINICO.First().No_ApeDoctor)%><br />

                            Fecha Consulta:<label style="color: red; width: 2px; display: inline">
                                (*)
                            </label>
                            <%: Html.EditorFor(model => model.HISTORIAL_CLINICO.First().Fe_Consulta)%><br />

                            Resultado Examenes:<label style="color: red; width: 2px; display: inline">
                                (*)
                            </label>
                            <%: Html.EditorFor(model => model.HISTORIAL_CLINICO.First().Tx_ResultadoExamenes)%><br />

                            Diagnostico:<label style="color: red; width: 2px; display: inline">
                                (*)
                            </label>
                            <%: Html.EditorFor(model => model.HISTORIAL_CLINICO.First().Tx_Diagnostico)%><br />

                            Tratamiento:<label style="color: red; width: 2px; display: inline">
                                (*)
                            </label>
                            <%: Html.EditorFor(model => model.HISTORIAL_CLINICO.First().Tx_Tratamiento)%><br />





                        </fieldset>



                    </div>

                </section>


            </div>
            <!-- /content -->
        </div>
        <!-- /tabs -->


                  <label style="color: red; width: 2px; display: inline">
                    (*) Campos Obligatorios
                </label>


    </fieldset>

    <% } %>
    <button onclick="InsertarActualizarTotal()" class="btn btn-default">Grabar Expediente</button>
    <input type="hidden" id="idexpediente" />
    <div>
        <%: Html.ActionLink("Regresar a la Lista", "Index")%>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Styles.Render("~/Content/normalize.css") %>
    <%: Styles.Render("~/Content/tabs.css") %>
    <%: Styles.Render("~/Content/jsDatePick_ltr.min.css") %>
    <%: Styles.Render("~/Content/tabstyles.css") %>

    <script src="<%: Url.Content("~/Scripts/cbpFWTabs.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/modernizr.custom.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jsDatePick.min.1.3.js") %>" type="text/javascript"></script>


    <script src="<%:Url.Content("~/Scripts/source/expediente.js")%>" type="text/javascript"></script>
    <script src="<%:Url.Content("~/Scripts/source/poliza_vida.js")%>" type="text/javascript"></script>
    <script src="<%:Url.Content("~/Scripts/source/Prot_Jurada_Domicilio.js")%>" type="text/javascript"></script>
    <script src="<%:Url.Content("~/Scripts/source/cert_medico_defuncion.js")%>" type="text/javascript"></script>
    <script src="<%:Url.Content("~/Scripts/source/Historial_Clinico.js")%>" type="text/javascript"></script>
    <script type="text/javascript">
        window.onload = function () {
            new JsDatePick({
                useMode: 2,
                target: "Fe_InicioVigencia",
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
            new JsDatePick({
                useMode: 2,
                target: "Fe_Renovacion",
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
            new JsDatePick({
                useMode: 2,
                target: "Fe_Vencimiento",
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
            new JsDatePick({
                useMode: 2,
                target: "Fe_Celebreacion",
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
            new JsDatePick({
                useMode: 2,
                target: "Fe_Consulta",
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


        function InsertarActualizarEx() {
            //Obtener valores del div que esta en _EditProducto.cshtml
            var Co_Expediente = $("#Co_Expediente").val();
            var Co_Asegurado = $("#Co_Asegurado").val();
            var Co_Beneficiario = $("#Co_Beneficiario").val();

            console.log('Entre');

            var jsonData = "";

            if (Co_Expediente != "" && Co_Expediente != null) {
                //Construir el json
                jsonData = { "Co_Expediente": Co_Expediente, "Co_Asegurado": Co_Asegurado, "Co_Beneficiario": Co_Beneficiario };
                //Llamar a producto.insertProducto pasandole el json
                expediente.updateExpediente(jsonData);
            } else {
                //Construir el json
                jsonData = { "Co_Asegurado": Co_Asegurado, "Co_Beneficiario": Co_Beneficiario };
                //jsonData = { "circunscripcion": "k", "anio": "k", "lugar_De_Defuncion": "k", "causa_De_Muerte": "k", "fecha_De_Emision": "k", "firmado_por": "k", "ubigeo": "k", "num_siniestro": "k" }
                //jsonData = { "circunscripcion": Circunscripcion};
                //Llamar a producto.insertProducto pasandole el json
                console.log('Entre2');
                expediente.insertExpediente(jsonData);
            }
        }

        function InsertarPOliza() {
            //Obtener valores del div que esta en _EditProducto.cshtml
            var Ss_Prima = $("#Ss_Prima").val();
            var Fe_Renovacion = $("#Fe_Renovacion").val();
            var Fe_Vencimiento = $("#Fe_Vencimiento").val();
            var FORMA_PAGO_No_FormaPago = $("#Co_FormaPago").val();
            var Co_Expediente = $("#Co_Expediente").val();
            var Fe_InicioVigencia = $("#Fe_InicioVigencia").val();
            var Co_PolizaVida = $("#Co_PolizaVida").val();





            var jsonData = "";

            if (Co_PolizaVida != "" && Co_Expediente != null) {
                //Construir el json
                jsonData = { "Ss_Prima": Ss_Prima, "Fe_Renovacion": Fe_Renovacion, "Fe_InicioVigencia": Fe_InicioVigencia, "Fe_Vencimiento": Fe_Vencimiento, "Co_FormaPago": FORMA_PAGO_No_FormaPago, "Co_Expediente": Co_Expediente, "Co_PolizaVida": Co_PolizaVida };
                //Llamar a producto.insertProducto pasandole el json
                polizavida.updatePoliza(jsonData);
            } else {
                //Construir el json
                jsonData = { "Ss_Prima": Ss_Prima, "Fe_Renovacion": Fe_Renovacion, "Fe_InicioVigencia": Fe_InicioVigencia, "Fe_Vencimiento": Fe_Vencimiento, "Co_FormaPago": FORMA_PAGO_No_FormaPago, "Co_Expediente": Co_Expediente };
                //jsonData = { "circunscripcion": "k", "anio": "k", "lugar_De_Defuncion": "k", "causa_De_Muerte": "k", "fecha_De_Emision": "k", "firmado_por": "k", "ubigeo": "k", "num_siniestro": "k" }
                //jsonData = { "circunscripcion": Circunscripcion};
                //Llamar a producto.insertProducto pasandole el json
                console.log(jsonData);
                polizavida.insertPoliza(jsonData);
            }
        }
        function InsertarPro() {
            //Obtener valores del div que esta en _EditProducto.cshtml
            var Tx_Direccion = $("#Tx_Direccion").val();
            var Fe_Celebreacion = $("#Fe_Celebreacion").val();
            var DISTRITO_No_Distrito = $("#Co_Distrito").val();
            var Co_Expediente = $("#Co_Expediente").val();
            var Co_Protocolo = $("#Co_Protocolo").val();
            var jsonData = "";

            if (Co_Protocolo != "" && Co_Protocolo != null) {
                //Construir el json
                jsonData = { "Tx_Direccion": Tx_Direccion, "Fe_Celebreacion": Fe_Celebreacion, "Co_Expediente": Co_Expediente, "Nu_Siniestro": Co_Expediente, "Co_Distrito": DISTRITO_No_Distrito, "Co_Protocolo": Co_Protocolo };
                //Llamar a producto.insertProducto pasandole el json
                protocolo.updateprotooo(jsonData);
            } else {
                //Construir el json
                console.log('entre pro');
                jsonData = { "Tx_Direccion": Tx_Direccion, "Fe_Celebreacion": Fe_Celebreacion, "Co_Expediente": Co_Expediente, "Nu_Siniestro": Co_Expediente, "Co_Distrito": DISTRITO_No_Distrito, "Co_Protocolo": Co_Protocolo };
                //jsonData = { "circunscripcion": "k", "anio": "k", "lugar_De_Defuncion": "k", "causa_De_Muerte": "k", "fecha_De_Emision": "k", "firmado_por": "k", "ubigeo": "k", "num_siniestro": "k" }
                //jsonData = { "circunscripcion": Circunscripcion};
                //Llamar a producto.insertProducto pasandole el json
                console.log(jsonData);
                protocolo.insertpro(jsonData);
            }
        }

        function Insertarcertme() {
            //Obtener valores del div que esta en _EditProducto.cshtml
            var Tx_Circunscripcion = $("#Tx_Circunscripcion").val();
            var Nu_Anio = $("#Nu_Anio").val();
            var Tx_LugarDefuncion = $("#Tx_LugarDefuncion").val();


            var Tx_CausaMuerte = $("#Tx_CausaMuerte").val();
            var Fe_Emision = $("#Fe_Emision").val();
            var Tx_FirmadoPor = $("#Tx_FirmadoPor").val();


            var Co_Expediente = $("#Co_Expediente").val();

            var Co_Folio = $("#Co_Folio").val();




            var jsonData = "";

            if (Co_Folio != "" && Co_Folio != null) {
                //Construir el json
                jsonData = { "Tx_Circunscripcion": Tx_Circunscripcion, "Nu_Anio": Nu_Anio, "Tx_LugarDefuncion": Tx_LugarDefuncion, "Tx_CausaMuerte": Tx_CausaMuerte, "Fe_Emision": Fe_Emision, "Tx_FirmadoPor": Tx_FirmadoPor, "Co_Expediente": Co_Expediente, "Co_Distrito": '33', "Co_Folio": Co_Folio };
                //Llamar a producto.insertProducto pasandole el json
                cert_medico_defuncion.updateCerti(jsonData);
            } else {
                //Construir el json
                jsonData = { "Tx_Circunscripcion": Tx_Circunscripcion, "Nu_Anio": Nu_Anio, "Tx_LugarDefuncion": Tx_LugarDefuncion, "Tx_CausaMuerte": Tx_CausaMuerte, "Fe_Emision": Fe_Emision, "Tx_FirmadoPor": Tx_FirmadoPor, "Co_Expediente": Co_Expediente, "Co_Distrito": '33', "Co_Folio": Co_Folio };
                //jsonData = { "circunscripcion": "k", "anio": "k", "lugar_De_Defuncion": "k", "causa_De_Muerte": "k", "fecha_De_Emision": "k", "firmado_por": "k", "ubigeo": "k", "num_siniestro": "k" }
                //jsonData = { "circunscripcion": Circunscripcion};
                //Llamar a producto.insertProducto pasandole el json
                console.log('entre certi');
                cert_medico_defuncion.insertCert(jsonData);
            }
        }

        function inserthc() {
            //Obtener valores del div que esta en _EditProducto.cshtml
            var No_Hospital = $("#No_Hospital").val();
            var No_ApeDoctor = $("#No_ApeDoctor").val();
            var Fe_Consulta = $("#Fe_Consulta").val();


            var Tx_ResultadoExamenes = $("#Tx_ResultadoExamenes").val();
            var Tx_Diagnostico = $("#Tx_Diagnostico").val();
            var Tx_Tratamiento = $("#Tx_Tratamiento").val();


            var Co_Expediente = $("#Co_Expediente").val();
            var Co_HistorialCli = $("#Co_HistorialCli").val();






            var jsonData = "";

            if (Co_HistorialCli != "" && Co_HistorialCli != null) {
                //Construir el json
                jsonData = { "No_Hospital": No_Hospital, "No_ApeDoctor": No_ApeDoctor, "Fe_Consulta": Fe_Consulta, "Tx_ResultadoExamenes": Tx_ResultadoExamenes, "Tx_Diagnostico": Tx_Diagnostico, "Tx_Tratamiento": Tx_Tratamiento, "Co_Expediente": Co_Expediente, "Co_HistorialCli": Co_HistorialCli };
                //Llamar a producto.insertProducto pasandole el json
                hc.updateHC(jsonData);
            } else {
                //Construir el json
                jsonData = { "No_Hospital": No_Hospital, "No_ApeDoctor": No_ApeDoctor, "Fe_Consulta": Fe_Consulta, "Tx_ResultadoExamenes": Tx_ResultadoExamenes, "Tx_Diagnostico": Tx_Diagnostico, "Tx_Tratamiento": Tx_Tratamiento, "Co_Expediente": Co_Expediente, "Co_HistorialCli": Co_HistorialCli };
                //jsonData = { "circunscripcion": "k", "anio": "k", "lugar_De_Defuncion": "k", "causa_De_Muerte": "k", "fecha_De_Emision": "k", "firmado_por": "k", "ubigeo": "k", "num_siniestro": "k" }
                //jsonData = { "circunscripcion": Circunscripcion};
                //Llamar a producto.insertProducto pasandole el json

                hc.inserthc(jsonData);
            }
        }

        function InsertarActualizarTotal() {
            var mensaje = "";
            var Co_Expediente = $("#Co_Expediente").val();
            var Co_Asegurado = $("#Co_Asegurado").val();
            if (Co_Asegurado == "") {
                mensaje = mensaje + "Falta Seleccionar Asegurado \n"
            }
            var Co_Beneficiario = $("#Co_Beneficiario").val();
            if (Co_Beneficiario == "") {
                mensaje = mensaje + "Falta Seleccionar Beneficiario \n"
            }


            var Ss_Prima = $("#Ss_Prima").val();
            if (Ss_Prima == "") {
                mensaje = mensaje + "Falta ingresar la prima \n"
            }

            var Fe_Renovacion = $("#Fe_Renovacion").val();
            if (Fe_Renovacion == "") {
                mensaje = mensaje + "Falta ingresar la fecha renovacion \n"
            }

            var Fe_Vencimiento = $("#Fe_Vencimiento").val();
            if (Fe_Vencimiento == "") {
                mensaje = mensaje + "Falta ingresar la fecha vencimiento \n"
            }

            var FORMA_PAGO_No_FormaPago = $("#Co_FormaPago").val();
            if (FORMA_PAGO_No_FormaPago == "") {
                mensaje = mensaje + "Falta ingresar la forma de pago \n"
            }



            var Fe_InicioVigencia = $("#Fe_InicioVigencia").val();
            if (Fe_InicioVigencia == "") {
                mensaje = mensaje + "Falta ingresar la fecha Vigencia \n"
            }



            var Tx_Direccion = $("#Tx_Direccion").val();
            if (Tx_Direccion == "") {
                mensaje = mensaje + "Falta ingresar la direccion \n"
            }


            var Fe_Celebreacion = $("#Fe_Celebreacion").val();
            if (Fe_Celebreacion == "") {
                mensaje = mensaje + "Falta ingresar la fecha celebracion \n"
            }

            var DISTRITO_No_Distrito = $("#Co_Distrito").val();
            if (DISTRITO_No_Distrito == "") {
                mensaje = mensaje + "Falta ingresar el distrito </br>"
            }






            var Tx_Circunscripcion = $("#Tx_Circunscripcion").val();
            if (Tx_Circunscripcion == "") {
                mensaje = mensaje + "Falta ingresar las circunscripcion \n"
            }


            var Nu_Anio = $("#Nu_Anio").val();
            if (Nu_Anio == "") {
                mensaje = mensaje + "Falta ingresar el año \n"
            }

            var Tx_LugarDefuncion = $("#Tx_LugarDefuncion").val();
            if (Tx_LugarDefuncion == "") {
                mensaje = mensaje + "Falta ingresar el lugar difuncion \n"
            }


            var Tx_CausaMuerte = $("#Tx_CausaMuerte").val();
            if (Tx_CausaMuerte == "") {
                mensaje = mensaje + "Falta ingresar la causa de muerte \n"
            }

            var Fe_Emision = $("#Fe_Emision").val();
            if (Fe_Emision == "") {
                mensaje = mensaje + "Falta ingresar fecha emision \n"
            }

            var Tx_FirmadoPor = $("#Tx_FirmadoPor").val();
            if (Tx_FirmadoPor == "") {
                mensaje = mensaje + "Falta ingresar firmado por \n"
            }


            var No_Hospital = $("#No_Hospital").val();
            if (No_Hospital == "") {
                mensaje = mensaje + "Falta ingresar el Hospital \n"
            }

            var No_ApeDoctor = $("#No_ApeDoctor").val();
            if (No_ApeDoctor == "") {
                mensaje = mensaje + "Falta ingresar el nombre doctor \n"
            }

            var Fe_Consulta = $("#Fe_Consulta").val();
            if (Fe_Consulta == "") {
                mensaje = mensaje + "Falta ingresar la fecha consulta \n"
            }


            var Tx_ResultadoExamenes = $("#Tx_ResultadoExamenes").val();
            if (Tx_ResultadoExamenes == "") {
                mensaje = mensaje + "Falta ingresar el Resultado Examen \n"
            }

            var Tx_Diagnostico = $("#Tx_Diagnostico").val();
            if (Tx_Diagnostico == "") {
                mensaje = mensaje + "Falta ingresar el diagnostico \n"
            }

            var Tx_Tratamiento = $("#Tx_Tratamiento").val();
            if (Tx_Tratamiento == "") {
                mensaje = mensaje + "Falta ingresar el tratamiento \n"
            }
            if (mensaje.length > 0) {
                alert(mensaje);
                return false;
            }
            else {
                InsertarActualizarEx();
            }


        }
        $(function () {


            $('#Fe_InicioVigencia').attr('readonly', true);
            $('#Fe_Renovacion').attr('readonly', true);
            $('#Fe_Vencimiento').attr('readonly', true);


            $('#Fe_Celebreacion').attr('readonly', true);
            $('#Fe_Emision').attr('readonly', true);
            $('#Fe_Consulta').attr('readonly', true);



            [].slice.call(document.querySelectorAll('.tabs')).forEach(function (el) {
                new CBPFWTabs(el);
            });


        });
    </script>

</asp:Content>