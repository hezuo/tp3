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
    public class SolicitudController : Controller
    {

        SolicitudLogica solicitudBL = new SolicitudLogica();
        EmpleadoLogica empleadoBL = new EmpleadoLogica();
        InvitacionLogica invitacionBL = new InvitacionLogica();
        PrestadoraLogica prestadoraBL = new PrestadoraLogica();

        public ActionResult Index(string codigoSolicitud, string razon, string ruc, string fechaIni, string fechaFin, string usuario, string estado, int page = 1, int pageSize = 10)
        {
            if (string.IsNullOrEmpty(codigoSolicitud))
            {
            }
            else
            {
                ViewData["Ok"] = "Solicitud Creada Satisfactoriamente con Código " + codigoSolicitud;
            }
            List<SOLICITUD_AFILIACION> model;
            if (!string.IsNullOrEmpty(razon) || !string.IsNullOrEmpty(ruc) || !string.IsNullOrEmpty(fechaIni) || !string.IsNullOrEmpty(fechaFin) || !string.IsNullOrEmpty(usuario) || !string.IsNullOrEmpty(estado))
            {
                model = solicitudBL.solicitudListarFiltrado(razon, ruc, fechaIni, fechaFin, usuario, estado);           
                ViewData["Tx_RazonSocial"] = razon;
                ViewData["Nu_Ruc"] = ruc;
                ViewData["Fe_SolicitudIni"] = fechaIni;
                ViewData["Fe_SolicitudFin"] = fechaFin;
                ViewData["No_UsuarioIns"] = usuario;
                ViewData["Estado_Solicitud"] = estado;
            }
            else
            {
                model = solicitudBL.solicitudListar();
            }
            PagedList<SOLICITUD_AFILIACION> pagedModel = new PagedList<SOLICITUD_AFILIACION>(model, page, pageSize);
            return View(pagedModel);
        }

        public ActionResult IndexSolicitud(string codigoSolicitud, string razon, string ruc, string fechaIni, string fechaFin, string usuario, string estado, int page = 1, int pageSize = 10)
        {
            List<SOLICITUD_AFILIACION> model;
            if (!string.IsNullOrEmpty(razon) || !string.IsNullOrEmpty(ruc) || !string.IsNullOrEmpty(fechaIni) || !string.IsNullOrEmpty(fechaFin) || !string.IsNullOrEmpty(usuario) || !string.IsNullOrEmpty(estado))
            {
                model = solicitudBL.solicitudListarFiltradoRegEnEval(razon, ruc, fechaIni, fechaFin, usuario, estado);
                ViewData["Tx_RazonSocial"] = razon;
                ViewData["Nu_Ruc"] = ruc;
                ViewData["Fe_SolicitudIni"] = fechaIni;
                ViewData["Fe_SolicitudFin"] = fechaFin;
                ViewData["No_UsuarioIns"] = usuario;
                ViewData["Estado_Solicitud"] = estado;
            }
            else
            {
                model = solicitudBL.solicitudListarRegEnEval();
            }
            PagedList<SOLICITUD_AFILIACION> pagedModel = new PagedList<SOLICITUD_AFILIACION>(model, page, pageSize);
            return View(pagedModel);
        }

        public ActionResult Details(int id)
        {
            SOLICITUD_AFILIACION model = solicitudBL.ObtenerSolicitud(id);
            return View(model);
        }

        public ActionResult Create(string CoPrestadora, string CoInvitacion, string NuFolio, string NoContacto, string NoApePatContacto, string NoApeMatContacto, string NuTelefonoContacto, string TxCorreoContacto, string CoordinadorList, string EvaluadorList)
        {
            List<EMPLEADO> empleados = empleadoBL.empleadoListar();
            ViewData["dsEmpleadoCoordinador"] = new SelectList(empleados, "Co_Empleado", "No_EmpleadoCompleto");
            ViewData["dsEmpleadoEvaluador"] = new SelectList(empleados, "Co_Empleado", "No_EmpleadoCompleto");

            if (string.IsNullOrEmpty(CoPrestadora))
            {
                if (CoPrestadora != null)
                {
                    ViewData["Error"] = "Debe Ingresar Prestadora";

                    ViewData["dsEmpleadoCoordinador"] = new SelectList(empleados, "Co_Empleado", "No_EmpleadoCompleto", CoordinadorList);
                    ViewData["dsEmpleadoEvaluador"] = new SelectList(empleados, "Co_Empleado", "No_EmpleadoCompleto", EvaluadorList);

                    ViewData["CodigoPrestadora"] = CoPrestadora;
                    ViewData["CodigoInvitacion"] = CoInvitacion;

                    SOLICITUD_AFILIACION solicitudTemp = new SOLICITUD_AFILIACION();

                    solicitudTemp.Nu_Folio = NuFolio;
                    solicitudTemp.No_Contacto = NoContacto;
                    solicitudTemp.No_ApePatContacto = NoApePatContacto;
                    solicitudTemp.No_ApeMatContacto = NoApeMatContacto;
                    solicitudTemp.Nu_TelefonoContacto = NuTelefonoContacto;
                    solicitudTemp.Tx_CorreoContacto = TxCorreoContacto;

                    return View(solicitudTemp);
                }
                    
                return View();
            }
            else
            {
                ViewData["dsEmpleadoCoordinador"] = new SelectList(empleados, "Co_Empleado", "No_EmpleadoCompleto", CoordinadorList);
                ViewData["dsEmpleadoEvaluador"] = new SelectList(empleados, "Co_Empleado", "No_EmpleadoCompleto", EvaluadorList);

                ViewData["CodigoInvitacion"] = CoInvitacion;
                
                SOLICITUD_AFILIACION solicitudTemp = new SOLICITUD_AFILIACION();

                solicitudTemp.Nu_Folio = NuFolio;
                solicitudTemp.No_Contacto = NoContacto;
                solicitudTemp.No_ApePatContacto = NoApePatContacto;
                solicitudTemp.No_ApeMatContacto = NoApeMatContacto;
                solicitudTemp.Nu_TelefonoContacto = NuTelefonoContacto;
                solicitudTemp.Tx_CorreoContacto = TxCorreoContacto;

                string prestadoraValidada = prestadoraBL.ValidarPrestadora(int.Parse(CoPrestadora));

                if (prestadoraValidada.Equals("No encontrado"))
                {
                    ViewData["Error"] = "Prestadora no Registrada";
                    ViewData["CodigoPrestadora"] = CoPrestadora;
                }
                else {
                    PRESTADORA prestadora = prestadoraBL.ObtenerPrestadora(int.Parse(CoPrestadora));
                    ViewData["CodigoPrestadora"] = prestadora.Co_Prestadora;
                    ViewData["RazonSocial"] = prestadora.Tx_RazonSocial;
                    ViewData["RUC"] = prestadora.Nu_Ruc;
                }

                return View(solicitudTemp);
            } 
        }

        [HttpPost]
        public ActionResult Create(SOLICITUD_AFILIACION solicitud, FormCollection collection, string dsEmpleadoCoordinadorList, string dsEmpleadoEvaluadorList)
        {
            try
            {
                SOLICITUD_AFILIACION solicitudNueva = new SOLICITUD_AFILIACION();
                
                //solicitudNueva.Co_Solicitud;
                solicitudNueva.Co_Invitacion = int.Parse(collection["Co_Invitacion"]);
                solicitudNueva.Nu_Folio = collection["Nu_Folio"];
                solicitudNueva.Co_Prestadora = int.Parse(collection["Co_Prestadora"]);
                solicitudNueva.Fe_Solicitud = DateTime.Now;
                solicitudNueva.No_Contacto = collection["No_Contacto"];
                solicitudNueva.No_ApePatContacto = collection["No_ApePatContacto"];
                solicitudNueva.No_ApeMatContacto = collection["No_ApeMatContacto"];
                solicitudNueva.Nu_TelefonoContacto = collection["Nu_TelefonoContacto"];
                solicitudNueva.Tx_CorreoContacto = collection["Tx_CorreoContacto"];
                solicitudNueva.Tx_EvaluacionSunat = "";
                solicitudNueva.Tx_EvaluacionRiesgos = "";
                solicitudNueva.Co_Coordinador = int.Parse(dsEmpleadoCoordinadorList);
                solicitudNueva.Co_Evaluador = int.Parse(dsEmpleadoEvaluadorList);
                solicitudNueva.Tx_EvaluacionServicios = "";
                solicitudNueva.Tx_ObservacionAprobador = "";
                solicitudNueva.Tx_ObservacionNegociador = "";
                solicitudNueva.Co_Estado = 1; //codigo 1 de FK_Estado_Solicitud: "Registrada"
                solicitudNueva.Fe_RegistroIns = DateTime.Now;
                solicitudNueva.No_UsuarioIns = collection["No_UsuarioIns"];
                solicitudNueva.Fe_RegistroUpd = DateTime.Now;
                solicitudNueva.No_UsuarioUpd = collection["No_UsuarioUpd"];

                string invitacionValidar = invitacionBL.ValidarInvitacion(solicitudNueva.Co_Invitacion);
                
                if (invitacionValidar.Equals("No encontrado")) {
                    ViewData["Error"] = "Invitación no Existe";

                    List<EMPLEADO> empleados = empleadoBL.empleadoListar();
                    ViewData["dsEmpleadoCoordinador"] = new SelectList(empleados, "Co_Empleado", "No_EmpleadoCompleto");
                    ViewData["dsEmpleadoEvaluador"] = new SelectList(empleados, "Co_Empleado", "No_EmpleadoCompleto");

                    PRESTADORA prestadora = prestadoraBL.ObtenerPrestadora(solicitud.Co_Prestadora);
                    ViewData["RazonSocial"] = prestadora.Tx_RazonSocial;
                    ViewData["RUC"] = prestadora.Nu_Ruc;

                    return View(solicitud);
                }
                else
                    if(invitacionValidar.Equals("Expiro")) {
                        ViewData["Error"] = "Invitación ya expiró";

                        List<EMPLEADO> empleados = empleadoBL.empleadoListar();
                        ViewData["dsEmpleadoCoordinador"] = new SelectList(empleados, "Co_Empleado", "No_EmpleadoCompleto");
                        ViewData["dsEmpleadoEvaluador"] = new SelectList(empleados, "Co_Empleado", "No_EmpleadoCompleto");

                        PRESTADORA prestadora = prestadoraBL.ObtenerPrestadora(solicitud.Co_Prestadora);
                        ViewData["RazonSocial"] = prestadora.Tx_RazonSocial;
                        ViewData["RUC"] = prestadora.Nu_Ruc;

                        return View(solicitud);
                    }
                else
                    if(invitacionValidar.Equals("Usada")) {
                        ViewData["Error"] = "Invitacion ya utilizada";

                        List<EMPLEADO> empleados = empleadoBL.empleadoListar();
                        ViewData["dsEmpleadoCoordinador"] = new SelectList(empleados, "Co_Empleado", "No_EmpleadoCompleto");
                        ViewData["dsEmpleadoEvaluador"] = new SelectList(empleados, "Co_Empleado", "No_EmpleadoCompleto");

                        PRESTADORA prestadora = prestadoraBL.ObtenerPrestadora(solicitud.Co_Prestadora);
                        ViewData["RazonSocial"] = prestadora.Tx_RazonSocial;
                        ViewData["RUC"] = prestadora.Nu_Ruc;

                        return View(solicitud);
                    }
                else
                    {
                        Boolean agregado = solicitudBL.AgregarSolicitud(solicitudNueva);

                        if (agregado)
                        {

                            SOLICITUD_AFILIACION solicitudUltima = solicitudBL.ObtenerSolicitudUltima();

                            invitacionBL.cambiarEstado(solicitudUltima.Co_Invitacion);

                            return RedirectToAction("Index", new { codigoSolicitud = solicitudUltima.Co_Solicitud.ToString() });
                        }
                        else {
                            ViewData["Error"] = "Error al Registrar Solicitud";

                            List<EMPLEADO> empleados = empleadoBL.empleadoListar();
                            ViewData["dsEmpleadoCoordinador"] = new SelectList(empleados, "Co_Empleado", "No_EmpleadoCompleto");
                            ViewData["dsEmpleadoEvaluador"] = new SelectList(empleados, "Co_Empleado", "No_EmpleadoCompleto");

                            return View(solicitud);
                        }
                    }
                
            }
            catch (Exception ex)
            {
                ViewData["Error"] = "Debe seleccionar Coordinador y Evaluador";

                List<EMPLEADO> empleados = empleadoBL.empleadoListar();
                ViewData["dsEmpleadoCoordinador"] = new SelectList(empleados, "Co_Empleado", "No_EmpleadoCompleto");
                ViewData["dsEmpleadoEvaluador"] = new SelectList(empleados, "Co_Empleado", "No_EmpleadoCompleto");

                PRESTADORA prestadora = prestadoraBL.ObtenerPrestadora(solicitud.Co_Prestadora);
                ViewData["RazonSocial"] = prestadora.Tx_RazonSocial;
                ViewData["RUC"] = prestadora.Nu_Ruc;

                return View(solicitud);
            }
        }

        public ActionResult Edit(int id)
        {
            SOLICITUD_AFILIACION model = solicitudBL.ObtenerSolicitud(id);

            List<EMPLEADO> empleados = empleadoBL.empleadoListar();
            ViewData["dsEmpleadoCoordinador"] = new SelectList(empleados, "Co_Empleado", "No_EmpleadoCompleto", model.Co_Coordinador);
            ViewData["dsEmpleadoEvaluador"] = new SelectList(empleados, "Co_Empleado", "No_EmpleadoCompleto", model.Co_Evaluador);

            return View(model);
        }

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection, string dsEmpleadoCoordinadorList, string dsEmpleadoEvaluadorList)
        {
            try
            {
                SOLICITUD_AFILIACION solicitudModificar = new SOLICITUD_AFILIACION();

                solicitudModificar.Nu_Folio = collection["Nu_Folio"];
                solicitudModificar.No_Contacto = collection["No_Contacto"];
                solicitudModificar.No_ApePatContacto = collection["No_ApePatContacto"];
                solicitudModificar.No_ApeMatContacto = collection["No_ApeMatContacto"];
                solicitudModificar.Nu_TelefonoContacto = collection["Nu_TelefonoContacto"];
                solicitudModificar.Tx_CorreoContacto = collection["Tx_CorreoContacto"];
                solicitudModificar.Co_Coordinador = int.Parse(dsEmpleadoCoordinadorList);
                solicitudModificar.Co_Evaluador = int.Parse(dsEmpleadoEvaluadorList);
                solicitudModificar.Fe_RegistroUpd = DateTime.Now;
                solicitudModificar.No_UsuarioUpd = collection["No_UsuarioUpd"];

                Boolean modificado = solicitudBL.EditarSolicitud(id, solicitudModificar);

                if (modificado)
                {
                    ViewData["Ok"] = "Solicitud Número " + id +" Modificada Satisfactoriamente" ;

                    List<SOLICITUD_AFILIACION> model = solicitudBL.solicitudListar();
                    PagedList<SOLICITUD_AFILIACION> pagedModel = new PagedList<SOLICITUD_AFILIACION>(model, 1, 10);
                    return View("Index", pagedModel);
                }
                else
                {
                    ViewData["Error"] = "Hubo un error al Editar la Solicitud. Modificación No Realizada";

                    SOLICITUD_AFILIACION model = solicitudBL.ObtenerSolicitud(id);

                    List<EMPLEADO> empleados = empleadoBL.empleadoListar();
                    ViewData["dsEmpleadoCoordinador"] = new SelectList(empleados, "Co_Empleado", "No_EmpleadoCompleto", model.Co_Coordinador);
                    ViewData["dsEmpleadoEvaluador"] = new SelectList(empleados, "Co_Empleado", "No_EmpleadoCompleto", model.Co_Evaluador);

                    return View(model);
                }
            }
            catch (Exception ex)
            {
                ViewData["Error"] = "Debe seleccionar Coordinador y Evaluador";

                SOLICITUD_AFILIACION model = solicitudBL.ObtenerSolicitud(id);

                List<EMPLEADO> empleados = empleadoBL.empleadoListar();
                ViewData["dsEmpleadoCoordinador"] = new SelectList(empleados, "Co_Empleado", "No_EmpleadoCompleto", model.Co_Coordinador);
                ViewData["dsEmpleadoEvaluador"] = new SelectList(empleados, "Co_Empleado", "No_EmpleadoCompleto", model.Co_Evaluador);

                return View(model);
            }
        }

        public ActionResult EditSolicitud(int id)
        {
            SOLICITUD_AFILIACION model = solicitudBL.ObtenerSolicitud(id);
            return View(model);
        }

        [HttpPost]
        public ActionResult EditSolicitud(int id, FormCollection collection)
        {
            try
            {

                SOLICITUD_AFILIACION solicitudModificar = new SOLICITUD_AFILIACION();

                Boolean cambioEstado = solicitudBL.EditarSolicitudEstado(id, 5);

                solicitudModificar.Tx_EvaluacionServicios = collection["Tx_EvaluacionServicios"];
                solicitudModificar.Fe_RegistroUpd = DateTime.Now;
                solicitudModificar.No_UsuarioUpd = collection["No_UsuarioUpd"];

                Boolean modificado = solicitudBL.EditarSolicitudServicio(id, solicitudModificar);

                if (modificado)
                {
                    ViewData["Ok"] = "Solicitud Número " + id + " Evaluada Satisfactoriamente";

                    List<SOLICITUD_AFILIACION> model = solicitudBL.solicitudListarRegEnEval();
                    PagedList<SOLICITUD_AFILIACION> pagedModel = new PagedList<SOLICITUD_AFILIACION>(model, 1, 10);
                    return View("IndexSolicitud", pagedModel);
                }
                else
                {
                    ViewData["Error"] = "Hubo un error al Editar la Solicitud. Modificación No Realizada";

                    SOLICITUD_AFILIACION model = solicitudBL.ObtenerSolicitud(id);
                    return View(model);
                }
            }
            catch (Exception ex)
            {
                ViewData["Error"] = "Debe seleccionar Coordinador y Evaluador";

                SOLICITUD_AFILIACION model = solicitudBL.ObtenerSolicitud(id);
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
            List<ESTADO_SOLICITUD> estados = solicitudBL.estadoSolicitudListar();
            ViewData["dsEstadoSolicitud"] = new SelectList(estados, "Co_Estado", "No_Estado");

            return View();
        }

        [HttpPost]
        public ActionResult Search(FormCollection collection, string dsEstadoSolicitudList)
        {
            try
            {
                
                string razon = collection["Tx_RazonSocial"];
                string ruc = collection["Nu_Ruc"];
                string fechaIni = collection["Fe_SolicitudIni"];
                string fechaFin = collection["Fe_SolicitudFin"];
                string usuario = collection["No_UsuarioIns"];
                string estado = dsEstadoSolicitudList;


                if (!string.IsNullOrEmpty(razon) || !string.IsNullOrEmpty(ruc) || !string.IsNullOrEmpty(fechaIni) || !string.IsNullOrEmpty(fechaFin) || !string.IsNullOrEmpty(usuario) || !string.IsNullOrEmpty(estado))
                {
                    List<SOLICITUD_AFILIACION> solicitudes = solicitudBL.solicitudListarFiltrado(razon, ruc, fechaIni, fechaFin, usuario, estado);
                    ViewData["Tx_RazonSocial"] = razon;
                    ViewData["Nu_Ruc"] = ruc;
                    ViewData["Fe_SolicitudIni"] = fechaIni;
                    ViewData["Fe_SolicitudFin"] = fechaFin;
                    ViewData["No_UsuarioIns"] = usuario;

                    if (solicitudes.Count() == 0)
                    {
                        ViewData["Error"] = "No hay registros coicidentes";

                        List<ESTADO_SOLICITUD> estados = solicitudBL.estadoSolicitudListar();
                        ViewData["dsEstadoSolicitud"] = new SelectList(estados, "Co_Estado", "No_Estado", dsEstadoSolicitudList);
                        return View();
                    }
                    else
                    {
                        PagedList<SOLICITUD_AFILIACION> pagedSolicitudes = new PagedList<SOLICITUD_AFILIACION>(solicitudes, 1, 10);
                        ViewData["Estado_Solicitud"] = estado;
                        return View("Index", pagedSolicitudes);
                    }

                }
                else
                {
                    ViewData["Error"] = "Debe llenar algun filtro";

                    List<ESTADO_SOLICITUD> estados = solicitudBL.estadoSolicitudListar();
                    ViewData["dsEstadoSolicitud"] = new SelectList(estados, "Co_Estado", "No_Estado");

                    return View();
                }
            }
            catch (Exception ex)
            {
                ViewData["Error"] = ex.Message;

                List<ESTADO_SOLICITUD> estados = solicitudBL.estadoSolicitudListar();
                ViewData["dsEstadoSolicitud"] = new SelectList(estados, "Co_Estado", "No_Estado", dsEstadoSolicitudList);
                ViewData["Tx_RazonSocial"] = collection["Tx_RazonSocial"];
                ViewData["Nu_Ruc"] = collection["Nu_Ruc"];
                ViewData["Fe_SolicitudIni"] = collection["Fe_SolicitudIni"];
                ViewData["Fe_SolicitudFin"] = collection["Fe_SolicitudFin"];
                ViewData["No_UsuarioIns"] = collection["No_UsuarioIns"];

                return View();
            }
        }

        public ActionResult SearchSolicitud()
        {
            List<ESTADO_SOLICITUD> estados = solicitudBL.estadoSolicitudListarRegEnEval();
            ViewData["dsEstadoSolicitud"] = new SelectList(estados, "Co_Estado", "No_Estado");

            return View();
        }

        [HttpPost]
        public ActionResult SearchSolicitud(FormCollection collection, string dsEstadoSolicitudList)
        {
            try
            {

                string razon = collection["Tx_RazonSocial"];
                string ruc = collection["Nu_Ruc"];
                string fechaIni = collection["Fe_SolicitudIni"];
                string fechaFin = collection["Fe_SolicitudFin"];
                string usuario = collection["No_UsuarioIns"];
                string estado = dsEstadoSolicitudList;


                if (!string.IsNullOrEmpty(razon) || !string.IsNullOrEmpty(ruc) || !string.IsNullOrEmpty(fechaIni) || !string.IsNullOrEmpty(fechaFin) || !string.IsNullOrEmpty(usuario) || !string.IsNullOrEmpty(estado))
                {
                    List<SOLICITUD_AFILIACION> solicitudes = solicitudBL.solicitudListarFiltradoRegEnEval(razon, ruc, fechaIni, fechaFin, usuario, estado);
                    ViewData["Tx_RazonSocial"] = razon;
                    ViewData["Nu_Ruc"] = ruc;
                    ViewData["Fe_SolicitudIni"] = fechaIni;
                    ViewData["Fe_SolicitudFin"] = fechaFin;
                    ViewData["No_UsuarioIns"] = usuario;

                    if (solicitudes.Count() == 0)
                    {
                        ViewData["Error"] = "No hay registros coicidentes";

                        List<ESTADO_SOLICITUD> estados = solicitudBL.estadoSolicitudListarRegEnEval();
                        ViewData["dsEstadoSolicitud"] = new SelectList(estados, "Co_Estado", "No_Estado", dsEstadoSolicitudList);
                        return View();
                    }
                    else
                    {
                        PagedList<SOLICITUD_AFILIACION> pagedSolicitudes = new PagedList<SOLICITUD_AFILIACION>(solicitudes, 1, 10);
                        ViewData["Estado_Solicitud"] = estado;
                        return View("IndexSolicitud", pagedSolicitudes);
                    }

                }
                else
                {
                    ViewData["Error"] = "Debe llenar algun filtro";

                    List<ESTADO_SOLICITUD> estados = solicitudBL.estadoSolicitudListarRegEnEval();
                    ViewData["dsEstadoSolicitud"] = new SelectList(estados, "Co_Estado", "No_Estado");

                    return View();
                }
            }
            catch (Exception ex)
            {
                ViewData["Error"] = ex.Message;

                List<ESTADO_SOLICITUD> estados = solicitudBL.estadoSolicitudListarRegEnEval();
                ViewData["dsEstadoSolicitud"] = new SelectList(estados, "Co_Estado", "No_Estado", dsEstadoSolicitudList);
                ViewData["Tx_RazonSocial"] = collection["Tx_RazonSocial"];
                ViewData["Nu_Ruc"] = collection["Nu_Ruc"];
                ViewData["Fe_SolicitudIni"] = collection["Fe_SolicitudIni"];
                ViewData["Fe_SolicitudFin"] = collection["Fe_SolicitudFin"];
                ViewData["No_UsuarioIns"] = collection["No_UsuarioIns"];

                return View();
            }
        }
    }
}
