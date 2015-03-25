<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Pacifico.DataAccess.INFORME_ACCIDENTE_VEHICULAR>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Editar Informe Vehicular
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% if (!Request.IsAuthenticated)
    {
        @Response.Redirect("/Home/Index");   
    }%>
<h2>Modificar Informe de Accidente Vehicular</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>

    <%: Html.Hidden("Co_InformeAccidenteVehicular", ViewData["Co_InformeAccidenteVehicular"]) %>
    <%: Html.Hidden("Co_Siniestro", ViewData["Co_Siniestro"]) %>
    <%: Html.Hidden("Co_Distrito", ViewData["Co_Distrito"]) %>
    <%: Html.Hidden("Fe_InformeAccidentVehicular", Model.Fe_InformeAccidentVehicular) %>
    
            

    <h4>
        <b>
            <font color="red"  id="errorMessage">
                <p><%: ViewData["Error"] %></p>
                <p><%: Html.ValidationMessageFor(model => model.Tx_Direccion) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Co_Distrito) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Co_Siniestro) %></p>
                <p><%: Html.ValidationMessageFor(model => model.Tx_DanosProducidos) %></p>                
            </font>
        </b>
    </h4>

<div class="form-actions">
<table width="100%">        
    <tr>
        <td>&nbsp;</td>
        <td><label>Siniestro</label></td> 
        <td><label>:</label></td>
        <td>
              <%= ViewData["Nu_Siniestro"] %>
        </td>
        <td>&nbsp;</td>
        <td><label>Departamento</label></td>
        <td><label>:</label></td>
        <td><%=ViewData["departamento"] %></td>
        <td>&nbsp;</td>
   </tr>
    <tr>            
        <td>&nbsp;</td>
        <td><label>Provincia</label></td>
        <td><label>:</label></td>
        <td><%=ViewData["provincia"] %></td>
        <td>&nbsp;</td>
        <td><label for="Co_Distrito">Distrito</label></td>
        <td><label>:</label></td>        
        <td><%=ViewData["distrito"] %></td>
        <td>&nbsp;</td>            
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td><label>Direcci&oacute;n<span id="lblTx_Direccion" class="required">(*)</span></label></td>
        <td><label>:</label></td>
        <td>
            <%: Html.EditorFor(model => model.Tx_Direccion) %>            
        </td>
        <td>&nbsp;</td>
        <td><label>Da&ntilde;os Producidos<span id="lblTx_DanosProducidos" class="required">(*)</span></label></td>
        <td><label>:</label></td>
        <td>
            <%: Html.EditorFor(model => model.Tx_DanosProducidos) %>            
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="height: 23px">&nbsp;</td>
        <td style="height: 23px">Fecha y hora</td>
        <td style="height: 23px">:</td>        
        <td><%=Model.Fe_InformeAccidentVehicular%></td>
        <td style="height: 23px">&nbsp;</td>
        <td style="height: 23px">&nbsp;</td>
        <td style="height: 23px">&nbsp;</td>
        <td style="height: 23px">&nbsp;</td>
        <td style="height: 23px">&nbsp;</td>
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
</table>
<table width="100%">
    <tr>
        <td>&nbsp;</td>
        <td align="center"><input type="button" value="Grabar Datos" class="btn" onclick="javascript: validarForm()" />
        &nbsp;
        <%: Html.ActionLink("Cancelar", "Index", "InformeAccidenteVehicular", routeValues: null, htmlAttributes: new {@class="btn", onclick = "return confirm('¿Desea salir de Editar Informe de Accidente Vehicular?')" })%>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td><%: Html.ActionLink("Adjuntar Archivos", "AdjuntarArchivos", new { id = Model.Co_InformeAccidenteVehicular }, htmlAttributes: new { @class = "btn" })%>   
        </td>
    </tr>
</table>
</div>
<% } %>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
    <link href="/Content/bootstrap-datetimepicker.css" rel="stylesheet" />
      <style type="text/css">
  span.required{
    color: red;
    display: none;

  }
  </style>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
    <script src="/Scripts/bootstrap-datetimepicker.min.js"></script>
    <script>

        $(document).ready(function () {
            $("#dsDepartamentoList").change(function () {
                llenarProvincias($("#dsDepartamentoList").val());
            });
            $("#dsProvinciaList").change(function () {
                llenarDistritos($("#dsProvinciaList").val(), $("#dsDepartamentoList").val());
            });
        });

        function validarForm() {
            $("#errorMessage").text("");


            var Tx_Direccion = $("#Tx_Direccion").val();
            var Tx_DanosProducidos = $("#Tx_DanosProducidos").val();



            if (Tx_Direccion != ''
                && Tx_DanosProducidos != ''
                ) {
                $("form").submit();
                return true;
            } else {
                $("#errorMessage").text("Ingrese todos los datos");
                if (Tx_DanosProducidos == '') {
                    $('#lblTx_DanosProducidos').show();
                }
                if (Tx_Direccion == '') {
                    $('#lblTx_Direccion').show();
                }
            }

            return false;
        }

        function llenarProvincias(value) {
            var selectedValue = value;
            $.ajax({
                url: '<%:Url.Action("GetProvincia", "Prestadora")%>',
                type: 'POST',
                data: { "selectedValue": selectedValue },
                dataType: 'json',
                success: function (response) {
                    var items = "";
                    var items2 = "<option value=\"\">---------Seleccione---------</option>";
                    items += "<option value=\"\">---------Seleccione---------</option>";
                    $.each(response.provList, function (i, item) {
                        items += "<option value=\"" + item + "\">" + item + "</option>";
                    });
                    $("#dsProvinciaList").html(items);
                    $("#dsDistritoList").html(items2);
                },
                error: function (error) {
                    aler("error");
                }
            });
        }


        function llenarDistritos(pro, dep) {
            var selectedProv = pro;
            var selectedDept = dep;
            $.ajax({
                url: '<%:Url.Action("GetDistrito", "Prestadora")%>',
                type: 'POST',
                data: { "selectedProv": selectedProv, "selectedDept": selectedDept },
                dataType: 'json',
                success: function (response) {
                    var items = "";
                    items += "<option value=\"\">---------Seleccione---------</option>";
                    $.each(response.distList, function (i, item) {
                        items += "<option value=\"" + item + "\">" + item + "</option>";
                    });
                    $("#dsDistritoList").html(items);
                },
                error: function (error) {
                    aler("error");
                }
            });
        }

    </script>
</asp:Content>