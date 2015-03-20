using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Pacifico.DataAccess;
using Pacifico.Business;

namespace Pacifico.Interfaces.Controllers
{
    public class Informe_JuntaMedicaController : Controller
    {
        private PACIFICOEntities db = new PACIFICOEntities();

        //
        // GET: /Informe_JuntaMedica/

        public ActionResult Index()
        {
            var informe_junta_medica = db.INFORME_JUNTA_MEDICA.Include(i => i.EXPEDIENTE);
            ViewBag.css = "color: red;display: none;";
            return View(informe_junta_medica.ToList());
        }

        //
        // GET: /Informe_JuntaMedica/Details/5

        public ActionResult Details(int id = 0)
        {
            INFORME_JUNTA_MEDICA informe_junta_medica = db.INFORME_JUNTA_MEDICA.Find(id);
            if (informe_junta_medica == null)
            {
                return HttpNotFound();
            }
            return View(informe_junta_medica);
        }

        //
        // GET: /Informe_JuntaMedica/Create

        public ActionResult Create(int id = 0, int ac = 0)
        {
            INFORME_JUNTA_MEDICA informe_junta_medica = null;

            EXPEDIENTE Expediente = LNExpediente.getOne(id);
            if (ac == 2)
            {
                ViewBag.csshide = "display:none;";
                ViewBag.valueboton = "";
                ViewBag.titulo = "Ver Junta Medica";
            }
            if (ac == 1)
            {
                ViewBag.csshide = "display: inline-block";
                ViewBag.titulo = "Actualizar Junta Medica";
                ViewBag.valueboton = "Actualizar Junta Medica";
            }
            if (id == 0)
            {
                ViewBag.titulo = "Nuevo Informe Junta Medica";
                ViewBag.csshide = "display: inline-block";
                ViewBag.valueboton = "Grabar Junta Medica";


                var query =
                    from c in db.EXPEDIENTE
                    where !(from o in db.INFORME_JUNTA_MEDICA
                            select o.Co_Expediente)
                           .Contains(c.Co_Expediente)
                    select c;
                if (query.Count() == 0)
                {
                    var informe_junta_medica2 = db.INFORME_JUNTA_MEDICA.Include(i => i.EXPEDIENTE);
                    ViewBag.css = "color: red;display: inline-block;";
                    return View("Index", informe_junta_medica2.ToList());
                }

                Expediente = query.First();



                id = Expediente.Co_Expediente;



            }

            if (Expediente != null)
            {
                informe_junta_medica = new INFORME_JUNTA_MEDICA();
                informe_junta_medica.Fl_IndiciosDolo = false;
                if (Expediente.INFORME_JUNTA_MEDICA.Count() > 0)
                {
                    informe_junta_medica = Expediente.INFORME_JUNTA_MEDICA.First();
                    informe_junta_medica.EXPEDIENTE = Expediente;
                }
                else
                {
                    informe_junta_medica.EXPEDIENTE = Expediente;
                    informe_junta_medica.Fe_Emision = DateTime.Now;
                }

            }


            ViewBag.Co_Expediente = new SelectList(db.EXPEDIENTE, "Co_Expediente", "Co_Expediente", id);

            //List<SelectListItem> YesNoList = new List<SelectListItem>();
            //YesNoList.Add(new SelectListItem { Text = "", Value = "" });
            //YesNoList.Add(new SelectListItem { Text = "Si", Value = "1" });
            //YesNoList.Add(new SelectListItem { Text = "No", Value = "0" });

            //ViewBag.Fl_IndiciosDolo = new SelectList(YesNoList, "Value", "Text", (informe_junta_medica.Fl_IndiciosDolo==true) ? "1" : "0");
            //ViewBag.Fl_Aprobacion =new  SelectList(YesNoList, "Value", "Text",  (informe_junta_medica.Fl_Aprobacion==true) ? "1" : "0");
            return View(informe_junta_medica);
        }

        //
        // POST: /Informe_JuntaMedica/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(INFORME_JUNTA_MEDICA informe_junta_medica)
        {
            //if (ModelState.IsValid)
            //{
            String Mensaje = "";
            if (informe_junta_medica.Co_NumInfJuntaMedica > 0)
            {

                INFORME_JUNTA_MEDICA oINFORME_JUNTA_MEDICA = db.INFORME_JUNTA_MEDICA.Find(informe_junta_medica.Co_NumInfJuntaMedica);


                oINFORME_JUNTA_MEDICA.Tx_Conclusiones = informe_junta_medica.Tx_Conclusiones;
                oINFORME_JUNTA_MEDICA.Tx_DetalleDolo = informe_junta_medica.Tx_DetalleDolo;
                oINFORME_JUNTA_MEDICA.Fl_IndiciosDolo = informe_junta_medica.Fl_IndiciosDolo;
                oINFORME_JUNTA_MEDICA.Tx_TipoResultado = informe_junta_medica.Tx_TipoResultado;
                oINFORME_JUNTA_MEDICA.Fl_Aprobacion = informe_junta_medica.Fl_Aprobacion;


                db.Entry(oINFORME_JUNTA_MEDICA).State = EntityState.Modified;
                db.SaveChanges();
                Mensaje = "Informe Junta Medica Actualizado";

            }
            else
            {
                informe_junta_medica.Fe_Emision = DateTime.Now;
                db.INFORME_JUNTA_MEDICA.Add(informe_junta_medica);
                db.SaveChanges();
                Mensaje = "Informe Junta Medica Registrado";
            }
            //return RedirectToAction("Index");
            return Content("<script language='javascript' type='text/javascript'>alert('" + Mensaje + "');window.location.assign('../../Informe_JuntaMedica')</script>");
            //}

            //ViewBag.Co_Expediente = new SelectList(db.EXPEDIENTE, "Co_Expediente", "Co_Expediente", informe_junta_medica.Co_Expediente);
            //return View(informe_junta_medica);
        }

        //
        // GET: /Informe_JuntaMedica/Edit/5

        public ActionResult Edit(int id = 0)
        {
            INFORME_JUNTA_MEDICA informe_junta_medica = db.INFORME_JUNTA_MEDICA.Find(id);
            if (informe_junta_medica == null)
            {
                return HttpNotFound();
            }
            ViewBag.Co_Expediente = new SelectList(db.EXPEDIENTE, "Co_Expediente", "Co_Expediente", informe_junta_medica.Co_Expediente);
            return View(informe_junta_medica);
        }

        //
        // POST: /Informe_JuntaMedica/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(INFORME_JUNTA_MEDICA informe_junta_medica)
        {
            if (ModelState.IsValid)
            {
                db.Entry(informe_junta_medica).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Co_Expediente = new SelectList(db.EXPEDIENTE, "Co_Expediente", "Co_Expediente", informe_junta_medica.Co_Expediente);
            return View(informe_junta_medica);
        }

        //
        // GET: /Informe_JuntaMedica/Delete/5

        public ActionResult Delete(int id = 0)
        {
            INFORME_JUNTA_MEDICA informe_junta_medica = db.INFORME_JUNTA_MEDICA.Find(id);
            if (informe_junta_medica == null)
            {
                return HttpNotFound();
            }
            return View(informe_junta_medica);
        }

        //
        // POST: /Informe_JuntaMedica/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            INFORME_JUNTA_MEDICA informe_junta_medica = db.INFORME_JUNTA_MEDICA.Find(id);
            db.INFORME_JUNTA_MEDICA.Remove(informe_junta_medica);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}