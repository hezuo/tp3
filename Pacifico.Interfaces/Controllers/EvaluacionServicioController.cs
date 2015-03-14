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
    public class EvaluacionServicioController : Controller
    {

        SolicitudLogica solicitudBL = new SolicitudLogica();
        SedeLogica sedeBL = new SedeLogica();
        PrestadoraLogica prestadoraBL = new PrestadoraLogica();
        ServicioSedeLogica servicioSedeBL = new ServicioSedeLogica();

        public ActionResult Index(int codigoSolicitud, int codigoPrestadora, int codigoSede, string servicioCreado, string servicioModificado, int page = 1, int pageSize = 10)
        {
            if (string.IsNullOrEmpty(servicioCreado))
            {
            }
            else
            {
                ViewData["Ok"] = "Servicio Creado Satisfactoriamente";
            }

            if (string.IsNullOrEmpty(servicioModificado))
            {
            }
            else
            {
                ViewData["Ok"] = "Servicio Modificado Satisfactoriamente";
            }

            PRESTADORA prestadoras = prestadoraBL.ObtenerPrestadora(codigoPrestadora);
            SEDE sedes = sedeBL.ObtenerSede(codigoSede);

            List<SERVICIO_SEDE> model = servicioSedeBL.servicioSedeListarFiltradoSede(codigoSede);
            PagedList<SERVICIO_SEDE> pagedModel = new PagedList<SERVICIO_SEDE>(model, page, pageSize);

            ViewData["CoSolicitud"] = codigoSolicitud;
            ViewData["CoPrestadora"] = prestadoras.Co_Prestadora;
            ViewData["RazonSocial"] = prestadoras.Tx_RazonSocial;
            ViewData["RUC"] = prestadoras.Nu_Ruc;
            ViewData["CoSede"] = sedes.Co_Sede;
            ViewData["NoSede"] = sedes.No_Sede;
            return View(pagedModel);
        }

        public ActionResult Details(int id)
        {
            return View();
        }

        public ActionResult Create(int CoSolicitud, int CoPrestadora, int coSede)
        {
            List<SERVICIO> servicios = servicioSedeBL.servicioListar();
            ViewData["dsServicio"] = new SelectList(servicios, "Co_Servicio", "No_Servicio");

            ViewData["co_Solicitud"] = CoSolicitud;
            ViewData["co_Prestadora"] = CoPrestadora;
            ViewData["co_Sede"] = coSede;
            return View();
        }
        [HttpPost]
        public ActionResult Create(SERVICIO_SEDE servicioSede, FormCollection collection, string dsServicioList)
        {
            try
            {
                SERVICIO_SEDE servicioSedeNueva = new SERVICIO_SEDE();

                if (string.IsNullOrEmpty(dsServicioList))
                {
                    servicioSedeNueva.Co_Servicio = int.Parse(dsServicioList);
                }
                else
                {
                    servicioSedeNueva.Co_Servicio = int.Parse(dsServicioList);
                }

                servicioSedeNueva.Co_Sede = int.Parse(collection["co_Sede"]);
          //      servicioSedeNueva.Tx_Estado = collection["Tx_Estado"];
            //    servicioSedeNueva.Tx_Observacion = collection["Tx_Observacion"];

                //string rucValidar = prestadoraBL.ValidarRuc(sedeNueva.Nu_Ruc);
                Boolean agregado = servicioSedeBL.AgregarServicioSede(servicioSedeNueva);

                if (agregado)
                {
                    return RedirectToAction("Index", "EvaluacionServicio", new { codigoSolicitud = int.Parse(collection["co_Solicitud"]), codigoPrestadora = int.Parse(collection["co_Prestadora"]), codigoSede = int.Parse(collection["co_Sede"]), servicioCreado = "creado" });
                }
                else
                {
                    ViewData["Error"] = "Error al Registrar Servicio";

                    List<SERVICIO> servicios = servicioSedeBL.servicioListar();
                    ViewData["dsServicio"] = new SelectList(servicios, "Co_Servicio", "No_Servicio", dsServicioList);

                    ViewData["co_Solicitud"] = collection["co_Solicitud"];
                    ViewData["co_Prestadora"] = collection["co_Prestadora"];
                    ViewData["co_Sede"] = collection["co_Sede"];
                    return View(servicioSede);
                }

            }
            catch (Exception ex)
            {
                ViewData["Error"] = "Debe seleccionar Servicio";

                List<SERVICIO> servicios = servicioSedeBL.servicioListar();
                ViewData["dsServicio"] = new SelectList(servicios, "Co_Servicio", "No_Servicio");

                ViewData["co_Solicitud"] = collection["co_Solicitud"];
                ViewData["co_Prestadora"] = collection["co_Prestadora"];
                ViewData["co_Sede"] = collection["co_Sede"];
                return View(servicioSede);
            }
        }

        public ActionResult Edit(int idSede, int idServicio, int CoSolicitud, int CoPrestadora)
        {

            SERVICIO_SEDE model = servicioSedeBL.ObtenerServicioSede(idSede, idServicio);

            List<SERVICIO> servicios = servicioSedeBL.servicioListar();
            ViewData["dsServicio"] = new SelectList(servicios, "Co_Servicio", "No_Servicio",model.Co_Servicio);

            ViewData["co_Solicitud"] = CoSolicitud;
            ViewData["co_Prestadora"] = CoPrestadora;
            ViewData["co_Sede"] = idSede;
          //  ViewData["EstadoServicio"] = model.Tx_Estado;
            return View(model);
        }

        [HttpPost]
        public ActionResult Edit(int idSede, int idServicio, FormCollection collection, string dsServicioList)
        {
            try
            {
                SERVICIO_SEDE servicioSedeModificar = new SERVICIO_SEDE();

                //prestadoraModificar.Co_Prestadora;
                servicioSedeModificar.Co_Servicio = int.Parse(collection["co_Servicio"]);
                servicioSedeModificar.Co_Sede = idSede;
        //        servicioSedeModificar.Tx_Estado = collection["Tx_Estado"];
          //      servicioSedeModificar.Tx_Observacion = collection["Tx_Observacion"];

                Boolean modificado = servicioSedeBL.EditarServicioSede(idSede, idServicio, servicioSedeModificar);

                if (modificado)
                {
                    return RedirectToAction("Index", "EvaluacionServicio", new { codigoSolicitud = int.Parse(collection["co_Solicitud"]), codigoPrestadora = int.Parse(collection["co_Prestadora"]), codigoSede = int.Parse(collection["co_Sede"]), servicioModificado = "modificado" });
                }
                else
                {
                    ViewData["Error"] = "Hubo un error al Editar el Servicio. Modificación No Realizada";

                    SERVICIO_SEDE model = servicioSedeBL.ObtenerServicioSede(idSede, idServicio);

                    List<SERVICIO> servicios = servicioSedeBL.servicioListar();
                    ViewData["dsServicio"] = new SelectList(servicios, "Co_Servicio", "No_Servicio", model.Co_Servicio);

                    ViewData["co_Solicitud"] = collection["co_Solicitud"];
                    ViewData["co_Prestadora"] = collection["co_Prestadora"];
                    ViewData["co_Sede"] = collection["co_Sede"];
                    ViewData["EstadoServicio"] = collection["Tx_Estado"];
                    return View(model);

                }
            }
            catch (Exception ex)
            {
                ViewData["Error"] = "Debe seleccionar Servicio";

                SERVICIO_SEDE model = servicioSedeBL.ObtenerServicioSede(idSede, idServicio);

                List<SERVICIO> servicios = servicioSedeBL.servicioListar();
                ViewData["dsServicio"] = new SelectList(servicios, "Co_Servicio", "No_Servicio", model.Co_Servicio);

                ViewData["co_Solicitud"] = collection["co_Solicitud"];
                ViewData["co_Prestadora"] = collection["co_Prestadora"];
                ViewData["co_Sede"] = collection["co_Sede"];
                ViewData["EstadoServicio"] = collection["Tx_Estado"];
                return View(model);
            }
        }

        public ActionResult SelectSede(int codigoSolicitud, int codigoPrestadora, string codigoSede, string codigoSedeEditar, int page = 1, int pageSize = 10)
        {
            SOLICITUD_AFILIACION modelSolicitud = solicitudBL.ObtenerSolicitud(codigoSolicitud);

            Boolean cambioEstado = solicitudBL.EditarSolicitudEstado(codigoSolicitud,2);
            
            PRESTADORA modelPrestadora = prestadoraBL.ObtenerPrestadora(codigoPrestadora);

            if (string.IsNullOrEmpty(codigoSede))
            {
                if (string.IsNullOrEmpty(codigoSedeEditar))
                {
                }
                else
                {
                    ViewData["Ok"] = "Sede Número " + codigoSedeEditar + " Modificada Satisfactoriamente";
                }
            }
            else
            {
                ViewData["Ok"] = "Sede Creada Satisfactoriamente con Código " + codigoSede;
            }

            List<SEDE> model = sedeBL.sedeListarFiltrado(codigoPrestadora);
            PagedList<SEDE> pagedModel = new PagedList<SEDE>(model, page, pageSize);

            ViewData["CoSolicitud"] = modelSolicitud.Co_Solicitud;
            ViewData["EstadoSolicitud"] = modelSolicitud.ESTADO_SOLICITUD.No_Estado;
            ViewData["CoPrestadora"] = modelPrestadora.Co_Prestadora;
            ViewData["RazonSocial"] = modelPrestadora.Tx_RazonSocial;
            ViewData["RUC"] = modelPrestadora.Nu_Ruc;
            return View(pagedModel);
        }

        [HttpPost]
        public ActionResult SelectSede(FormCollection collection, string dsSedeList)
        {
            try
            {
                return RedirectToAction("Index", new { codigoPrestadora = int.Parse(collection["Co_Prestadora"]), codigoSede = int.Parse(dsSedeList) });
            }
            catch (Exception ex)
            {
                return null;
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
