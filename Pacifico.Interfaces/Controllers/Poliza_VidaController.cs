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
    public class Poliza_VidaController : Controller
    {
        private PACIFICOEntities db = new PACIFICOEntities();

        //
        // GET: /Poliza_Vida/

        public ActionResult Index()
        {
            var poliza_vida = db.POLIZA_VIDA.Include(p => p.FORMA_PAGO).Include(p => p.EXPEDIENTE);
            return View(poliza_vida.ToList());
        }

        //
        // GET: /Poliza_Vida/Details/5

        public ActionResult Details(int id = 0)
        {
            POLIZA_VIDA poliza_vida = db.POLIZA_VIDA.Find(id);
            if (poliza_vida == null)
            {
                return HttpNotFound();
            }
            return View(poliza_vida);
        }

        //
        // GET: /Poliza_Vida/Create

        public ActionResult Create()
        {
            ViewBag.Co_FormaPago = new SelectList(db.FORMA_PAGO, "Co_FormaPago", "No_FormaPago");
            ViewBag.Co_Expediente = new SelectList(db.EXPEDIENTE, "Co_Expediente", "Co_Expediente");
            return View();
        }

        //
        // POST: /Poliza_Vida/Create


        public ActionResult InsertarPoliza(POLIZA_VIDA poliza_vida)
        {
            if (ModelState.IsValid)
            {

                poliza_vida.EXPEDIENTE = db.EXPEDIENTE.Find(poliza_vida.Co_Expediente);
                poliza_vida.FORMA_PAGO = db.FORMA_PAGO.Find(poliza_vida.Co_FormaPago);
                poliza_vida.Nu_DocIndentidadBeneficiario = "";
                poliza_vida.Nu_DocIndentidadCliente = "";
                poliza_vida.Fe_Creacion = DateTime.Now;
                poliza_vida.Tx_RutaFoto = "";
                poliza_vida.Fl_Estado = "Activo";
                db.POLIZA_VIDA.Add(poliza_vida);
                db.SaveChanges();
                return Json(new
                {
                    success = true,
                    poliza_vida.Co_PolizaVida
                });
            }
            else
            {
                return Json(new { success = false, error = GenerarMsg(ModelState) });
            }

        }


        public ActionResult ActualizarPoliza(POLIZA_VIDA poliza_vida)
        {
            if (ModelState.IsValid)
            {

                poliza_vida.EXPEDIENTE = db.EXPEDIENTE.Find(poliza_vida.Co_Expediente);
                poliza_vida.FORMA_PAGO = db.FORMA_PAGO.Find(poliza_vida.Co_FormaPago);
                poliza_vida.Nu_DocIndentidadBeneficiario = "";
                poliza_vida.Nu_DocIndentidadCliente = "";
                poliza_vida.Fe_Creacion = DateTime.Now;
                poliza_vida.Tx_RutaFoto = "";
                poliza_vida.Fl_Estado = "Activo";

                db.Entry(poliza_vida).State = EntityState.Modified;
                db.SaveChanges();
                return Json(new
                {
                    success = true,
                    poliza_vida.Co_PolizaVida
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
        // GET: /Poliza_Vida/Edit/5

        public ActionResult Edit(int id = 0)
        {
            POLIZA_VIDA poliza_vida = db.POLIZA_VIDA.Find(id);
            if (poliza_vida == null)
            {
                return HttpNotFound();
            }
            ViewBag.Co_FormaPago = new SelectList(db.FORMA_PAGO, "Co_FormaPago", "No_FormaPago", poliza_vida.Co_FormaPago);
            ViewBag.Co_Expediente = new SelectList(db.EXPEDIENTE, "Co_Expediente", "Co_Expediente", poliza_vida.Co_Expediente);
            return View(poliza_vida);
        }

        //
        // POST: /Poliza_Vida/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(POLIZA_VIDA poliza_vida)
        {
            if (ModelState.IsValid)
            {
                db.Entry(poliza_vida).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Co_FormaPago = new SelectList(db.FORMA_PAGO, "Co_FormaPago", "No_FormaPago", poliza_vida.Co_FormaPago);
            ViewBag.Co_Expediente = new SelectList(db.EXPEDIENTE, "Co_Expediente", "Co_Expediente", poliza_vida.Co_Expediente);
            return View(poliza_vida);
        }

        //
        // GET: /Poliza_Vida/Delete/5

        public ActionResult Delete(int id = 0)
        {
            POLIZA_VIDA poliza_vida = db.POLIZA_VIDA.Find(id);
            if (poliza_vida == null)
            {
                return HttpNotFound();
            }
            return View(poliza_vida);
        }

        //
        // POST: /Poliza_Vida/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            POLIZA_VIDA poliza_vida = db.POLIZA_VIDA.Find(id);
            db.POLIZA_VIDA.Remove(poliza_vida);
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