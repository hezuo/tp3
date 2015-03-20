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
    public class Carta_NotarialController : Controller
    {
        private PACIFICOEntities db = new PACIFICOEntities();

        //
        // GET: /Carta_Notarial/

        public ActionResult Index()
        {
            var carta_notarial = db.CARTA_NOTARIAL.Include(c => c.INFORME_PROCURADORIA);
            ViewBag.css = "color: red;display: none;";
            return View(carta_notarial.ToList());
        }

        //
        // GET: /Carta_Notarial/Details/5

        public ActionResult Details(int id = 0)
        {
            CARTA_NOTARIAL carta_notarial = db.CARTA_NOTARIAL.Find(id);
            if (carta_notarial == null)
            {
                return HttpNotFound();
            }
            return View(carta_notarial);
        }

        //
        // GET: /Carta_Notarial/Create

        public ActionResult Create(int id = 0, int ac = 0)
        {
            CARTA_NOTARIAL carta_notarial = null;
            int idprocu = 0;
            EXPEDIENTE Expediente = LNExpediente.getOne(id);
            if (ac == 2)
            {
                ViewBag.csshide = "display:none;";
                ViewBag.valueboton = "";
                ViewBag.titulo = "Ver Carta Notarial";
            }
            if (ac == 1)
            {
                ViewBag.csshide = "display: inline-block";
                ViewBag.titulo = "Actualizar Carta Notarial";
                ViewBag.valueboton = "Actualizar Carta";
            }
            if (id == 0)
            {
                ViewBag.titulo = "Nueva Carta Notarial";
                ViewBag.csshide = "display: inline-block";
                ViewBag.valueboton = "Grabar Carta";


                var query =
                    from c in db.INFORME_PROCURADORIA
                    where !(from o in db.CARTA_NOTARIAL
                            select o.Co_NumInfProc)
                           .Contains(c.Co_NumInfProc)
                    select c;
                if (query.Count() == 0)
                {
                    var carta_notarial2 = db.CARTA_NOTARIAL.Include(i => i.INFORME_PROCURADORIA);
                    ViewBag.css = "color: red;display: inline-block;";
                    return View("Index", carta_notarial2.ToList());
                }

                Expediente = query.First().EXPEDIENTE;



                id = Expediente.Co_Expediente;
                idprocu = Expediente.INFORME_PROCURADORIA.First().Co_NumInfProc;


            }

            if (Expediente != null)
            {
                carta_notarial = new CARTA_NOTARIAL();

                if (Expediente.INFORME_PROCURADORIA.First().CARTA_NOTARIAL.Count() > 0)
                {
                    carta_notarial = Expediente.INFORME_PROCURADORIA.First().CARTA_NOTARIAL.First();
                    carta_notarial.INFORME_PROCURADORIA.EXPEDIENTE = Expediente;
                }
                else
                {
                    carta_notarial.INFORME_PROCURADORIA = Expediente.INFORME_PROCURADORIA.First();
                    carta_notarial.Fe_Emision = DateTime.Now;
                }

            }


            ViewBag.Co_Expediente = new SelectList(db.EXPEDIENTE, "Co_Expediente", "Co_Expediente", id);
            ViewBag.Co_NumInfProc = new SelectList(db.INFORME_PROCURADORIA, "Co_NumInfProc", "Co_NumInfProc", idprocu);
            return View(carta_notarial);
        }

        //
        // POST: /Carta_Notarial/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(CARTA_NOTARIAL carta_notarial)
        {
            String Mensaje = "";
            if (carta_notarial.Co_NumCartaNotarial > 0)
            {

                CARTA_NOTARIAL oCARTA_NOTARIAL = db.CARTA_NOTARIAL.Find(carta_notarial.Co_NumCartaNotarial);


                oCARTA_NOTARIAL.Tx_Descripción = carta_notarial.Tx_Descripción;
                oCARTA_NOTARIAL.Fe_Recepcion = carta_notarial.Fe_Recepcion;



                db.Entry(oCARTA_NOTARIAL).State = EntityState.Modified;
                db.SaveChanges();
                Mensaje = "Carta Notarial Actualizado";

            }
            else
            {
                carta_notarial.Fe_Emision = DateTime.Now;
                carta_notarial.Fe_Creación = DateTime.Now;
                db.CARTA_NOTARIAL.Add(carta_notarial);
                db.SaveChanges();
                Mensaje = "Carta Notarial Registrado";
            }
            //return RedirectToAction("Index");
            return Content("<script language='javascript' type='text/javascript'>alert('" + Mensaje + "');window.location.assign('../../Carta_Notarial')</script>");
        }

        //
        // GET: /Carta_Notarial/Edit/5

        public ActionResult Edit(int id = 0)
        {
            CARTA_NOTARIAL carta_notarial = db.CARTA_NOTARIAL.Find(id);
            if (carta_notarial == null)
            {
                return HttpNotFound();
            }
            ViewBag.Co_NumInfProc = new SelectList(db.INFORME_PROCURADORIA, "Co_NumInfProc", "Fl_TipoResultado", carta_notarial.Co_NumInfProc);
            return View(carta_notarial);
        }

        //
        // POST: /Carta_Notarial/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(CARTA_NOTARIAL carta_notarial)
        {
            if (ModelState.IsValid)
            {
                db.Entry(carta_notarial).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Co_NumInfProc = new SelectList(db.INFORME_PROCURADORIA, "Co_NumInfProc", "Fl_TipoResultado", carta_notarial.Co_NumInfProc);
            return View(carta_notarial);
        }

        //
        // GET: /Carta_Notarial/Delete/5

        public ActionResult Delete(int id = 0)
        {
            CARTA_NOTARIAL carta_notarial = db.CARTA_NOTARIAL.Find(id);
            if (carta_notarial == null)
            {
                return HttpNotFound();
            }
            return View(carta_notarial);
        }

        //
        // POST: /Carta_Notarial/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CARTA_NOTARIAL carta_notarial = db.CARTA_NOTARIAL.Find(id);
            db.CARTA_NOTARIAL.Remove(carta_notarial);
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