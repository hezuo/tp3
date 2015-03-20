using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Pacifico.Business;
using Pacifico.DataAccess;
using PagedList;
using PagedList.Mvc;

namespace Pacifico.Interfaces.Controllers
{
    public class PrestadoraController : Controller
    {

        PrestadoraLogica prestadoraBL = new PrestadoraLogica();
        DepartamentoLogica departamentoBL = new DepartamentoLogica();
        ProvinciaLogica provinciaBL = new ProvinciaLogica();
        EvaluacionPrestadoraLogica evaluacionPrestadoraBL = new EvaluacionPrestadoraLogica();

        public ActionResult Index(string codigoPrestadora, string razon, string ruc, string fechaIni, string fechaFin, string estado, int page = 1, int pageSize = 10)
        {
            if (string.IsNullOrEmpty(codigoPrestadora))
            {
            }
            else
            {
                ViewData["Ok"] = "Prestadora Creada Satisfactoriamente con Código " + codigoPrestadora;
            }
            List<PRESTADORA> model;
            if (!string.IsNullOrEmpty(razon) || !string.IsNullOrEmpty(ruc) || !string.IsNullOrEmpty(fechaIni) || !string.IsNullOrEmpty(fechaFin) || !string.IsNullOrEmpty(estado))
            {
                model = prestadoraBL.prestadoraListarFiltrado(razon, ruc, fechaIni, fechaFin, estado);
                ViewData["Tx_RazonSocial"] = razon;
                ViewData["Nu_Ruc"] = ruc;
                ViewData["Fe_AfiliacionIni"] = fechaIni;
                ViewData["Fe_AfiliacionFin"] = fechaFin;
                ViewData["Fl_Activo"] = estado;
            }
            else
            {
                model = prestadoraBL.prestadoraListar();
            }
            PagedList<PRESTADORA> pagedModel = new PagedList<PRESTADORA>(model, page, pageSize);
            return View(pagedModel);
        }

        public ActionResult IndexPrestadora(string codigoPrestadora, string razon, string ruc, string fechaIni, string fechaFin, string coPrestadora, string inactivo, int page = 1, int pageSize = 10)
        {
            if (string.IsNullOrEmpty(coPrestadora))
            {
            }
            else
            {
                ViewData["Ok"] = "Prestadora con Código " + coPrestadora + " Evaluada Satisfactoriamente";
            }

            if (string.IsNullOrEmpty(inactivo))
            {
            }
            else
            {
                ViewData["Ok"] = "Prestadora con Código " + coPrestadora + " fue Inactivada";
            }

            List<PRESTADORA> model;
            if (!string.IsNullOrEmpty(razon) || !string.IsNullOrEmpty(ruc) || !string.IsNullOrEmpty(fechaIni) || !string.IsNullOrEmpty(fechaFin))
            {
                model = prestadoraBL.prestadoraListarFiltrado(razon, ruc, fechaIni, fechaFin, "1");
                ViewData["Tx_RazonSocial"] = razon;
                ViewData["Nu_Ruc"] = ruc;
                ViewData["Fe_AfiliacionIni"] = fechaIni;
                ViewData["Fe_AfiliacionFin"] = fechaFin;
            }
            else
            {
                model = prestadoraBL.prestadoraListarActivo();
            }
            PagedList<PRESTADORA> pagedModel = new PagedList<PRESTADORA>(model, page, pageSize);
            return View(pagedModel);
        }

        [HttpPost]
        public ActionResult GetProvincia(string selectedValue)
        {
            if (selectedValue.Equals(""))
            {
                List<string> provincias = new List<string>();
                return Json(new { provList = provincias });
            }
            else
            {
                List<string> provincias = provinciaBL.provinciasListaObtenida(int.Parse(selectedValue));
                return Json(new { provList = provincias });
            }
        }

        [HttpPost]
        public ActionResult GetDistrito(string selectedProv, string selectedDept)
        {
            List<string> distritos = provinciaBL.distritosListaObtenida(selectedProv, int.Parse(selectedDept));
            return Json(new { distList = distritos });
        }

        public ActionResult Details(int id)
        {
            PRESTADORA model = prestadoraBL.ObtenerPrestadora(id);
            return View(model);
        }

