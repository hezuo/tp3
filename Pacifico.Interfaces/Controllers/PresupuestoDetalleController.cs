using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Pacifico.Business;
using Pacifico.DataAccess;
using PagedList;
using PagedList.Mvc;

using System.Data;
using System.Data.Entity;
using System.IO;


namespace Pacifico.Interfaces.Controllers
{
    public class PresupuestoDetalleController : Controller
    {
        private PACIFICOEntities db = new PACIFICOEntities();

        SiniestroLogica siniestroBL = new SiniestroLogica();
        FormaPagoLogica formaPagoBL = new FormaPagoLogica();
        AseguradoLogica aseguradoBL = new AseguradoLogica();
        VehiculoLogica vehiculoBL = new VehiculoLogica();
        ArticuloLogica articuloBL = new ArticuloLogica();
        PresupuestoLogica presupuestoBL = new PresupuestoLogica();
        PresupuestoDetalleLogica pDetalleBL = new PresupuestoDetalleLogica();

        public ActionResult Index(string codigo, string estado)
        {
            if (!string.IsNullOrEmpty(codigo) && !string.IsNullOrEmpty(estado))
            {
                if (estado.ToLower().Equals("creado"))
                {
                    ViewData["Ok"] = "Presupuesto creado satisfactoriamente con Código " + codigo;
                }
                else if (estado.ToLower().Equals("editado"))
                {
                    ViewData["Ok"] = "Presupuesto con código " + codigo + " ha sido modificado exitosamente.";
                }

            }

            List<PRESUPUESTO> pagedModel = this.presupuestoBL.listarPresupuesto();
            return View(pagedModel);
        }

        public ActionResult Consultar(string codigo, string estado)
        {
            if (!string.IsNullOrEmpty(codigo) && !string.IsNullOrEmpty(estado))
            {
                if (estado.ToLower().Equals("creado"))
                {
                    ViewData["Ok"] = "Presupuesto creado satisfactoriamente con Código " + codigo;
                }
                else if (estado.ToLower().Equals("editado"))
                {
                    ViewData["Ok"] = "Presupuesto con código " + codigo + " ha sido modificado exitosamente.";
                }
                else
                {
                    ViewData["Ok"] = estado;
                }

            }

            List<PRESUPUESTO> pagedModel = this.presupuestoBL.listarPresupuestoParaConsultar();
            return View(pagedModel);
        }



        public ActionResult Create()
        {
            List<SINIESTRO> siniestroList = siniestroBL.listarSiniestros();
            ViewData["coSiniestroList"] = new SelectList(siniestroList, "Co_Siniestro", "Nu_Siniestro");

            List<FORMA_PAGO> formaPagoList = formaPagoBL.listarFormaPago();
            ViewData["Co_FormaPagoList"] = new SelectList(formaPagoList, "Co_FormaPago", "No_FormaPago");


            List<ARTICULO> articulos = articuloBL.listarArticulo();
            ViewData["dsArticulo"] = new SelectList(articulos, "Co_Articulo", "Nu_Articulo");
            return View();
        }

        [HttpPost]
        public ActionResult Create(PRESUPUESTO presupuesto, FormCollection collection, int co_Siniestro)
        {
            if (ModelState.IsValid)
            {
                presupuesto.Nu_Presupuesto = "PRE000" + presupuesto.Co_Presupuesto;
                presupuesto.Fl_Estado = 2;
                presupuesto.Fe_Presupuesto = DateTime.Now;
                db.PRESUPUESTO.Add(presupuesto);
                db.SaveChanges();
                String[] articulos = collection.GetValues("articulos[]");
                String[] cantidades = collection.GetValues("cant_articulos[]");
                String[] precios = collection.GetValues("precios_articulos[]");

                int indexCantidad = 0;
                foreach (String articuloId in articulos)
                {
                    int codArticulo = Int32.Parse(articuloId);
                    ARTICULO articulo = db.ARTICULO.Find(codArticulo);
                    PRESUPUESTO_DETALLE nuevoPresupuestoDetalle = new PRESUPUESTO_DETALLE();
                    nuevoPresupuestoDetalle.Co_Presupuesto = presupuesto.Co_Presupuesto;
                    nuevoPresupuestoDetalle.Co_Articulo = codArticulo;
                    nuevoPresupuestoDetalle.Qt_Cantidad = Int32.Parse(cantidades[indexCantidad]);
                    nuevoPresupuestoDetalle.Ss_PrecioDetalle = Decimal.Parse(precios[indexCantidad]);
                    db.PRESUPUESTO_DETALLE.Add(nuevoPresupuestoDetalle);
                    db.SaveChanges();
                    indexCantidad++;
                }


                return RedirectToAction("Index", new { codigo = presupuesto.Co_Presupuesto.ToString(), estado = "creado" });
            }

            ViewBag.Co_Siniestro = new SelectList(db.SINIESTRO, "Co_Siniestro", "Nu_Siniestro", presupuesto.Co_Presupuesto);
            return View(presupuesto);
        }

