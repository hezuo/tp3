using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Pacifico.Business;
using Pacifico.DataAccess;

namespace Pacifico.Interfaces.Controllers
{
    public class LiquidacionVehicularController : Controller
    {
        LiquidacionVehicularLogica LiquidacionVehicularLogicaBL = new LiquidacionVehicularLogica();
        private PACIFICOEntities db = new PACIFICOEntities();

        public ActionResult Index(string codigo, string estado)
        {

            if (!string.IsNullOrEmpty(codigo) && !string.IsNullOrEmpty(estado))
            {
                if (estado.ToLower().Equals("creado"))
                {
                    ViewData["Ok"] = "Liquidacion Vehicular creada satisfactoriamente con Código " + codigo;
                }

            }

            var Listado = LiquidacionVehicularLogicaBL.listarLiquidacion();
            return View(Listado);
        }

        public ActionResult Create()
        {
            var SiniestroList = db.SINIESTRO.ToList();
            ViewData["coSiniestroList"] = new SelectList(SiniestroList, "Co_Siniestro", "Nu_Siniestro");
            return View();
        }

        public ActionResult Edit(int id)
        {
            LIQUIDACION_VEHICULAR liquidacionVehicular = db.LIQUIDACION_VEHICULAR.Find(id);

            if (liquidacionVehicular == null)
            {
                return HttpNotFound();
            }

            return View(liquidacionVehicular);
        }

        [HttpPost]
        public ActionResult Create(LIQUIDACION_VEHICULAR liquidacion_vehicular)
        {
            liquidacion_vehicular.Tx_Estado = "Registrado";
            liquidacion_vehicular.Co_Usuario = 1;
            liquidacion_vehicular.Fe_Registro = DateTime.Now;
            LiquidacionVehicularLogicaBL.AgregarLiquidacion(liquidacion_vehicular);

            return RedirectToAction("Index", new { codigo = liquidacion_vehicular.Co_LiquidacionVehicular.ToString(), estado = "creado" });
        }

        [HttpPost]
        public ActionResult GetDatosSiniestro(int selectedValue)
        {
            var Lista = from S in db.SINIESTRO
                        where S.Co_Siniestro == selectedValue
                        select new
                        {
                            Poliza = S.POLIZA_VEHICULAR.Nu_PolizaVehicular,
                            Placa = S.POLIZA_VEHICULAR.VEHICULO.Nu_Placa,
                            Marca = S.POLIZA_VEHICULAR.VEHICULO.MODELO_VEHICULO.MARCA_VEHICULO.No_MarcaVehiculo,
                            MontoCober = S.POLIZA_VEHICULAR.Ss_MontoCobertura,
                            Nombre = S.POLIZA_VEHICULAR.ASEGURADO.No_Asegurado,
                            ApePat = S.POLIZA_VEHICULAR.ASEGURADO.No_ApePaterno,
                            ApeMat = S.POLIZA_VEHICULAR.ASEGURADO.No_ApeMaterno
                        };
            return Json(new { datosSiniestro = Lista });
        }
    }
}