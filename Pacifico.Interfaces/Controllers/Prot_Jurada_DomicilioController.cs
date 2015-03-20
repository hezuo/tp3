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
    public class Prot_Jurada_DomicilioController : Controller
    {
        private PACIFICOEntities db = new PACIFICOEntities();

        //
        // GET: /Prot_Jurada_Domicilio/

        public ActionResult Index()
        {
            var prot_jurada_domicilio = db.PROT_JURADA_DOMICILIO.Include(p => p.DISTRITO).Include(p => p.EXPEDIENTE);
            return View(prot_jurada_domicilio.ToList());
        }

        //
        // GET: /Prot_Jurada_Domicilio/Details/5

        public ActionResult Details(int id = 0)
        {
            PROT_JURADA_DOMICILIO prot_jurada_domicilio = db.PROT_JURADA_DOMICILIO.Find(id);
            if (prot_jurada_domicilio == null)
            {
                return HttpNotFound();
            }
            return View(prot_jurada_domicilio);
        }

        //
        // GET: /Prot_Jurada_Domicilio/Create

        public ActionResult Create()
        {
            ViewBag.Co_Distrito = new SelectList(db.DISTRITO, "Co_Distrito", "No_Distrito");
            ViewBag.Co_Expediente = new SelectList(db.EXPEDIENTE, "Co_Expediente", "Co_Expediente");
            return View();
        }

        //
        // POST: /Prot_Jurada_Domicilio/Create

        public ActionResult InsertarPro(PROT_JURADA_DOMICILIO prot_jurada_domicilio)
        {
            //if (ModelState.IsValid)
            //{
            db.PROT_JURADA_DOMICILIO.Add(prot_jurada_domicilio);
            db.SaveChanges();
            return Json(new
            {
                success = true,
                prot_jurada_domicilio.Co_Protocolo,
            });
            //}
            //else
            //{
            //    return Json(new { success = false, error = GenerarMsg(ModelState) });
            //}
        }

        public ActionResult ActualizarPro(PROT_JURADA_DOMICILIO prot_jurada_domicilio)
        {
            if (ModelState.IsValid)
            {
                db.Entry(prot_jurada_domicilio).State = EntityState.Modified;
                db.SaveChanges();
                return Json(new
                {
                    success = true,
                    prot_jurada_domicilio.Co_Protocolo,
                });
            }
            else
            {
                return Json(new { success = false, error = GenerarMsg(ModelState) });
            }
        }

        private string GenerarMsg(ModelStateDictionary ModelState)
        {
            var strError = new System.Text.StringBuilder();

            foreach (var error in ModelState)
            {
                if (error.Value.Errors.Count != 0)
                {
                    strError.AppendLine(string.Format("{0}: {1} ,", error.Key, error.Value.Errors[0].ErrorMessage));
                }
            }

            return strError.ToString().Remove(strError.ToString().LastIndexOf(","), 1);
        }
        //
        // GET: /Prot_Jurada_Domicilio/Edit/5

        public ActionResult Edit(int id = 0)
        {
            PROT_JURADA_DOMICILIO prot_jurada_domicilio = db.PROT_JURADA_DOMICILIO.Find(id);
            if (prot_jurada_domicilio == null)
            {
                return HttpNotFound();
            }
            ViewBag.Co_Distrito = new SelectList(db.DISTRITO, "Co_Distrito", "No_Distrito", prot_jurada_domicilio.Co_Distrito);
            ViewBag.Co_Expediente = new SelectList(db.EXPEDIENTE, "Co_Expediente", "Co_Expediente", prot_jurada_domicilio.Co_Expediente);
            return View(prot_jurada_domicilio);
        }

        //
        // POST: /Prot_Jurada_Domicilio/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(PROT_JURADA_DOMICILIO prot_jurada_domicilio)
        {
            if (ModelState.IsValid)
            {
                db.Entry(prot_jurada_domicilio).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Co_Distrito = new SelectList(db.DISTRITO, "Co_Distrito", "No_Distrito", prot_jurada_domicilio.Co_Distrito);
            ViewBag.Co_Expediente = new SelectList(db.EXPEDIENTE, "Co_Expediente", "Co_Expediente", prot_jurada_domicilio.Co_Expediente);
            return View(prot_jurada_domicilio);
        }

        //
        // GET: /Prot_Jurada_Domicilio/Delete/5

        public ActionResult Delete(int id = 0)
        {
            PROT_JURADA_DOMICILIO prot_jurada_domicilio = db.PROT_JURADA_DOMICILIO.Find(id);
            if (prot_jurada_domicilio == null)
            {
                return HttpNotFound();
            }
            return View(prot_jurada_domicilio);
        }

        //
        // POST: /Prot_Jurada_Domicilio/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            PROT_JURADA_DOMICILIO prot_jurada_domicilio = db.PROT_JURADA_DOMICILIO.Find(id);
            db.PROT_JURADA_DOMICILIO.Remove(prot_jurada_domicilio);
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