        public ActionResult DetailsPrestadora(int id)
        {
            PRESTADORA prestadoras = prestadoraBL.ObtenerPrestadora(id);

            List<EVALUACION_PRESTADORA> model = evaluacionPrestadoraBL.evaluacionPrestadoraListarFiltrado(id);

            ViewData["CoPrestadora"] = prestadoras.Co_Prestadora;
            ViewData["RazonSocial"] = prestadoras.Tx_RazonSocial;
            ViewData["RUC"] = prestadoras.Nu_Ruc;
            return View(model);
        }

        public ActionResult Create()
        {
            List<DEPARTAMENTO> departamentos = departamentoBL.departamentoListar();
            ViewData["dsDepartamento"] = new SelectList(departamentos, "Co_Departamento", "No_Departamento");

            ViewData["dsProvincia"] = new SelectList(new List<string>());
            ViewData["dsDistrito"] = new SelectList(new List<string>());

            return View();
        }
        [HttpPost]
        public ActionResult Create(PRESTADORA prestadora, FormCollection collection, string dsDepartamentoList, string dsProvinciaList, string dsDistritoList)
        {
            try
            {
                PRESTADORA prestadoraNueva = new PRESTADORA();

                if (string.IsNullOrEmpty(dsDistritoList))
                {
                    prestadoraNueva.Co_Distrito = int.Parse(dsDistritoList);
                }
                else
                {
                    int temp = provinciaBL.distritoObtenido(dsDistritoList, dsProvinciaList, int.Parse(dsDepartamentoList));
                    prestadoraNueva.Co_Distrito = temp;
                }

                //prestadoraNueva.Co_Prestadora;
                prestadoraNueva.Nu_Ruc = collection["Nu_Ruc"];
                prestadoraNueva.Tx_RazonSocial = collection["Tx_RazonSocial"];
                prestadoraNueva.Tx_DomicilioFiscal = collection["Tx_DomicilioFiscal"];
                prestadoraNueva.No_RepresentanteLegal = collection["No_RepresentanteLegal"];
                prestadoraNueva.No_ApePatRepresentanteLegal = collection["No_ApePatRepresentanteLegal"];
                prestadoraNueva.No_ApeMatRepresentanteLegal = collection["No_ApeMatRepresentanteLegal"];
                prestadoraNueva.Nu_TelefonoRepresentanteLegal = collection["Nu_TelefonoRepresentanteLegal"];
                prestadoraNueva.Tx_CorreoRepresentanteLegal = collection["Tx_CorreoRepresentanteLegal"];
                prestadoraNueva.Tx_PaginaWeb = "";
                prestadoraNueva.Fe_Afiliacion = DateTime.Now;
                prestadoraNueva.Fl_Activo = 0;
                prestadoraNueva.Fe_RegistroIns = DateTime.Now;
                prestadoraNueva.No_UsuarioIns = collection["No_UsuarioIns"];
                prestadoraNueva.Fe_RegistroUpd = DateTime.Now;
                prestadoraNueva.No_UsuarioUpd = collection["No_UsuarioUpd"];

                string rucValidar = prestadoraBL.ValidarRuc(prestadoraNueva.Nu_Ruc);

                if (rucValidar.Equals("Existe"))
                {
                    ViewData["Error"] = "RUC ya Existe";

                    List<DEPARTAMENTO> departamentos = departamentoBL.departamentoListar();
                    ViewData["dsDepartamento"] = new SelectList(departamentos, "Co_Departamento", "No_Departamento", dsDepartamentoList);

                    ViewData["dsProvincia"] = new SelectList(new List<string>());
                    ViewData["dsDistrito"] = new SelectList(new List<string>());

                    return View(prestadora);
                }
                else
                {
                    Boolean agregado = prestadoraBL.AgregarPrestadora(prestadoraNueva);

                    if (agregado)
                    {
                        PRESTADORA prestadoraUltima = prestadoraBL.ObtenerPrestadoraUltima();

                        return RedirectToAction("Index", new { codigoPrestadora = prestadoraUltima.Co_Prestadora.ToString() });
                    }
                    else
                    {
                        ViewData["Error"] = "Error al Registrar Prestadora";

                        List<DEPARTAMENTO> departamentos = departamentoBL.departamentoListar();
                        ViewData["dsDepartamento"] = new SelectList(departamentos, "Co_Departamento", "No_Departamento");

                        ViewData["dsProvincia"] = new SelectList(new List<string>());
                        ViewData["dsDistrito"] = new SelectList(new List<string>());

                        return View(prestadora);
                    }
                }

            }
            catch (Exception ex)
            {
                ViewData["Error"] = "Debe seleccionar Departamento, Provincia y Distrito";

                if (string.IsNullOrEmpty(dsDepartamentoList))
                {
                    List<DEPARTAMENTO> departamentos = departamentoBL.departamentoListar();
                    ViewData["dsDepartamento"] = new SelectList(departamentos, "Co_Departamento", "No_Departamento");

                    ViewData["dsProvincia"] = new SelectList(new List<string>());
                    ViewData["dsDistrito"] = new SelectList(new List<string>());
                }
                else
                    if (string.IsNullOrEmpty(dsProvinciaList))
                    {
                        List<DEPARTAMENTO> departamentos = departamentoBL.departamentoListar();
                        ViewData["dsDepartamento"] = new SelectList(departamentos, "Co_Departamento", "No_Departamento", dsDepartamentoList);

                        List<PROVINCIA> provincias = provinciaBL.provinciasListaObt(int.Parse(dsDepartamentoList));
                        ViewData["dsProvincia"] = new SelectList(provincias, "No_Provincia", "No_Provincia");

                        ViewData["dsDistrito"] = new SelectList(new List<string>());
                    }
                    else
                    {
                        List<DEPARTAMENTO> departamentos = departamentoBL.departamentoListar();
                        ViewData["dsDepartamento"] = new SelectList(departamentos, "Co_Departamento", "No_Departamento", dsDepartamentoList);

                        List<PROVINCIA> provincias = provinciaBL.provinciasListaObt(int.Parse(dsDepartamentoList));
                        ViewData["dsProvincia"] = new SelectList(provincias, "No_Provincia", "No_Provincia", dsProvinciaList);

                        List<DISTRITO> distritos = provinciaBL.distListaObtenida(dsProvinciaList, int.Parse(dsDepartamentoList));
                        ViewData["dsDistrito"] = new SelectList(distritos, "No_Distrito", "No_Distrito");
                    }

                return View(prestadora);
            }
        }

