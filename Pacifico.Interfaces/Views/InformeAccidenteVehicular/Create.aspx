<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Pacifico.DataAccess.INFORME_ACCIDENTE_VEHICULAR>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Ingresar - Informe Vehicular
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<form id="form1" runat="server">

     <% if (!Request.IsAuthenticated){
        @Response.Redirect("/Home/Index");
    }%>

<h2>Ingresar Informe de Accidente Vehicular</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <%: Html.AntiForgeryToken() %>
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
        <td><label>C&oacute;digo Siniestro<span id="lblco_Siniestro" class="required">(*)</span></label></td> 
        <td><label>:</label></td>
        <td>            
            <%:Html.DropDownList("Co_Siniestro", (SelectList)ViewData["coSiniestroList"], "---------Seleccione---------")%>            
        </td>
        <td>&nbsp;</td>
        <td><label>Departamento<span id="lbldsDepartamentoList" class="required">(*)</span></label></td>
        <td><label>:</label></td>
        <td><%:Html.DropDownList("dsDepartamentoList", (SelectList)ViewData["dsDepartamento"], "---------Seleccione---------")%></td>
        <td>&nbsp;</td>
    </tr>
    <tr>            
        <td>&nbsp;</td>
        <td><label>Provincia<span id="lbldsProvinciaList" class="required">(*)</span></label></td>
        <td><label>:</label></td>
        <td><%:Html.DropDownList("dsProvinciaList", (SelectList)ViewData["dsProvincia"], "---------Seleccione---------")%></td>
        <td>&nbsp;</td>
        <td><label for="Co_Distrito">Distrito<span id="lbldsDistritoList" class="required">(*)</span></label></td>
        <td><label>:</label></td>
        <td><%:Html.DropDownList("dsDistritoList", (SelectList)ViewData["dsDistrito"], "---------Seleccione---------")%></td>
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
        <td style="height: 23px">Fecha y hora<span id="lblFe_InformeAccidentVehicular" class="required">(*)</span></td>
        <td style="height: 23px">:</td>
        <td style="height: 23px"><%: Html.EditorFor(model => model.Fe_InformeAccidentVehicular ) %></td>
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
    <tr>
        <td>&nbsp;</td>
        <td colspan="7" align="center">
		    <input type="button" value="Grabar Datos" class="btn" onclick="javascript: validarForm()" />
            &nbsp;
            <%: Html.ActionLink("Cancelar", "Index", "InformeAccidenteVehicular", routeValues: null, htmlAttributes: new {@class="btn", onclick = "return confirm('¿Desea salir de Ingresar Informe de Accidente Vehicular?')" })%>
        </td>
        <td>&nbsp;</td>
    </tr>
</table>
</div>
<% } %>

</form>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">    
       <link href="/Content/bootstrap-datetimepicker.css" rel="stylesheet">
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

      <script type="text/javascript">
          $(document).ready(function () {
              $("#dsDepartamentoList").change(function () {
                  llenarProvincias($("#dsDepartamentoList").val());
              });
              $("#Fe_InformeAccidentVehicular").datetimepicker({ format: 'yyyy-mm-dd hh:ii', forceParse: true });
          });
    </script>
    <script type="text/javascript">
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
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#dsProvinciaList").change(function () {
                llenarDistritos($("#dsProvinciaList").val(), $("#dsDepartamentoList").val());
            });
        });
    </script>
    <script type="text/javascript">
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

        function validarForm() {
            $("#errorMessage").text("");
            $("span.required").hide();
            var co_Siniestro = $("#co_Siniestro").val();
            var dsDepartamentoList = $("#dsDepartamentoList").val();
            var dsProvinciaList = $("#dsProvinciaList").val();
            var dsDistritoList = $("#dsDistritoList").val();
            var Tx_Direccion = $("#Tx_Direccion").val();
            var Tx_DanosProducidos = $("#Tx_DanosProducidos").val();
            var Fe_InformeAccidentVehicular = $("#Fe_InformeAccidentVehicular").val();

            if (co_Siniestro != ''
                && dsDepartamentoList != ''
                && dsProvinciaList != ''
                && dsDistritoList != ''
                && Tx_Direccion != ''
                && Tx_DanosProducidos != ''
                && Fe_InformeAccidentVehicular != ''
                ) {
                alert(Fe_InformeAccidentVehicular);
                $("form").submit();
                return true;
            } else {
                $("#errorMessage").text("Ingrese todos los datos");
                if (Tx_Direccion == '') {
                    $('#lblTx_Direccion').show();
                }

                if (dsDepartamentoList == '') {
                    $('#lbldsDepartamentoList').show();
                }
                if (dsProvinciaList == '') {
                    $('#lbldsProvinciaList').show();
                }
                if (dsDistritoList == '') {
                    $('#lbldsDistritoList').show();
                }
                if (Tx_DanosProducidos == '') {
                    $('#lblTx_DanosProducidos').show();
                }
                if (co_Siniestro == '') {
                    $('#lblco_Siniestro').show();
                }

                if (Fe_InformeAccidentVehicular == '') {
                    $('#lblFe_InformeAccidentVehicular').show();
                }



            }

            return false;
        }
    </script>

</asp:Content>