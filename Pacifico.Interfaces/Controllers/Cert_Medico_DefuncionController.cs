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
    public class Cert_Medico_DefuncionController : Controller
    {
        private PACIFICOEntities db = new PACIFICOEntities();

        //
        // GET: /Cert_Medico_Defuncion/

        public ActionResult Index()
        {
            var cert_medico_defuncion = db.CERT_MEDICO_DEFUNCION.Include(c => c.DISTRITO).Include(c => c.EXPEDIENTE);
            return View(cert_medico_defuncion.ToList());
        }

        //
        // GET: /Cert_Medico_Defuncion/Details/5

        public ActionResult Details(int id = 0)
        {
            CERT_MEDICO_DEFUNCION cert_medico_defuncion = db.CERT_MEDICO_DEFUNCION.Find(id);
            if (cert_medico_defuncion == null)
            {
                return HttpNotFound();
            }
            return View(cert_medico_defuncion);
        }

        //
        // GET: /Cert_Medico_Defuncion/Create

        public ActionResult Create()
        {
            ViewBag.Co_Distrito = new SelectList(db.DISTRITO, "Co_Distrito", "No_Distrito");
            ViewBag.Co_Expediente = new SelectList(db.EXPEDIENTE, "Co_Expediente", "Co_Expediente");
            return View();
        }

        //
        // POST: /Cert_Medico_Defuncion/Create

        public ActionResult CreateCerMe(CERT_MEDICO_DEFUNCION cert_medico_defuncion)
        {
            //if (ModelState.IsValid)
            //{
            db.CERT_MEDICO_DEFUNCION.Add(cert_medico_defuncion);
            db.SaveChanges();
            return Json(new
            {
                success = true,
                cert_medico_defuncion.Co_Folio
            });
            //}
            //else
            //{
            //    return Json(new { success = false, error = GenerarMsg(ModelState) });
            //}
            //ViewBag.Co_Distrito = new SelectList(db.DISTRITO, "Co_Distrito", "No_Distrito", cert_medico_defuncion.Co_Distrito);
            //ViewBag.Co_Expediente = new SelectList(db.EXPEDIENTE, "Co_Expediente", "Co_Expediente", cert_medico_defuncion.Co_Expediente);
            //return View(cert_medico_defuncion);
        }

        public ActionResult ActualizarCerMe(CERT_MEDICO_DEFUNCION cert_medico_defuncion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cert_medico_defuncion).State = EntityState.Modified;
                db.SaveChanges();
                return Json(new
                {
                    success = true,
                    cert_medico_defuncion.Co_Folio
                });
            }
            else
            {
                return Json(new { success = false, error = GenerarMsg(ModelState) });
            }
            //ViewBag.Co_Distrito = new SelectList(db.DISTRITO, "Co_Distrito", "No_Distrito", cert_medico_defuncion.Co_Distrito);
            //ViewBag.Co_Expediente = new SelectList(db.EXPEDIENTE, "Co_Expediente", "Co_Expediente", cert_medico_defuncion.Co_Expediente);
            //return View(cert_medico_defuncion);
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
        // GET: /Cert_Medico_Defuncion/Edit/5

        public ActionResult Edit(int id = 0)
        {
            CERT_MEDICO_DEFUNCION cert_medico_defuncion = db.CERT_MEDICO_DEFUNCION.Find(id);
            if (cert_medico_defuncion == null)
            {
                return HttpNotFound();
            }
            ViewBag.Co_Distrito = new SelectList(db.DISTRITO, "Co_Distrito", "No_Distrito", cert_medico_defuncion.Co_Distrito);
            ViewBag.Co_Expediente = new SelectList(db.EXPEDIENTE, "Co_Expediente", "Co_Expediente", cert_medico_defuncion.Co_Expediente);
            return View(cert_medico_defuncion);
        }

        //
        // POST: /Cert_Medico_Defuncion/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(CERT_MEDICO_DEFUNCION cert_medico_defuncion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cert_medico_defuncion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Co_Distrito = new SelectList(db.DISTRITO, "Co_Distrito", "No_Distrito", cert_medico_defuncion.Co_Distrito);
            ViewBag.Co_Expediente = new SelectList(db.EXPEDIENTE, "Co_Expediente", "Co_Expediente", cert_medico_defuncion.Co_Expediente);
            return View(cert_medico_defuncion);
        }

        //
        // GET: /Cert_Medico_Defuncion/Delete/5

        public ActionResult Delete(int id = 0)
        {
            CERT_MEDICO_DEFUNCION cert_medico_defuncion = db.CERT_MEDICO_DEFUNCION.Find(id);
            if (cert_medico_defuncion == null)
            {
                return HttpNotFound();
            }
            return View(cert_medico_defuncion);
        }

        //
        // POST: /Cert_Medico_Defuncion/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CERT_MEDICO_DEFUNCION cert_medico_defuncion = db.CERT_MEDICO_DEFUNCION.Find(id);
            db.CERT_MEDICO_DEFUNCION.Remove(cert_medico_defuncion);
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