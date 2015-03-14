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
    public class SedeController : Controller
    {

        SedeLogica sedeBL = new SedeLogica();
        PrestadoraLogica prestadoraBL = new PrestadoraLogica();
        SolicitudLogica solicitudBL = new SolicitudLogica();
        DepartamentoLogica departamentoBL = new DepartamentoLogica();
        ProvinciaLogica provinciaBL = new ProvinciaLogica();

        public ActionResult IndexSede(int codigoSolicitud, int codigoPrestadora, string codigoSede, int page = 1, int pageSize = 10)
        {
            if (string.IsNullOrEmpty(codigoSede))
            {
            }
            else
            {
                ViewData["Ok"] = "Sede Creada Satisfactoriamente con Código " + codigoSede;
            }

            PRESTADORA prestadoras = prestadoraBL.ObtenerPrestadora(codigoPrestadora);

            List<SEDE> model = sedeBL.sedeListarFiltrado(codigoPrestadora);
            PagedList<SEDE> pagedModel = new PagedList<SEDE>(model, page, pageSize);

            ViewData["CoSolicitud"] = codigoSolicitud;
            ViewData["CoPrestadora"] = prestadoras.Co_Prestadora;
            ViewData["RazonSocial"] = prestadoras.Tx_RazonSocial;
            ViewData["RUC"] = prestadoras.Nu_Ruc;
            return View(pagedModel);
        }

        public ActionResult DetailsSede(int id, int CoSolicitud, int CoPrestadora)
        {
            SEDE model = sedeBL.ObtenerSede(id);

            ViewData["CoSolicitud"] = CoSolicitud;
            ViewData["CoPrestadora"] = CoPrestadora;
            return View(model);
        }

        public ActionResult CreateSede(int CoSolicitud, int CoPrestadora)
        {
            List<DEPARTAMENTO> departamentos = departamentoBL.departamentoListar();
            ViewData["dsDepartamento"] = new SelectList(departamentos, "Co_Departamento", "No_Departamento");

            ViewData["dsProvincia"] = new SelectList(new List<string>());
            ViewData["dsDistrito"] = new SelectList(new List<string>());

            ViewData["co_Solicitud"] = CoSolicitud;
            ViewData["co_Prestadora"] = CoPrestadora;
            return View();
        }
        [HttpPost]
        public ActionResult CreateSede(SEDE sede, FormCollection collection, string dsDepartamentoList, string dsProvinciaList, string dsDistritoList)
        {
            try
            {
                SEDE sedeNueva = new SEDE();

                if (string.IsNullOrEmpty(dsDistritoList))
                {
                    sedeNueva.Co_Distrito = int.Parse(dsDistritoList);
                }
                else
                {
                    int temp = provinciaBL.distritoObtenido(dsDistritoList, dsProvinciaList, int.Parse(dsDepartamentoList));
                    sedeNueva.Co_Distrito = temp;
                }

                sedeNueva.Co_Prestadora = int.Parse(collection["Co_Prestadora"]);
                sedeNueva.No_Sede = collection["No_Sede"];
                sedeNueva.Tx_Direccion = collection["Tx_Direccion"];
                sedeNueva.Nu_Telefono = collection["Nu_Telefono"];
                sedeNueva.No_Contacto = collection["No_Contacto"];
                sedeNueva.No_ApePatContacto = collection["No_ApePatContacto"];
                sedeNueva.No_ApeMatContacto = collection["No_ApeMatContacto"];
                sedeNueva.Tx_CorreoContacto = collection["Tx_CorreoContacto"];
                sedeNueva.Fe_RegistroIns = DateTime.Now;
                sedeNueva.No_UsuarioIns = collection["No_UsuarioIns"];
                sedeNueva.Fe_RegistroUpd = DateTime.Now;
                sedeNueva.No_UsuarioUpd = collection["No_UsuarioUpd"];

                //string rucValidar = prestadoraBL.ValidarRuc(sedeNueva.Nu_Ruc);
                Boolean agregado = sedeBL.AgregarSede(sedeNueva);

                if (agregado)
                {
                    SEDE sedeUltima = sedeBL.ObtenerSedeFiltradoUltima(int.Parse(collection["Co_Prestadora"]));

                    return RedirectToAction("SelectSede", "EvaluacionServicio", new { codigoSolicitud = int.Parse(collection["Co_Solicitud"]), codigoPrestadora = int.Parse(collection["Co_Prestadora"]), codigoSede = sedeUltima.Co_Sede.ToString() });
                }
                else
                {
                    ViewData["Error"] = "Error al Registrar Prestadora";

                    List<DEPARTAMENTO> departamentos = departamentoBL.departamentoListar();
                    ViewData["dsDepartamento"] = new SelectList(departamentos, "Co_Departamento", "No_Departamento");

                    ViewData["dsProvincia"] = new SelectList(new List<string>());
                    ViewData["dsDistrito"] = new SelectList(new List<string>());

                    ViewData["co_Solicitud"] = collection["Co_Solicitud"];
                    ViewData["co_Prestadora"] = collection["Co_Prestadora"];

                    return View(sede);
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

                ViewData["co_Solicitud"] = collection["Co_Solicitud"];
                ViewData["co_Prestadora"] = collection["Co_Prestadora"];

                return View(sede);
            }
        }

        public ActionResult EditSede(int id, int CoSolicitud, int CoPrestadora)
        {
            SEDE model = sedeBL.ObtenerSede(id);

            List<DEPARTAMENTO> departamentos = departamentoBL.departamentoListar();
            ViewData["dsDepartamento"] = new SelectList(departamentos, "Co_Departamento", "No_Departamento", model.DISTRITO.PROVINCIA.Co_Departamento);

            List<PROVINCIA> provincias = provinciaBL.provinciasListaObt(model.DISTRITO.PROVINCIA.Co_Departamento);
            ViewData["dsProvincia"] = new SelectList(provincias, "No_Provincia", "No_Provincia", model.DISTRITO.PROVINCIA.No_Provincia);

            List<DISTRITO> distritos = provinciaBL.distListaObtenida(model.DISTRITO.PROVINCIA.No_Provincia, model.DISTRITO.PROVINCIA.Co_Departamento);
            ViewData["dsDistrito"] = new SelectList(distritos, "No_Distrito", "No_Distrito", model.DISTRITO.No_Distrito);

            ViewData["co_Solicitud"] = CoSolicitud;
            ViewData["co_Prestadora"] = CoPrestadora;
            return View(model);
        }

        [HttpPost]
        public ActionResult EditSede(int id, FormCollection collection, string dsDepartamentoList, string dsProvinciaList, string dsDistritoList)
        {
            try
            {
                SEDE sedeModificar = new SEDE();

                if (string.IsNullOrEmpty(dsDistritoList))
                {
                    sedeModificar.Co_Distrito = int.Parse(dsDistritoList);
                }
                else
                {
                    int temp = provinciaBL.distritoObtenido(dsDistritoList, dsProvinciaList, int.Parse(dsDepartamentoList));
                    sedeModificar.Co_Distrito = temp;
                }

                //prestadoraModificar.Co_Prestadora;
                sedeModificar.No_Sede = collection["No_Sede"];
                sedeModificar.Tx_Direccion = collection["Tx_Direccion"];
                sedeModificar.Nu_Telefono = collection["Nu_Telefono"];
                sedeModificar.No_Contacto = collection["No_Contacto"];
                sedeModificar.No_ApePatContacto = collection["No_ApePatContacto"];
                sedeModificar.No_ApeMatContacto = collection["No_ApeMatContacto"];
                sedeModificar.Tx_CorreoContacto = collection["Tx_CorreoContacto"];
                sedeModificar.Fe_RegistroUpd = DateTime.Now;
                sedeModificar.No_UsuarioUpd = collection["No_UsuarioUpd"];

                Boolean modificado = sedeBL.EditarSede(id, sedeModificar);

                if (modificado)
                {
                    return RedirectToAction("SelectSede", "EvaluacionServicio", new { codigoSolicitud = int.Parse(collection["Co_Solicitud"]), codigoPrestadora = int.Parse(collection["Co_Prestadora"]), codigoSedeEditar = id.ToString() });
                }
                else
                {
                    ViewData["Error"] = "Hubo un error al Editar la Prestadora. Modificación No Realizada";

                    SEDE model = sedeBL.ObtenerSede(id);

                    List<DEPARTAMENTO> departamentos = departamentoBL.departamentoListar();
                    ViewData["dsDepartamento"] = new SelectList(departamentos, "Co_Departamento", "No_Departamento", model.DISTRITO.PROVINCIA.Co_Departamento);

                    List<PROVINCIA> provincias = provinciaBL.provinciasListaObt(model.DISTRITO.PROVINCIA.Co_Departamento);
                    ViewData["dsProvincia"] = new SelectList(provincias, "No_Provincia", "No_Provincia", model.DISTRITO.PROVINCIA.No_Provincia);

                    List<DISTRITO> distritos = provinciaBL.distListaObtenida(model.DISTRITO.PROVINCIA.No_Provincia, model.DISTRITO.PROVINCIA.Co_Departamento);
                    ViewData["dsDistrito"] = new SelectList(distritos, "No_Distrito", "No_Distrito", model.DISTRITO.No_Distrito);

                    ViewData["co_Solicitud"] = collection["Co_Solicitud"];
                    ViewData["co_Prestadora"] = collection["Co_Prestadora"];
                    return View(model);
                }
            }
            catch (Exception ex)
            {
                ViewData["Error"] = "Debe seleccionar Departamento, Provincia y Distrito";

                SEDE model = sedeBL.ObtenerSede(id);

                List<DEPARTAMENTO> departamentos = departamentoBL.departamentoListar();
                ViewData["dsDepartamento"] = new SelectList(departamentos, "Co_Departamento", "No_Departamento", model.DISTRITO.PROVINCIA.Co_Departamento);

                List<PROVINCIA> provincias = provinciaBL.provinciasListaObt(model.DISTRITO.PROVINCIA.Co_Departamento);
                ViewData["dsProvincia"] = new SelectList(provincias, "No_Provincia", "No_Provincia", model.DISTRITO.PROVINCIA.No_Provincia);

                List<DISTRITO> distritos = provinciaBL.distListaObtenida(model.DISTRITO.PROVINCIA.No_Provincia, model.DISTRITO.PROVINCIA.Co_Departamento);
                ViewData["dsDistrito"] = new SelectList(distritos, "No_Distrito", "No_Distrito", model.DISTRITO.No_Distrito);

                ViewData["co_Solicitud"] = collection["Co_Solicitud"];
                ViewData["co_Prestadora"] = collection["Co_Prestadora"];
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

    }
}
