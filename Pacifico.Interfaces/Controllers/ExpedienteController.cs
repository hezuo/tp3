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

        public ActionResult Create(int id = 0)
        {
            int intDistrito = 0;
            int idAsegurado = 0;
            int idbeneficiario = 0;
            EXPEDIENTE expediente = null;
            if (id > 0)
            {
                expediente = LNExpediente.getOne(id);
                intDistrito = expediente.PROT_JURADA_DOMICILIO.First().Co_Distrito;
                idAsegurado = expediente.ASEGURADO.Co_Asegurado;
                idbeneficiario = expediente.BENEFICIARIO.Co_Beneficiario;
            }


            ViewBag.titulo = "Nuevo Expediente";
            var asegurados = db.ASEGURADO
                .ToList()
                .Select(s => new
                {
                    Co_Asegurado = s.Co_Asegurado,
                    Nu_DocumentoIdentidad = string.Format("{0} {1}", s.No_Asegurado, s.No_ApePaterno)
                });


            ViewBag.Co_Asegurado = new SelectList(asegurados, "Co_Asegurado", "Nu_DocumentoIdentidad", idAsegurado);


            var beneficiario = db.BENEFICIARIO
                .ToList()
                .Select(s => new
                {
                    Co_Beneficiario = s.Co_Beneficiario,
                    Nu_DocIdentidad = string.Format("{0} {1}", s.No_Beneficiario, s.No_ApellidoPaterno)
                });
            ViewBag.Co_Beneficiario = new SelectList(beneficiario, "Co_Beneficiario", "Nu_DocIdentidad", idbeneficiario);

            ViewBag.Co_FormaPago = new SelectList(db.FORMA_PAGO, "Co_FormaPago", "No_FormaPago", 1);


            var distrito = db.DISTRITO
             .ToList()
             .Select(s => new
             {
                 Co_Distrito = s.Co_Distrito,
                 No_Distrito = s.No_Distrito
             });

            ViewBag.Co_Distrito = new SelectList(distrito, "Co_Distrito", "No_Distrito", intDistrito);


            return View(expediente);
        }

        //
        // POST: /Expediente/Create


        public ActionResult InsertarExpediente(EXPEDIENTE expediente)
        {
            if (ModelState.IsValid)
            {
                db.EXPEDIENTE.Add(expediente);
                db.SaveChanges();
                return Json(new
                {
                    success = true,
                    expediente.Co_Expediente,
                    expediente.Co_Asegurado,
                    expediente.Co_Beneficiario,
                });
            }
            else
            {
                return Json(new { success = false, error = GenerarMsg(ModelState) });
            }
        }

        public ActionResult EditarExpediente(EXPEDIENTE expediente)
        {
            if (ModelState.IsValid)
            {
                db.Entry(expediente).State = EntityState.Modified;
                db.SaveChanges();
                return Json(new
                {
                    success = true,
                    expediente.Co_Expediente,
                    expediente.Co_Asegurado,
                    expediente.Co_Beneficiario,
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