        public ActionResult Edit(int id)
        {
            PRESTADORA model = prestadoraBL.ObtenerPrestadora(id);

            List<DEPARTAMENTO> departamentos = departamentoBL.departamentoListar();
            ViewData["dsDepartamento"] = new SelectList(departamentos, "Co_Departamento", "No_Departamento", model.DISTRITO.PROVINCIA.Co_Departamento);

            List<PROVINCIA> provincias = provinciaBL.provinciasListaObt(model.DISTRITO.PROVINCIA.Co_Departamento);
            ViewData["dsProvincia"] = new SelectList(provincias, "No_Provincia", "No_Provincia", model.DISTRITO.PROVINCIA.No_Provincia);

            List<DISTRITO> distritos = provinciaBL.distListaObtenida(model.DISTRITO.PROVINCIA.No_Provincia, model.DISTRITO.PROVINCIA.Co_Departamento);
            ViewData["dsDistrito"] = new SelectList(distritos, "No_Distrito", "No_Distrito", model.DISTRITO.No_Distrito);

            return View(model);
        }
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection, string dsDepartamentoList, string dsProvinciaList, string dsDistritoList)
        {
            try
            {
                PRESTADORA prestadoraModificar = new PRESTADORA();

                if (string.IsNullOrEmpty(dsDistritoList))
                {
                    prestadoraModificar.Co_Distrito = int.Parse(dsDistritoList);
                }
                else
                {
                    int temp = provinciaBL.distritoObtenido(dsDistritoList, dsProvinciaList, int.Parse(dsDepartamentoList));
                    prestadoraModificar.Co_Distrito = temp;
                }

                //prestadoraModificar.Co_Prestadora;
                prestadoraModificar.Nu_Ruc = collection["Nu_Ruc"];
                prestadoraModificar.Tx_RazonSocial = collection["Tx_RazonSocial"];
                prestadoraModificar.Tx_DomicilioFiscal = collection["Tx_DomicilioFiscal"];
                prestadoraModificar.No_RepresentanteLegal = collection["No_RepresentanteLegal"];
                prestadoraModificar.No_ApePatRepresentanteLegal = collection["No_ApePatRepresentanteLegal"];
                prestadoraModificar.No_ApeMatRepresentanteLegal = collection["No_ApeMatRepresentanteLegal"];
                prestadoraModificar.Nu_TelefonoRepresentanteLegal = collection["Nu_TelefonoRepresentanteLegal"];
                prestadoraModificar.Tx_CorreoRepresentanteLegal = collection["Tx_CorreoRepresentanteLegal"];
                prestadoraModificar.Fe_RegistroUpd = DateTime.Now;
                prestadoraModificar.No_UsuarioUpd = collection["No_UsuarioUpd"];

                string rucValidar = prestadoraBL.ValidarRucEditado(prestadoraModificar.Nu_Ruc, id);

                if (rucValidar.Equals("Existe"))
                {
                    ViewData["Error"] = "RUC ya Existe";

                    PRESTADORA model = prestadoraBL.ObtenerPrestadora(id);

                    List<DEPARTAMENTO> departamentos = departamentoBL.departamentoListar();
                    ViewData["dsDepartamento"] = new SelectList(departamentos, "Co_Departamento", "No_Departamento", model.DISTRITO.PROVINCIA.Co_Departamento);

                    List<PROVINCIA> provincias = provinciaBL.provinciasListaObt(model.DISTRITO.PROVINCIA.Co_Departamento);
                    ViewData["dsProvincia"] = new SelectList(provincias, "No_Provincia", "No_Provincia", model.DISTRITO.PROVINCIA.No_Provincia);

                    List<DISTRITO> distritos = provinciaBL.distListaObtenida(model.DISTRITO.PROVINCIA.No_Provincia, model.DISTRITO.PROVINCIA.Co_Departamento);
                    ViewData["dsDistrito"] = new SelectList(distritos, "No_Distrito", "No_Distrito", model.DISTRITO.No_Distrito);

                    return View(model);
                }
                else
                {
                    Boolean modificado = prestadoraBL.EditarPrestadora(id, prestadoraModificar);

                    if (modificado)
                    {
                        ViewData["Ok"] = "Prestadora Número " + id + " Modificada Satisfactoriamente";

                        List<PRESTADORA> model = prestadoraBL.prestadoraListar();
                        PagedList<PRESTADORA> pagedModel = new PagedList<PRESTADORA>(model, 1, 10);
                        return View("Index", pagedModel);
                    }
                    else
                    {
                        ViewData["Error"] = "Hubo un error al Editar la Prestadora. Modificación No Realizada";

                        PRESTADORA model = prestadoraBL.ObtenerPrestadora(id);

                        List<DEPARTAMENTO> departamentos = departamentoBL.departamentoListar();
                        ViewData["dsDepartamento"] = new SelectList(departamentos, "Co_Departamento", "No_Departamento", model.DISTRITO.PROVINCIA.Co_Departamento);

                        List<PROVINCIA> provincias = provinciaBL.provinciasListaObt(model.DISTRITO.PROVINCIA.Co_Departamento);
                        ViewData["dsProvincia"] = new SelectList(provincias, "No_Provincia", "No_Provincia", model.DISTRITO.PROVINCIA.No_Provincia);

                        List<DISTRITO> distritos = provinciaBL.distListaObtenida(model.DISTRITO.PROVINCIA.No_Provincia, model.DISTRITO.PROVINCIA.Co_Departamento);
                        ViewData["dsDistrito"] = new SelectList(distritos, "No_Distrito", "No_Distrito", model.DISTRITO.No_Distrito);

                        return View(model);
                    }
                }
            }
            catch (Exception ex)
            {
                ViewData["Error"] = "Debe seleccionar Departamento, Provincia y Distrito";

                PRESTADORA model = prestadoraBL.ObtenerPrestadora(id);

                List<DEPARTAMENTO> departamentos = departamentoBL.departamentoListar();
                ViewData["dsDepartamento"] = new SelectList(departamentos, "Co_Departamento", "No_Departamento", model.DISTRITO.PROVINCIA.Co_Departamento);

                List<PROVINCIA> provincias = provinciaBL.provinciasListaObt(model.DISTRITO.PROVINCIA.Co_Departamento);
                ViewData["dsProvincia"] = new SelectList(provincias, "No_Provincia", "No_Provincia", model.DISTRITO.PROVINCIA.No_Provincia);

                List<DISTRITO> distritos = provinciaBL.distListaObtenida(model.DISTRITO.PROVINCIA.No_Provincia, model.DISTRITO.PROVINCIA.Co_Departamento);
                ViewData["dsDistrito"] = new SelectList(distritos, "No_Distrito", "No_Distrito", model.DISTRITO.No_Distrito);

                return View(model);
            }
        }

