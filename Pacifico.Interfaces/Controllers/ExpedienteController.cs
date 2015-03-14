using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Pacifico.Business;
using Pacifico.DataAccess;

namespace Pacifico.Interfaces.Controllers
{
    public class ExpedienteController : Controller
    {
        private PACIFICOEntities db = new PACIFICOEntities();
        //

        //
        // GET: /Expediente/

        public ActionResult Index()
        {
            var expediente = LNExpediente.getAll();
            return View(expediente.ToList());

        }

        //
        // GET: /Expediente/Details/5

        public ActionResult Details(int id = 0)
        {
            EXPEDIENTE expediente = LNExpediente.getOne(id);
            if (expediente == null)
            {
                return HttpNotFound();
            }
            return View(expediente);
        }

        //
        // GET: /Expediente/Create

        public ActionResult Create()
        {
            ViewBag.Co_Asegurado = new SelectList(db.ASEGURADO, "Co_Asegurado", "Nu_DocumentoIdentidad");
            ViewBag.Co_Beneficiario = new SelectList(db.BENEFICIARIO, "Co_Beneficiario", "Nu_DocIdentidad");
            return View();
        }

        //
        // POST: /Expediente/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(EXPEDIENTE expediente)
        {
            if (ModelState.IsValid)
            {
                db.EXPEDIENTE.Add(expediente);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Co_Asegurado = new SelectList(db.ASEGURADO, "Co_Asegurado", "Nu_DocumentoIdentidad", expediente.Co_Asegurado);
            ViewBag.Co_Beneficiario = new SelectList(db.BENEFICIARIO, "Co_Beneficiario", "Nu_DocIdentidad", expediente.Co_Beneficiario);
            return View(expediente);
        }

        //
        // GET: /Expediente/Edit/5

        public ActionResult Edit(int id = 0)
        {
            EXPEDIENTE expediente = db.EXPEDIENTE.Find(id);
            if (expediente == null)
            {
                return HttpNotFound();
            }
            ViewBag.Co_Asegurado = new SelectList(db.ASEGURADO, "Co_Asegurado", "Nu_DocumentoIdentidad", expediente.Co_Asegurado);
            ViewBag.Co_Beneficiario = new SelectList(db.BENEFICIARIO, "Co_Beneficiario", "Nu_DocIdentidad", expediente.Co_Beneficiario);
            return View(expediente);
        }

        //
        // POST: /Expediente/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(EXPEDIENTE expediente)
        {
            if (ModelState.IsValid)
            {
                db.Entry(expediente).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Co_Asegurado = new SelectList(db.ASEGURADO, "Co_Asegurado", "Nu_DocumentoIdentidad", expediente.Co_Asegurado);
            ViewBag.Co_Beneficiario = new SelectList(db.BENEFICIARIO, "Co_Beneficiario", "Nu_DocIdentidad", expediente.Co_Beneficiario);
            return View(expediente);
        }

        //
        // GET: /Expediente/Delete/5

        public ActionResult Delete(int id = 0)
        {
            EXPEDIENTE expediente = db.EXPEDIENTE.Find(id);
            if (expediente == null)
            {
                return HttpNotFound();
            }
            return View(expediente);
        }

        //
        // POST: /Expediente/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            EXPEDIENTE expediente = db.EXPEDIENTE.Find(id);
            db.EXPEDIENTE.Remove(expediente);
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