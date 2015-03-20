using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Pacifico.DataAccess;
using Pacifico.Business;
namespace MvcApplication1.Controllers
{
    public class Informe_InspectoriaController : Controller
    {
        private PACIFICOEntities db = new PACIFICOEntities();

        //
        // GET: /Informe_Inspectoria/

        public ActionResult Index()
        {
            var informe_inspectoria = db.INFORME_INSPECTORIA.Include(i => i.EXPEDIENTE);
            ViewBag.css = "color: red;display: none;";
            return View(informe_inspectoria.ToList());
        }

        //
        // GET: /Informe_Inspectoria/Details/5

        public ActionResult Details(int id = 0)
        {
            INFORME_INSPECTORIA informe_inspectoria = db.INFORME_INSPECTORIA.Find(id);
            if (informe_inspectoria == null)
            {
                return HttpNotFound();
            }
            return View(informe_inspectoria);
        }

        //
        // GET: /Informe_Inspectoria/Create

        public ActionResult Create(int id = 0, int ac = 0)
        {

            INFORME_INSPECTORIA informe_inspectoria = null;

            EXPEDIENTE Expediente = LNExpediente.getOne(id);




            if (ac == 2)
            {
                ViewBag.csshide = "display:none;";
                ViewBag.valueboton = "";
                ViewBag.titulo = "Ver Informe Inspectoria";
            }
            if (ac == 1)
            {
                ViewBag.csshide = "display: inline-block";
                ViewBag.titulo = "Actualizar Informe Inspectoria";
                ViewBag.valueboton = "Actualizar Informe";
            }
            if (id == 0)
            {
                ViewBag.titulo = "Nuevo Informe Inspectoria";
                ViewBag.csshide = "display: inline-block";
                ViewBag.valueboton = "Grabar Informe";


                var query =
                    from c in db.EXPEDIENTE
                    where !(from o in db.INFORME_INSPECTORIA
                            select o.Co_Expediente)
                           .Contains(c.Co_Expediente)
                    select c;
                if (query.Count() == 0)
                {
                    var informe_procuradoria2 = db.INFORME_INSPECTORIA.Include(i => i.EXPEDIENTE);
                    ViewBag.css = "color: red;display: inline-block;";
                    return View("Index", informe_procuradoria2.ToList());
                }

                Expediente = query.First();



                id = Expediente.Co_Expediente;



            }

            if (Expediente != null)
            {
                informe_inspectoria = new INFORME_INSPECTORIA();
                informe_inspectoria.Fl_IndiciosDolo = 0;
                if (Expediente.INFORME_INSPECTORIA.Count() > 0)
                {
                    informe_inspectoria = Expediente.INFORME_INSPECTORIA.First();
                    informe_inspectoria.EXPEDIENTE = Expediente;
                }
                else
                {
                    informe_inspectoria.EXPEDIENTE = Expediente;
                }

            }

            ViewBag.Co_Expediente = new SelectList(db.EXPEDIENTE, "Co_Expediente", "Co_Expediente", id);



            List<SelectListItem> YesNoList = new List<SelectListItem>();
            YesNoList.Add(new SelectListItem { Text = "", Value = "" });
            YesNoList.Add(new SelectListItem { Text = "Si", Value = "1" });
            YesNoList.Add(new SelectListItem { Text = "No", Value = "0" });

            ViewBag.Fl_IndiciosDolo = new SelectList(YesNoList, "Value", "Text", informe_inspectoria.Fl_IndiciosDolo);

            return View(informe_inspectoria);
        }

        //
        // POST: /Informe_Inspectoria/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(INFORME_INSPECTORIA informe_inspectoria)
        {
            if (ModelState.IsValid)
            {
                String Mensaje = "";
                if (informe_inspectoria.Co_NumInfInspect > 0)
                {

                    INFORME_INSPECTORIA oINFORME_INSPECTORIA = db.INFORME_INSPECTORIA.Find(informe_inspectoria.Co_NumInfInspect);


                    oINFORME_INSPECTORIA.Tx_Conclusiones = informe_inspectoria.Tx_Conclusiones;
                    oINFORME_INSPECTORIA.Tx_Resultados = informe_inspectoria.Tx_Resultados;
                    oINFORME_INSPECTORIA.Fl_IndiciosDolo = informe_inspectoria.Fl_IndiciosDolo;
                    oINFORME_INSPECTORIA.Fl_DocAnali = 1;
                    oINFORME_INSPECTORIA.Tx_DocsObs = "gg";

                    db.Entry(oINFORME_INSPECTORIA).State = EntityState.Modified;
                    db.SaveChanges();
                    Mensaje = "Informe Inspectoria Actualizado";

                }
                else
                {
                    informe_inspectoria.Fe_Emision = DateTime.Now;
                    db.INFORME_INSPECTORIA.Add(informe_inspectoria);
                    db.SaveChanges();
                    Mensaje = "Informe Inspectoria Registrado";
                }
                //return RedirectToAction("Index");
                return Content("<script language='javascript' type='text/javascript'>alert('" + Mensaje + "');window.location.assign('../../Informe_Inspectoria')</script>");
            }

            ViewBag.Co_Expediente = new SelectList(db.EXPEDIENTE, "Co_Expediente", "No_Beneficiario", informe_inspectoria.Co_Expediente);
            return View(informe_inspectoria);
        }

        //
        // GET: /Informe_Inspectoria/Edit/5

        public ActionResult Edit(int id = 0)
        {
            INFORME_INSPECTORIA informe_inspectoria = db.INFORME_INSPECTORIA.Find(id);
            if (informe_inspectoria == null)
            {
                return HttpNotFound();
            }
            ViewBag.Co_Expediente = new SelectList(db.EXPEDIENTE, "Co_Expediente", "No_Beneficiario", informe_inspectoria.Co_Expediente);
            return View(informe_inspectoria);
        }

        //
        // POST: /Informe_Inspectoria/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(INFORME_INSPECTORIA informe_inspectoria)
        {
            if (ModelState.IsValid)
            {
                db.Entry(informe_inspectoria).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Co_Expediente = new SelectList(db.EXPEDIENTE, "Co_Expediente", "No_Beneficiario", informe_inspectoria.Co_Expediente);
            return View(informe_inspectoria);
        }

        //
        // GET: /Informe_Inspectoria/Delete/5

        public ActionResult Delete(int id = 0)
        {
            INFORME_INSPECTORIA informe_inspectoria = db.INFORME_INSPECTORIA.Find(id);
            if (informe_inspectoria == null)
            {
                return HttpNotFound();
            }
            return View(informe_inspectoria);
        }

        //
        // POST: /Informe_Inspectoria/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            INFORME_INSPECTORIA informe_inspectoria = db.INFORME_INSPECTORIA.Find(id);
            db.INFORME_INSPECTORIA.Remove(informe_inspectoria);
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