        public ActionResult Delete(int id)
        {
            return View();
        }
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult Search()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Search(FormCollection collection)
        {
            try
            {
                string razon = collection["Tx_RazonSocial"];
                string ruc = collection["Nu_Ruc"];
                string fechaIni = collection["Fe_AfiliacionIni"];
                string fechaFin = collection["Fe_AfiliacionFin"];
                string estado = collection["Fl_Activo"];


                if (!string.IsNullOrEmpty(razon) || !string.IsNullOrEmpty(ruc) || !string.IsNullOrEmpty(fechaIni) || !string.IsNullOrEmpty(fechaFin) || !string.IsNullOrEmpty(estado))
                {
                    List<PRESTADORA> prestadoras = prestadoraBL.prestadoraListarFiltrado(razon, ruc, fechaIni, fechaFin, estado);

                    ViewData["Tx_RazonSocial"] = razon;
                    ViewData["Nu_Ruc"] = ruc;
                    ViewData["Fe_AfiliacionIni"] = fechaIni;
                    ViewData["Fe_AfiliacionFin"] = fechaFin;
                    if (!string.IsNullOrEmpty(estado)) {
                        if (estado.Equals("0"))
                            ViewData["Fl_Inactivo"] = "selected";
                        if (estado.Equals("1"))
                            ViewData["Fl_Activo"] = "selected";
                    }

                    if (prestadoras.Count() == 0)
                    {
                        ViewData["Error"] = "No hay registros coicidentes";
                        return View();
                    }
                    else
                    {
                        PagedList<PRESTADORA> pagedPrestadoras = new PagedList<PRESTADORA>(prestadoras, 1, 10);
                        ViewData["Fl_Activo"] = estado;
                        return View("Index", pagedPrestadoras);
                    }

                }
                else
                {
                    ViewData["Error"] = "Debe llenar algun filtro";
                    return View();
                }
            }
            catch (Exception ex)
            {
                ViewData["Error"] = ex.Message;

                ViewData["Tx_RazonSocial"] = collection["Tx_RazonSocial"];
                ViewData["Nu_Ruc"] = collection["Nu_Ruc"];
                ViewData["Fe_AfiliacionIni"] = collection["Fe_AfiliacionIni"];
                ViewData["Fe_AfiliacionFin"] = collection["Fe_AfiliacionFin"];
                if (!string.IsNullOrEmpty(collection["Fl_Activo"].ToString()))
                {
                    if (collection["Fl_Activo"].ToString().Equals("0"))
                        ViewData["Fl_Inactivo"] = "selected";
                    if (collection["Fl_Activo"].ToString().Equals("1"))
                        ViewData["Fl_Activo"] = "selected";
                }
                return View();
            }
        }

