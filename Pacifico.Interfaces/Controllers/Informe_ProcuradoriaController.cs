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
    public class Informe_ProcuradoriaController : Controller
    {
        private PACIFICOEntities db = new PACIFICOEntities();

        //
        // GET: /Informe_Procuradoria/

        public ActionResult Index()
        {
            var informe_procuradoria = db.INFORME_PROCURADORIA.Include(i => i.EXPEDIENTE);
            ViewBag.css = "color: red;display: none;";
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

        public ActionResult Create(int id = 0, int ac = 0)
        {
            INFORME_PROCURADORIA informe_procuradoria = null;

            EXPEDIENTE Expediente = LNExpediente.getOne(id);

            if (ac == 2)
            {
                ViewBag.csshide = "display:none;";
                ViewBag.valueboton = "";
                ViewBag.titulo = "Ver Informe Procuradoria";
            }
            if (ac == 1)
            {
                ViewBag.csshide = "display: inline-block";
                ViewBag.valueboton = "Actualizar Informe";
                ViewBag.titulo = "Actualizar Informe Procuradoria";
            }
            if (id == 0)
            {
                ViewBag.csshide = "display: inline-block";
                ViewBag.valueboton = "Grabar Informe";
                ViewBag.titulo = "Nuevo Informe Procuradoria";

                var query =
                    from c in db.EXPEDIENTE
                    where !(from o in db.INFORME_PROCURADORIA
                            select o.Co_Expediente)
                           .Contains(c.Co_Expediente)
                    select c;
                if (query.Count() == 0)
                {
                    var informe_procuradoria2 = db.INFORME_PROCURADORIA.Include(i => i.EXPEDIENTE);
                    ViewBag.css = "color: red;display: inline-block;";
                    return View("Index", informe_procuradoria2.ToList());
                }

                Expediente = query.First();



                id = Expediente.Co_Expediente;



            }


            if (Expediente != null)
            {
                informe_procuradoria = new INFORME_PROCURADORIA();
                if (Expediente.INFORME_PROCURADORIA.Count() > 0)
                {
                    informe_procuradoria = Expediente.INFORME_PROCURADORIA.First();
                    informe_procuradoria.EXPEDIENTE = Expediente;
                    informe_procuradoria.Fl_Aprobacion = true;
                }
                else
                {
                    informe_procuradoria.EXPEDIENTE = Expediente;
                    informe_procuradoria.Fe_Emision = DateTime.Now;
                    informe_procuradoria.Fl_Aprobacion = true;
                }

            }
            ViewBag.Co_Expediente = new SelectList(LNExpediente.getAll(), "Co_Expediente", "Co_Expediente", id);

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
                String Mensaje = "";
                if (informe_procuradoria.Co_NumInfProc > 0)
                {
                    Mensaje = "Informe Procuradoria Actualizado";
                    LNINFORME_PROCURADORIA.Edit(informe_procuradoria);
                }
                else
                {
                    Mensaje = "Informe Procuradoria Registrado";
                    LNINFORME_PROCURADORIA.Add(informe_procuradoria);
                }


                return Content("<script language='javascript' type='text/javascript'>alert('" + Mensaje + "');window.location.assign('../../Informe_Procuradoria')</script>");
            }

            ViewBag.Co_Expediente = new SelectList(db.EXPEDIENTE, "Co_Expediente", "No_Beneficiario", informe_procuradoria.Co_Expediente);
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
            ViewBag.Co_Expediente = new SelectList(db.EXPEDIENTE, "Co_Expediente", "No_Beneficiario", informe_procuradoria.Co_Expediente);
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
            ViewBag.Co_Expediente = new SelectList(db.EXPEDIENTE, "Co_Expediente", "No_Beneficiario", informe_procuradoria.Co_Expediente);
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