        public ActionResult Evaluar(int codPresupuesto)
        {
            PRESUPUESTO presupuesto = db.PRESUPUESTO.Find(codPresupuesto);
            List<PRESUPUESTO_DETALLE> articulos = (List<PRESUPUESTO_DETALLE>)presupuesto.PRESUPUESTO_DETALLE.ToList();
            decimal? total = 0;
            foreach (PRESUPUESTO_DETALLE articulo in articulos)
            {
                total += articulo.Qt_Cantidad * articulo.Ss_PrecioDetalle;
            }

            decimal? montoCobertura = presupuesto.SINIESTRO.POLIZA_VEHICULAR.Ss_MontoCobertura;
            decimal? montoCoberturaLimite = (montoCobertura * 0.75m);
            if (total > montoCoberturaLimite)
            {
                return RedirectToAction("Consultar", new { codigo = presupuesto.Co_Presupuesto.ToString(), estado = "Presupuesto excedido " });
            }

            return View(presupuesto);
        }
        public ActionResult Rechazar(int codPresupuesto)
        {
            PRESUPUESTO presupuesto = db.PRESUPUESTO.Find(codPresupuesto);
            presupuesto.Fl_Estado = 3;
            db.Entry(presupuesto).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Consultar", new { codigo = presupuesto.Co_Presupuesto.ToString(), estado = "Presupuesto rechazado" });
        }
        [HttpPost]
        public ActionResult Evaluar(PRESUPUESTO presupuesto, FormCollection collection)
        {

            if (ModelState.IsValid)
            {
                presupuesto.Fl_Estado = 4;
                db.Entry(presupuesto).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Consultar", new { codigo = presupuesto.Co_Presupuesto.ToString(), estado = "Presupuesto con código " + presupuesto.Co_Presupuesto + " ha sido aprobado" });
            }


            return View(presupuesto);
        }
        [HttpPost]
        public ActionResult getDatosSiniestro(int codSiniestro)
        {
            SINIESTRO siniestro = db.SINIESTRO.Find(codSiniestro);
            if (siniestro == null)
            {
                return HttpNotFound();
            }

            return Json(new { placa = siniestro.POLIZA_VEHICULAR.VEHICULO.Nu_Placa, poliza = siniestro.POLIZA_VEHICULAR.Co_PolizaVehicular, asegurado = siniestro.POLIZA_VEHICULAR.ASEGURADO.No_ApePaterno + " " + siniestro.POLIZA_VEHICULAR.ASEGURADO.No_ApeMaterno });
        }

        [HttpPost]
        public ActionResult getDatosArticulo(int codArticulo)
        {
            ARTICULO articulo = db.ARTICULO.Find(codArticulo);
            if (articulo == null)
            {
                return HttpNotFound();
            }

            return Json(new { precio = articulo.Ss_PrecioLista, Co_Articulo = articulo.Co_Articulo });
        }
        public ActionResult RegistrarPresupuesto()
        {
            return View();
        }

        public ActionResult ListarSiniestros()
        {
            return View(siniestroBL.listarSiniestros());
        }

        public ActionResult ListarSieniestrosVehiculares(int codigoSiniestro)
        {
            return View(siniestroBL.listarSiniestroVehicular(codigoSiniestro));

        }
        public ActionResult ListarFormaPago()
        {
            return View(formaPagoBL.listarFormaPago());
        }

        public ActionResult ListaArticulos()
        {
            return View(articuloBL.listarArticulo());
        }

        public ActionResult DPresupuesto(int id)
        {
            PRESUPUESTO_DETALLE model = pDetalleBL.ObtenerPresupuestoDetalle(id);

            ViewData["CoArticulo"] = model.Co_Articulo;
            ViewData["QtCantidad"] = model.Qt_Cantidad;
            ViewData["Ss_PrecioDetalle"] = model.Ss_PrecioDetalle;
            return View(model);
        }

        public ActionResult CrearPresupuesto(int CoArticulo, int QtCantidad, decimal SsPrecioDetalle)
        {
            List<SINIESTRO> siniestros = siniestroBL.listarSiniestros();
            ViewData["dsSiniestro"] = new SelectList(siniestros, "Co_Siniestro", "Nu_Siniestro");

            List<ARTICULO> articulos = articuloBL.listarArticulo();
            ViewData["dsArticulo"] = new SelectList(articulos, "Co_Articulo", "Nu_Articulo");

            ViewData["Qt_Cantidad"] = QtCantidad;
            ViewData["Ss_PrecioDetalle"] = SsPrecioDetalle;
            return View();
        }





    }
}