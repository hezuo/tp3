using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Pacifico.Business;
using Pacifico.DataAccess;

namespace MvcApplication1.Controllers
{
    public class Informe_ProcuradoriaController : Controller
    {
        private PACIFICOEntities db = new PACIFICOEntities();

        //
        // GET: /Informe_Procuradoria/

        public ActionResult Index()
        {
            var informe_procuradoria = db.INFORME_PROCURADORIA.Include(i => i.EXPEDIENTE);
            return View(informe_procuradoria.ToList());
        }

        //
        // GET: /Informe_Procuradoria/Details/5

        public ActionResult Details(int id = 0)
        {
            INFORME_PROCURADORIA informe_procuradoria = db.INFORME_PROCURADORIA.Find(id);
            if (informe_procuradoria == null)
            {
                return HttpNotFound();
            }
            return View(informe_procuradoria);
        }

        //
        // GET: /Informe_Procuradoria/Create

        public ActionResult Create(int id = 0)
        {
            INFORME_PROCURADORIA informe_procuradoria = null;

            EXPEDIENTE Expediente = LNExpediente.getOne(id);
            if (Expediente != null)
            {
                informe_procuradoria = new INFORME_PROCURADORIA();
                if (Expediente.INFORME_PROCURADORIA.Count() > 0)
                {
                    informe_procuradoria = Expediente.INFORME_PROCURADORIA.First();
                    informe_procuradoria.EXPEDIENTE = Expediente;
               //     informe_procuradoria.Fl_Aprobacion = true;
                }
                else
                {
                    informe_procuradoria.EXPEDIENTE = Expediente;
               //     informe_procuradoria.Fl_Aprobacion = true;
                }

            }
            ViewBag.Co_Expediente = new SelectList(LNExpediente.getAll(), "Co_Expediente", "BENEFICIARIO.No_Beneficiario", id);
            return View(informe_procuradoria);
        }

        //
        // POST: /Informe_Procuradoria/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(INFORME_PROCURADORIA informe_procuradoria)
        {
            if (ModelState.IsValid)
            {

                if (informe_procuradoria.Co_NumInfProc > 0)
                {
                    LNINFORME_PROCURADORIA.Edit(informe_procuradoria);
                }
                else
                {
                    LNINFORME_PROCURADORIA.Add(informe_procuradoria);
                }


                return RedirectToAction("Index", "Expediente");
            }

            ViewBag.Co_Expediente = new SelectList(db.EXPEDIENTE, "Co_Expediente", "BENEFICIARIO.No_Beneficiario", informe_procuradoria.Co_Expediente);
            return View(informe_procuradoria);
        }

        //
        // GET: /Informe_Procuradoria/Edit/5

        public ActionResult Edit(int id = 0)
        {
            INFORME_PROCURADORIA informe_procuradoria = db.INFORME_PROCURADORIA.Find(id);
            if (informe_procuradoria == null)
            {
                return HttpNotFound();
            }
            ViewBag.Co_Expediente = new SelectList(db.EXPEDIENTE, "Co_Expediente", "BENEFICIARIO.No_Beneficiario", informe_procuradoria.Co_Expediente);
            return View(informe_procuradoria);
        }

        //
        // POST: /Informe_Procuradoria/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(INFORME_PROCURADORIA informe_procuradoria)
        {
            if (ModelState.IsValid)
            {
                db.Entry(informe_procuradoria).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Co_Expediente = new SelectList(db.EXPEDIENTE, "Co_Expediente", "BENEFICIARIO.No_Beneficiario", informe_procuradoria.Co_Expediente);
            return View(informe_procuradoria);
        }

        //
        // GET: /Informe_Procuradoria/Delete/5

        public ActionResult Delete(int id = 0)
        {
            INFORME_PROCURADORIA informe_procuradoria = db.INFORME_PROCURADORIA.Find(id);
            if (informe_procuradoria == null)
            {
                return HttpNotFound();
            }
            return View(informe_procuradoria);
        }

        //
        // POST: /Informe_Procuradoria/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            INFORME_PROCURADORIA informe_procuradoria = db.INFORME_PROCURADORIA.Find(id);
            db.INFORME_PROCURADORIA.Remove(informe_procuradoria);
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