        public ActionResult SearchPrestadora()
        {
            return View();
        }
        [HttpPost]
        public ActionResult SearchPrestadora(FormCollection collection)
        {
            try
            {
                string razon = collection["Tx_RazonSocial"];
                string ruc = collection["Nu_Ruc"];
                string fechaIni = collection["Fe_AfiliacionIni"];
                string fechaFin = collection["Fe_AfiliacionFin"];

                if (!string.IsNullOrEmpty(razon) || !string.IsNullOrEmpty(ruc) || !string.IsNullOrEmpty(fechaIni) || !string.IsNullOrEmpty(fechaFin))
                {
                    List<PRESTADORA> prestadoras = prestadoraBL.prestadoraListarFiltrado(razon, ruc, fechaIni, fechaFin, "1");

                    ViewData["Tx_RazonSocial"] = razon;
                    ViewData["Nu_Ruc"] = ruc;
                    ViewData["Fe_AfiliacionIni"] = fechaIni;
                    ViewData["Fe_AfiliacionFin"] = fechaFin;

                    if (prestadoras.Count() == 0)
                    {
                        ViewData["Error"] = "No hay registros coicidentes";
                        return View();
                    }
                    else
                    {
                        PagedList<PRESTADORA> pagedPrestadoras = new PagedList<PRESTADORA>(prestadoras, 1, 10);
                        return View("IndexPrestadora", pagedPrestadoras);
                    }

                }
                else
                {
                    ViewData["Error"] = "Debe llenar algun filtro";
                    return View();
                }
            }
            catch (Exception ex)
            {
                ViewData["Error"] = ex.Message;

                ViewData["Tx_RazonSocial"] = collection["Tx_RazonSocial"];
                ViewData["Nu_Ruc"] = collection["Nu_Ruc"];
                ViewData["Fe_AfiliacionIni"] = collection["Fe_AfiliacionIni"];
                ViewData["Fe_AfiliacionFin"] = collection["Fe_AfiliacionFin"];

                return View();
            }
        }

