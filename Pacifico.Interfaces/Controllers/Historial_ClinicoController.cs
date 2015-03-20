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
    public class Historial_ClinicoController : Controller
    {
        private PACIFICOEntities db = new PACIFICOEntities();

        //
        // GET: /Historial_Clinico/

        public ActionResult Index()
        {
            var historial_clinico = db.HISTORIAL_CLINICO.Include(h => h.EXPEDIENTE);
            return View(historial_clinico.ToList());
        }

        //
        // GET: /Historial_Clinico/Details/5

        public ActionResult Details(int id = 0)
        {
            HISTORIAL_CLINICO historial_clinico = db.HISTORIAL_CLINICO.Find(id);
            if (historial_clinico == null)
            {
                return HttpNotFound();
            }
            return View(historial_clinico);
        }

        //
        // GET: /Historial_Clinico/Create

        public ActionResult Create()
        {
            ViewBag.Co_Expediente = new SelectList(db.EXPEDIENTE, "Co_Expediente", "Co_Expediente");
            return View();
        }

        //
        // POST: /Historial_Clinico/Create


        public ActionResult InsertarHistoria(HISTORIAL_CLINICO historial_clinico)
        {
            //if (ModelState.IsValid)
            //{

            db.HISTORIAL_CLINICO.Add(historial_clinico);
            db.SaveChanges();
            return Json(new
            {
                success = true,
                historial_clinico.Co_HistorialCli,

            });
            //}
            //else
            //{
            //    return Json(new { success = false, error = GenerarMsg(ModelState) });
            //}
        }

        public ActionResult ActualizarHistoria(HISTORIAL_CLINICO historial_clinico)
        {
            if (ModelState.IsValid)
            {
                db.Entry(historial_clinico).State = EntityState.Modified;
                db.SaveChanges();
                return Json(new
                {
                    success = true,
                    historial_clinico.Co_HistorialCli,

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
        // GET: /Historial_Clinico/Edit/5

        public ActionResult Edit(int id = 0)
        {
            HISTORIAL_CLINICO historial_clinico = db.HISTORIAL_CLINICO.Find(id);
            if (historial_clinico == null)
            {
                return HttpNotFound();
            }
            ViewBag.Co_Expediente = new SelectList(db.EXPEDIENTE, "Co_Expediente", "Co_Expediente", historial_clinico.Co_Expediente);
            return View(historial_clinico);
        }

        //
        // POST: /Historial_Clinico/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(HISTORIAL_CLINICO historial_clinico)
        {
            if (ModelState.IsValid)
            {
                db.Entry(historial_clinico).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Co_Expediente = new SelectList(db.EXPEDIENTE, "Co_Expediente", "Co_Expediente", historial_clinico.Co_Expediente);
            return View(historial_clinico);
        }

        //
        // GET: /Historial_Clinico/Delete/5

        public ActionResult Delete(int id = 0)
        {
            HISTORIAL_CLINICO historial_clinico = db.HISTORIAL_CLINICO.Find(id);
            if (historial_clinico == null)
            {
                return HttpNotFound();
            }
            return View(historial_clinico);
        }

        //
        // POST: /Historial_Clinico/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            HISTORIAL_CLINICO historial_clinico = db.HISTORIAL_CLINICO.Find(id);
            db.HISTORIAL_CLINICO.Remove(historial_clinico);
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