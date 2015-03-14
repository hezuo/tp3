<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PagedList.IPagedList<Pacifico.DataAccess.PRESTADORA>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
     Seleccionar - Prestadoras
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% if (!Request.IsAuthenticated)
    {
        @Response.Redirect("/Home/Index");   
    }%>
<h2>Seleccionar Prestadora</h2>

    
<% using (Html.BeginForm()) { %>
    <%: Html.AntiForgeryToken() %>

    <h4>
        <b>
            <font color="red">
                <p><%: ViewData["Error"] %></p>
            </font>
        </b>
    </h4>
    <div class="form-actions">

<table width="100%">
        <tr>  
            <td>&nbsp;</td>
            <td><label>Razón Social</label></td> 
            <td><label>:</label></td>
            <td><%: Html.TextBox("Tx_RazonSocial", ViewData["Tx_RazonSocial"]) %></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label>RUC</label></td>
            <td><label>:</label></td>
            <td><%: Html.TextBox("Nu_Ruc", ViewData["Nu_Ruc"]) %></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label>Fecha de Afiliacion</label></td>
            <td><label>:</label></td>
            <td><%: Html.TextBox("Fe_AfiliacionIni", ViewData["Fe_AfiliacionIni"]) %></td>
            <td><label>a</label></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td><%: Html.TextBox("Fe_AfiliacionFin", ViewData["Fe_AfiliacionFin"]) %></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><label>Estado</label></td>
            <td><label>:</label></td>
            <td>
                <select id="Fl_Activo" name="Fl_Activo"> 
                    <option value="">---------Seleccione---------</option> 
                    <option value="0" <%:ViewData["Fl_Inactivo"]%>>Inactiva</option>
                    <option value="1" <%:ViewData["Fl_Activo"]%>>Activa</option>
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
		        <input type="submit" value="Buscar Prestadora" class="btn" />
                &nbsp;
                <%: Html.ActionLink("Cancelar", "Create", "Solicitud", routeValues: null, htmlAttributes: new {@class="btn", onclick = "return confirm('¿Desea salir de Seleccionar Prestadora?')" })%>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </div>
<% } %>

<div>
<% if ( Model.Count()!=0 ) { %>
<table class="table table-striped" >
    <tr>
        <th>ID</th>
        <th>Razón Social</th>
        <th>RUC</th>
        <th>Distrito</th>
        <th>Provincia</th>
        <th>Departamento</th>
        <th>Estado</th>
        <th>&nbsp;</th>
    </tr>
<% foreach (var item in Model) {
       var activo = "Inactiva";
       if (item.Fl_Activo == 1)
           activo = "Activa"; %>
    <tr>
        <td><%: Html.DisplayFor(modelItem => item.Co_Prestadora) %></td>
        <td><%: Html.DisplayFor(modelItem => item.Tx_RazonSocial) %></td>
        <td><%: Html.DisplayFor(modelItem => item.Nu_Ruc) %></td>
        <td><%: Html.DisplayFor(modelItem => item.DISTRITO.No_Distrito) %></td>
        <td><%: Html.DisplayFor(modelItem => item.DISTRITO.PROVINCIA.No_Provincia) %></td>
        <td><%: Html.DisplayFor(modelItem => item.DISTRITO.PROVINCIA.DEPARTAMENTO.No_Departamento) %></td>
        <td><%: activo %></td>
        <td><i class="icon-edit"></i> <%: Html.ActionLink("Seleccionar", "Create", "Solicitud", new { CoPrestadora = item.Co_Prestadora }, htmlAttributes: null)%></td>
    </tr>
<% } %>
</table>    

<table width="100%">
    <tr>
        <td>
            <% string razon = (string)ViewData["Tx_RazonSocial"]; %>
            <% string ruc = (string)ViewData["Nu_Ruc"]; %>
            <% string fechaIni = (string)ViewData["Fe_AfiliacionIni"]; %>
            <% string fechaFin = (string)ViewData["Fe_AfiliacionFin"]; %>
            <% string estado = (string)ViewData["Estado"]; %>
            <%: Html.PagedListPager(Model,page => Url.Action("Select", new {razon,ruc,fechaIni,fechaFin,estado,page,pageSize=Model.PageSize}), new PagedListRenderOptions { LinkToFirstPageFormat = "<<", LinkToPreviousPageFormat = "<", LinkToNextPageFormat = ">", LinkToLastPageFormat = ">>", MaximumPageNumbersToDisplay=3 }) %>
        </td>
        <td align="right">
            Mostrando <%: Model.FirstItemOnPage %> a <%: Model.LastItemOnPage %> de <%: Model.TotalItemCount %> Prestadoras
        </td>
    </tr>
</table>
<% } %>
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
    <link href="/Content/bootstrap-datetimepicker.css" rel="stylesheet">
    <link href="/Content/datepicker.css" rel="stylesheet">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
    <script src="/Scripts/bootstrap-datepicker.js"></script>
    <script src="/Scripts/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#Fe_AfiliacionIni").datepicker({ format: 'dd-mm-yyyy', forceParse: true });
            $("#Fe_AfiliacionFin").datepicker({ format: 'dd-mm-yyyy', forceParse: true });
        });
    </script>
</asp:Content>