        public ActionResult Select(string razon, string ruc, string fechaIni, string fechaFin, string estado, int page = 1, int pageSize = 10)
        {
            List<PRESTADORA> model;
            if (!string.IsNullOrEmpty(razon) || !string.IsNullOrEmpty(ruc) || !string.IsNullOrEmpty(fechaIni) || !string.IsNullOrEmpty(fechaFin) || !string.IsNullOrEmpty(estado))
            {
                model = prestadoraBL.prestadoraListarFiltrado(razon, ruc, fechaIni, fechaFin, estado);
                ViewData["Tx_RazonSocial"] = razon;
                ViewData["Nu_Ruc"] = ruc;
                ViewData["Fe_AfiliacionIni"] = fechaIni;
                ViewData["Fe_AfiliacionFin"] = fechaFin;
                if (!string.IsNullOrEmpty(estado))
                {
                    if (estado.Equals("0"))
                        ViewData["Fl_Inactivo"] = "selected";
                    if (estado.Equals("1"))
                        ViewData["Fl_Activo"] = "selected";
                    ViewData["Estado"] = estado;
                }
            }
            else
            {
                model = prestadoraBL.prestadoraListar();
            }
            PagedList<PRESTADORA> pagedModel = new PagedList<PRESTADORA>(model, page, pageSize);
            return View(pagedModel);
        }
        [HttpPost]
        public ActionResult Select(FormCollection collection)
        {
            try
            {
                string razon = collection["Tx_RazonSocial"];
                string ruc = collection["Nu_Ruc"];
                string fechaIni = collection["Fe_AfiliacionIni"];
                string fechaFin = collection["Fe_AfiliacionFin"];
                string estado = collection["Fl_Activo"];

                if (!string.IsNullOrEmpty(razon) || !string.IsNullOrEmpty(ruc) || !string.IsNullOrEmpty(fechaIni) || !string.IsNullOrEmpty(fechaFin) || !string.IsNullOrEmpty(estado))
                {
                    List<PRESTADORA> prestadoras = prestadoraBL.prestadoraListarFiltrado(razon, ruc, fechaIni, fechaFin, estado);

                    ViewData["Tx_RazonSocial"] = razon;
                    ViewData["Nu_Ruc"] = ruc;
                    ViewData["Fe_AfiliacionIni"] = fechaIni;
                    ViewData["Fe_AfiliacionFin"] = fechaFin;
                    if (estado.Equals("0"))
                        ViewData["Fl_Inactivo"] = "selected";
                    if (estado.Equals("1"))
                        ViewData["Fl_Activo"] = "selected";

                    if (prestadoras.Count() == 0)
                    {
                        ViewData["Error"] = "No hay registros coicidentes";
                        PagedList<PRESTADORA> pagedPrestadoras = new PagedList<PRESTADORA>(prestadoras, 1, 10);
                        return View(pagedPrestadoras);
                    }
                    else
                    {
                        PagedList<PRESTADORA> pagedPrestadoras = new PagedList<PRESTADORA>(prestadoras, 1, 10);
                        ViewData["Estado"] = estado;
                        return View(pagedPrestadoras);
                    }
                }
                else
                {
                    ViewData["Error"] = "Debe llenar algun filtro";

                    List<PRESTADORA> prestadoras = new List<PRESTADORA>();
                    PagedList<PRESTADORA> pagedPrestadoras = new PagedList<PRESTADORA>(prestadoras, 1, 10);
                    return View(pagedPrestadoras);
                }
            }
            catch (Exception ex)
            {
                ViewData["Error"] = ex.Message;

                ViewData["Tx_RazonSocial"] = collection["Tx_RazonSocial"];
                ViewData["Nu_Ruc"] = collection["Nu_Ruc"];
                ViewData["Fe_AfiliacionIni"] = collection["Fe_AfiliacionIni"];
                ViewData["Fe_AfiliacionFin"] = collection["Fe_AfiliacionFin"];
                if (collection["Fl_Activo"].ToString().Equals("0"))
                    ViewData["Fl_Inactivo"] = "selected";
                if (collection["Fl_Activo"].ToString().Equals("1"))
                    ViewData["Fl_Activo"] = "selected";

                List<PRESTADORA> prestadoras = new List<PRESTADORA>();
                PagedList<PRESTADORA> pagedPrestadoras = new PagedList<PRESTADORA>(prestadoras, 1, 10);
                return View(pagedPrestadoras);
            }
        }
    }
}