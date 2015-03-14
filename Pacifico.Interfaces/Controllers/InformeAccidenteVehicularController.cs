using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Pacifico.Business;
using Pacifico.DataAccess;
using PagedList;
using PagedList.Mvc;

using System.Data;
using System.Data.Entity;
using System.IO;


namespace Pacifico.Interfaces.Controllers
{
    public class InformeAccidenteVehicularController : Controller
    {

        private PACIFICOEntities db = new PACIFICOEntities();

        InformeAccidenteVehicularLogica InformeAccidenteVehicularBL = new InformeAccidenteVehicularLogica();
        DocumentoInformeAccidenteVehicularLogica DocumentoInformeAccidenteVehicularBL = new DocumentoInformeAccidenteVehicularLogica();
        DepartamentoLogica departamentoBL = new DepartamentoLogica();
        ProvinciaLogica provinciaBL = new ProvinciaLogica();
        SiniestroLogica siniestroBL = new SiniestroLogica();



        public ActionResult Index(string codigoInformeAccidenteVehicular, string estado)
        {
            if (!string.IsNullOrEmpty(codigoInformeAccidenteVehicular) && !string.IsNullOrEmpty(estado))
            {
                if (estado.ToLower().Equals("creado"))
                {
                    ViewData["Ok"] = "Informe de Accidente Vehicular creado satisfactoriamente con Código " + codigoInformeAccidenteVehicular;
                }
                else if (estado.ToLower().Equals("editado"))
                {
                    ViewData["Ok"] = "Informe de Accidente Vehicular código " + codigoInformeAccidenteVehicular + " ha sido modificado exitosamente.";
                }

            }

            List<INFORME_ACCIDENTE_VEHICULAR> pagedModel = this.InformeAccidenteVehicularBL.informeAccidenteVehicularListar();
            return View(pagedModel);
        }



        //
        // GET: /Default1/Details/5

        public ActionResult Details(int id = 0)
        {
            INFORME_ACCIDENTE_VEHICULAR informe_accidente_vehicular = db.INFORME_ACCIDENTE_VEHICULAR.Find(id);
            if (informe_accidente_vehicular == null)
            {
                return HttpNotFound();
            }
            return View(informe_accidente_vehicular);
        }

        //
        // GET: /Default1/Create

        public ActionResult Create()
        {

            ViewBag.Co_Siniestro = new SelectList(db.SINIESTRO, "Co_Siniestro", "Nu_Siniestro");

            List<SINIESTRO> siniestroList = siniestroBL.listarSiniestrosVehicular();
            List<DEPARTAMENTO> departamentos = departamentoBL.departamentoListar();
            ViewData["dsDepartamento"] = new SelectList(departamentos, "Co_Departamento", "No_Departamento");

            ViewData["dsProvincia"] = new SelectList(new List<string>());
            ViewData["dsDistrito"] = new SelectList(new List<string>());

            ViewData["coSiniestroList"] = new SelectList(siniestroList, "Co_Siniestro", "Nu_Siniestro");


            return View();
        }

        //
        // POST: /Default1/Create

        [HttpPost]
        public ActionResult Create(INFORME_ACCIDENTE_VEHICULAR informe_accidente_vehicular, FormCollection collection, string dsDepartamentoList, string dsProvinciaList, string dsDistritoList)
        {
            if (ModelState.IsValid)
            {
                if (dsDepartamentoList == null) dsDepartamentoList = "0";
                int temp = provinciaBL.distritoObtenido(dsDistritoList, dsProvinciaList, int.Parse(dsDepartamentoList));
                informe_accidente_vehicular.Co_Distrito = temp;

                db.INFORME_ACCIDENTE_VEHICULAR.Add(informe_accidente_vehicular);
                db.SaveChanges();
                ESTADO_SINIESTRO estadoSiniestro = obtenerEstadoSiniestroPorTipo("Con Informe Vehicular");
                SINIESTRO siniestro = db.SINIESTRO.Find(informe_accidente_vehicular.Co_Siniestro);
                siniestro.Co_EstadoSiniestro = estadoSiniestro.Co_EstadoSiniestro;
                db.Entry(siniestro).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index", new { codigoInformeAccidenteVehicular = informe_accidente_vehicular.Co_InformeAccidenteVehicular.ToString(), estado = "creado" });
            }

            ViewBag.Co_Siniestro = new SelectList(db.SINIESTRO, "Co_Siniestro", "Nu_Siniestro", informe_accidente_vehicular.Co_Siniestro);
            return View(informe_accidente_vehicular);
        }

