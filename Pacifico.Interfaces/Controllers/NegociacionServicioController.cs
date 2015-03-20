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
    public class NegociacionServicioController : Controller
    {

        SolicitudLogica solicitudBL = new SolicitudLogica();
        SedeLogica sedeBL = new SedeLogica();
        PrestadoraLogica prestadoraBL = new PrestadoraLogica();
        ServicioSedeLogica servicioSedeBL = new ServicioSedeLogica();

        public ActionResult Index(int codigoSolicitud, int codigoPrestadora, int codigoSede, string servicioModificado, int page = 1, int pageSize = 10)
        {

            if (string.IsNullOrEmpty(servicioModificado))
            {
            }
            else
            {
                ViewData["Ok"] = "Servicio Modificado Satisfactoriamente";
            }

            PRESTADORA prestadoras = prestadoraBL.ObtenerPrestadora(codigoPrestadora);
            SEDE sedes = sedeBL.ObtenerSede(codigoSede);

            List<SERVICIO_SEDE> model = servicioSedeBL.servicioSedeListarFiltradoSedeAcreditado(codigoSede);
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

        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult Edit(int idSede, int idServicio, int CoSolicitud, int CoPrestadora)
        {

            SERVICIO_SEDE model = servicioSedeBL.ObtenerServicioSede(idSede, idServicio);

            List<SERVICIO> servicios = servicioSedeBL.servicioListar();
            ViewData["dsServicio"] = new SelectList(servicios, "Co_Servicio", "No_Servicio", model.Co_Servicio);

            List<RED> redes = servicioSedeBL.redListar();
            if (string.IsNullOrEmpty(model.Co_Red.ToString()))
            {
                ViewData["dsRed"] = new SelectList(redes, "Co_Red", "No_Red");
            }
            else {
                ViewData["dsRed"] = new SelectList(redes, "Co_Red", "No_Red", model.Co_Red);
            }


            ViewData["co_Solicitud"] = CoSolicitud;
            ViewData["co_Prestadora"] = CoPrestadora;
            ViewData["co_Sede"] = idSede;
            ViewData["EstadoServicio"] = model.Tx_Estado;
            return View(model);
        }
        [HttpPost]
        public ActionResult Edit(int idSede, int idServicio, FormCollection collection, string dsRedList)
        {
            try
            {
                if (collection["Po_Copago"].ToString().Equals("0.00") || collection["Po_Cobertura"].ToString().Equals("0.00"))
                {
                    throw new Exception();
                }
                else
                {
                    SERVICIO_SEDE servicioSedeModificar = new SERVICIO_SEDE();

                    //prestadoraModificar.Co_Prestadora;
                    servicioSedeModificar.Co_Servicio = int.Parse(collection["co_Servicio"]);
                    servicioSedeModificar.Co_Sede = idSede;
                    servicioSedeModificar.Co_Red = int.Parse(dsRedList);
                    servicioSedeModificar.Po_Copago = decimal.Parse(collection["Po_Copago"]);
                    servicioSedeModificar.Po_Cobertura = decimal.Parse(collection["Po_Cobertura"]);

                    Boolean modificado = servicioSedeBL.EditarServicioSede2(idSede, idServicio, servicioSedeModificar);

                    if (modificado)
                    {
                        return RedirectToAction("Index", "NegociacionServicio", new { codigoSolicitud = int.Parse(collection["co_Solicitud"]), codigoPrestadora = int.Parse(collection["co_Prestadora"]), codigoSede = int.Parse(collection["co_Sede"]), servicioModificado = "modificado" });
                    }
                    else
                    {
                        ViewData["Error"] = "Hubo un error al Editar el Servicio. Modificación No Realizada";

                        SERVICIO_SEDE model = servicioSedeBL.ObtenerServicioSede(idSede, idServicio);

                        List<SERVICIO> servicios = servicioSedeBL.servicioListar();
                        ViewData["dsServicio"] = new SelectList(servicios, "Co_Servicio", "No_Servicio", model.Co_Servicio);

                        List<RED> redes = servicioSedeBL.redListar();
                        if (string.IsNullOrEmpty(model.Co_Red.ToString()))
                        {
                            ViewData["dsRed"] = new SelectList(redes, "Co_Red", "No_Red");
                        }
                        else
                        {
                            ViewData["dsRed"] = new SelectList(redes, "Co_Red", "No_Red", model.Co_Red);
                        }

                        ViewData["co_Solicitud"] = collection["co_Solicitud"];
                        ViewData["co_Prestadora"] = collection["co_Prestadora"];
                        ViewData["co_Sede"] = collection["co_Sede"];
                        ViewData["EstadoServicio"] = collection["Tx_Estado"];
                        return View(model);
                    }
                }
            }
            catch (Exception ex)
            {
                ViewData["Error"] = "Debe llenar todos los campos obligatorios";

                SERVICIO_SEDE model = servicioSedeBL.ObtenerServicioSede(idSede, idServicio);

                List<SERVICIO> servicios = servicioSedeBL.servicioListar();
                ViewData["dsServicio"] = new SelectList(servicios, "Co_Servicio", "No_Servicio", model.Co_Servicio);

                List<RED> redes = servicioSedeBL.redListar();
                if (string.IsNullOrEmpty(model.Co_Red.ToString()))
                {
                    ViewData["dsRed"] = new SelectList(redes, "Co_Red", "No_Red");
                }
                else
                {
                    ViewData["dsRed"] = new SelectList(redes, "Co_Red", "No_Red", model.Co_Red);
                }

                ViewData["co_Solicitud"] = collection["co_Solicitud"];
                ViewData["co_Prestadora"] = collection["co_Prestadora"];
                ViewData["co_Sede"] = collection["co_Sede"];
                ViewData["EstadoServicio"] = collection["Tx_Estado"];
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

        public ActionResult SelectSede(int codigoSolicitud, int codigoPrestadora, int page = 1, int pageSize = 10)
        {
            SOLICITUD_AFILIACION modelSolicitud = solicitudBL.ObtenerSolicitud(codigoSolicitud);

            Boolean cambioEstado = solicitudBL.EditarSolicitudEstado(codigoSolicitud, 6);

            PRESTADORA modelPrestadora = prestadoraBL.ObtenerPrestadora(codigoPrestadora);

            List<SEDE> model = sedeBL.sedeListarFiltrado(codigoPrestadora);
            PagedList<SEDE> pagedModel = new PagedList<SEDE>(model, page, pageSize);

            ViewData["CoSolicitud"] = modelSolicitud.Co_Solicitud;
            ViewData["EstadoSolicitud"] = modelSolicitud.ESTADO_SOLICITUD.No_Estado;
            ViewData["CoPrestadora"] = modelPrestadora.Co_Prestadora;
            ViewData["RazonSocial"] = modelPrestadora.Tx_RazonSocial;
            ViewData["RUC"] = modelPrestadora.Nu_Ruc;
            return View(pagedModel);
        }

    }
}