        //
        // GET: /Default1/Edit/5

        public ActionResult Edit(int id = 0)
        {
            INFORME_ACCIDENTE_VEHICULAR informe_accidente_vehicular = db.INFORME_ACCIDENTE_VEHICULAR.Find(id);

            if (informe_accidente_vehicular == null)
            {
                return HttpNotFound();
            }
            ViewData["Co_InformeAccidenteVehicular"] = id;
            ViewData["Co_Siniestro"] = informe_accidente_vehicular.Co_Siniestro;
            List<DEPARTAMENTO> departamentos = departamentoBL.departamentoListar();

            DISTRITO distrito = db.DISTRITO.Find(informe_accidente_vehicular.Co_Distrito);
            ViewData["distrito"] = distrito.No_Distrito;
            ViewData["provincia"] = distrito.PROVINCIA.No_Provincia;
            ViewData["departamento"] = distrito.PROVINCIA.DEPARTAMENTO.No_Departamento;
            ViewData["dsDepartamento"] = new SelectList(departamentos, "Co_Departamento", "No_Departamento", distrito.PROVINCIA.Co_Departamento);
            ViewData["Nu_Siniestro"] = informe_accidente_vehicular.SINIESTRO.Nu_Siniestro;

            List<PROVINCIA> provincias = provinciaBL.provinciasListaObt(distrito.PROVINCIA.Co_Departamento);
            ViewData["dsProvincia"] = new SelectList(provincias, "No_Provincia", "No_Provincia", distrito.PROVINCIA.No_Provincia);

            List<DISTRITO> distritos = provinciaBL.distListaObtenida(distrito.PROVINCIA.No_Provincia, distrito.PROVINCIA.Co_Departamento);
            ViewData["dsDistrito"] = new SelectList(distritos, "No_Distrito", "No_Distrito", distrito.No_Distrito);

            return View(informe_accidente_vehicular);
        }

        //
        // POST: /Default1/Edit/5

        [HttpPost]
        public ActionResult Edit(INFORME_ACCIDENTE_VEHICULAR informe_accidente_vehicular, FormCollection collection, string dsDepartamentoList, string dsProvinciaList, string dsDistritoList)
        {
            if (ModelState.IsValid)
            {
                db.Entry(informe_accidente_vehicular).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index", new { codigoInformeAccidenteVehicular = informe_accidente_vehicular.Co_InformeAccidenteVehicular.ToString(), estado = "editado" });
            }
            ViewBag.Co_Siniestro = new SelectList(db.SINIESTRO, "Co_Siniestro", "Nu_Siniestro", informe_accidente_vehicular.Co_Siniestro);
            return View(informe_accidente_vehicular);
        }

        //
        // GET: /Default1/Delete/5

        public ActionResult Delete(int id = 0)
        {
            INFORME_ACCIDENTE_VEHICULAR informe_accidente_vehicular = db.INFORME_ACCIDENTE_VEHICULAR.Find(id);
            if (informe_accidente_vehicular == null)
            {
                return HttpNotFound();
            }

            return View(informe_accidente_vehicular);
        }

        //
        // POST: /Default1/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            INFORME_ACCIDENTE_VEHICULAR informe_accidente_vehicular = db.INFORME_ACCIDENTE_VEHICULAR.Find(id);
            db.INFORME_ACCIDENTE_VEHICULAR.Remove(informe_accidente_vehicular);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult GetDistrito(string selectedProv, string selectedDept)
        {
            List<string> distritos = provinciaBL.distritosListaObtenida(selectedProv, int.Parse(selectedDept));
            return Json(new { distList = distritos });
        }

        public ActionResult AdjuntarArchivos(int id = 0, string mensaje = null)
        {
            INFORME_ACCIDENTE_VEHICULAR informe_accidente_vehicular = db.INFORME_ACCIDENTE_VEHICULAR.Find(id);
            if (informe_accidente_vehicular == null)
            {
                return HttpNotFound();
            }
            if (!string.IsNullOrEmpty(mensaje))
            {
                ViewData["Ok"] = mensaje;

            }
            List<DOCUMENTO_INFORME_ACCIDENTE_VEHICULAR> docs = DocumentoInformeAccidenteVehicularBL.documentosPorInformeCodigo(id);
            ViewData["Co_InformeVehicular"] = id;
            ViewData["Nu_Siniestro"] = informe_accidente_vehicular.SINIESTRO.Nu_Siniestro;


            PagedList<DOCUMENTO_INFORME_ACCIDENTE_VEHICULAR> pagedModel = new PagedList<DOCUMENTO_INFORME_ACCIDENTE_VEHICULAR>(docs, 1, 10);
            return View(pagedModel);


        }

        [HttpPost]

        public ActionResult AdjuntarArchivos(int id, FormCollection collection, HttpPostedFileBase file)
        {
            INFORME_ACCIDENTE_VEHICULAR informe_accidente_vehicular = db.INFORME_ACCIDENTE_VEHICULAR.Find(id);
            if (informe_accidente_vehicular == null)
            {
                return HttpNotFound();
            }

            bool problemUploadingFile = true;
            if (file != null && file.ContentLength > 0)
            {
                try
                {

                    DOCUMENTO_INFORME_ACCIDENTE_VEHICULAR documento = new DOCUMENTO_INFORME_ACCIDENTE_VEHICULAR();
                    documento.INFORME_ACCIDENTE_VEHICULAR = informe_accidente_vehicular;
                    string Ruta = "~/uploads/informe_vehicular";

                    string contentType = System.IO.Path.GetExtension(file.FileName);

                    if (contentType.ToLower().Equals(".jpg") || contentType.ToLower().Equals(".gif") || contentType.ToLower().Equals(".bmp")
                        || contentType.ToLower().Equals(".zip") || contentType.ToLower().Equals(".pdf")
                        )
                    {
                        var fileName = Path.GetFileName(file.FileName);

                        documento.Tx_RutaArchivo = "/uploads/informe_vehicular/" + fileName;
                        documento.Tx_Descripcion = fileName;

                        var path = Path.Combine(Server.MapPath(Ruta), fileName);

                        file.SaveAs(path);

                        db.DOCUMENTO_INFORME_ACCIDENTE_VEHICULAR.Add(documento);
                        db.SaveChanges();
                        problemUploadingFile = false;
                    }
                    else
                    {
                        ViewData["Error"] = "Tipo de archivo no soportado.";
                    }

                }
                catch (Exception ex)
                {
                    problemUploadingFile = true;
                    ViewData["Error"] = ex.Message;
                }
            }
            else
            {
                ViewData["Error"] = "No subio ningun archivo";
            }
            if (problemUploadingFile)
            {
                List<DOCUMENTO_INFORME_ACCIDENTE_VEHICULAR> docs = DocumentoInformeAccidenteVehicularBL.documentosPorInformeCodigo(id);
                ViewData["Co_InformeVehicular"] = id;
                ViewData["Nu_Siniestro"] = informe_accidente_vehicular.SINIESTRO.Nu_Siniestro;


                PagedList<DOCUMENTO_INFORME_ACCIDENTE_VEHICULAR> pagedModel = new PagedList<DOCUMENTO_INFORME_ACCIDENTE_VEHICULAR>(docs, 1, 10);
                return View(pagedModel);
            }
            else
            {

                return RedirectToAction("AdjuntarArchivos", new { id = informe_accidente_vehicular.Co_InformeAccidenteVehicular, mensaje = "Archivo adjuntado exitosamente. " });

            }


        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }

        protected ESTADO_SINIESTRO obtenerEstadoSiniestroPorTipo(string tipo)
        {
            List<ESTADO_SINIESTRO> estados = db.ESTADO_SINIESTRO.ToList();
            ESTADO_SINIESTRO estadoEncontrado = null;
            foreach (ESTADO_SINIESTRO estado in estados)
            {
                if (estado.No_EstadoSiniestro.ToLower().Equals(tipo.ToLower()))
                {
                    estadoEncontrado = estado;
                }

            }

            if (estadoEncontrado == null)
            {
                estadoEncontrado = new ESTADO_SINIESTRO();
                estadoEncontrado.No_EstadoSiniestro = tipo;
                db.ESTADO_SINIESTRO.Add(estadoEncontrado);
                db.SaveChanges();
            }


            return estadoEncontrado;
        }


    }
}