using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Pacifico.Business;
using Pacifico.DataAccess;
using PagedList;
using PagedList.Mvc;
using System.Globalization;

namespace Pacifico.Interfaces.Controllers
{
    public class EvaluacionPrestadoraController : Controller
    {

        PrestadoraLogica prestadoraBL = new PrestadoraLogica();
        EvaluacionPrestadoraLogica evaluacionPrestadoraBL = new EvaluacionPrestadoraLogica();

        public ActionResult Index(int codigoPrestadora, string criterioCreado, string criterioModificado, string criterioEliminado, string criterioNoEliminado, string evaluacionMenos, string evaluacionMas)
        {

            if (string.IsNullOrEmpty(criterioCreado))
            {
            }
            else
            {
                ViewData["Ok"] = "Criterio Creado Satisfactoriamente";
            }

            if (string.IsNullOrEmpty(criterioModificado))
            {
            }
            else
            {
                ViewData["Ok"] = "Criterio Modificado Satisfactoriamente";
            }

            if (string.IsNullOrEmpty(criterioEliminado))
            {
            }
            else
            {
                ViewData["Ok"] = "Criterio Eliminado Satisfactoriamente";
            }

            if (string.IsNullOrEmpty(criterioNoEliminado))
            {
            }
            else
            {
                ViewData["Error"] = "Error al Eliminar Criterio";
            }

            if (string.IsNullOrEmpty(evaluacionMenos))
            {
            }
            else
            {
                ViewData["Error"] = "Pesos de criterios no alcanza el 100%";
            }

            if (string.IsNullOrEmpty(evaluacionMas))
            {
            }
            else
            {
                ViewData["Error"] = "Pesos de criterios supera el 100%";
            }

            PRESTADORA prestadoras = prestadoraBL.ObtenerPrestadora(codigoPrestadora);

            List<EVALUACION_PRESTADORA> model = evaluacionPrestadoraBL.evaluacionPrestadoraListarFiltrado(codigoPrestadora);

            ViewData["CoPrestadora"] = prestadoras.Co_Prestadora;
            ViewData["RazonSocial"] = prestadoras.Tx_RazonSocial;
            ViewData["RUC"] = prestadoras.Nu_Ruc;
            return View(model);
        }

        [HttpPost]
        public ActionResult GetPeso(string selectedValue)
        {
            if (selectedValue.Equals(""))
            {
                List<string> criterios = new List<string>();
                return Json(new { pesoList = criterios });
            }
            else
            {
                List<string> criterios = evaluacionPrestadoraBL.ObtenerCriterio(int.Parse(selectedValue));
                return Json(new { pesoList = criterios });
            }
        }

        public ActionResult Details(int id)
        {
            return View();
        }

        public ActionResult Create(int CoPrestadora)
        {
            List<CRITERIO_EVALUACION> criterios = evaluacionPrestadoraBL.criterioListar();
            ViewData["dsCriterio"] = new SelectList(criterios, "Co_Criterio", "No_Criterio");

            ViewData["co_Prestadora"] = CoPrestadora;

            ViewData["dsPeso"] = new SelectList(new List<string>());

            return View();
        }
        [HttpPost]
        public ActionResult Create(EVALUACION_PRESTADORA evaluacionPrestadora, FormCollection collection, string dsCriterioList)
        {
            try
            {
                if (string.IsNullOrEmpty(collection["Tx_Observacion"].ToString()))
                {
                    throw new Exception();
                }
                else
                {
                    EVALUACION_PRESTADORA evaluacionPrestadoraNueva = new EVALUACION_PRESTADORA();

                    if (string.IsNullOrEmpty(dsCriterioList))
                    {
                        evaluacionPrestadoraNueva.Co_Criterio = int.Parse(dsCriterioList);
                    }
                    else
                    {
                        evaluacionPrestadoraNueva.Co_Criterio = int.Parse(dsCriterioList);
                    }

                    evaluacionPrestadoraNueva.Co_Prestadora = int.Parse(collection["co_Prestadora"]);
                    evaluacionPrestadoraNueva.Nu_Puntaje = decimal.Parse(collection["Nu_Puntaje"]);
                    evaluacionPrestadoraNueva.Tx_Observacion = collection["Tx_Observacion"];

                    if ((decimal.Parse(collection["Nu_Puntaje"])) >= 0 && (decimal.Parse(collection["Nu_Puntaje"])) <= 10)
                    {
                        Boolean agregado = evaluacionPrestadoraBL.AgregarEvaluacionPrestadora(evaluacionPrestadoraNueva);

                        if (agregado)
                        {
                            return RedirectToAction("Index", "EvaluacionPrestadora", new { codigoPrestadora = int.Parse(collection["co_Prestadora"]), criterioCreado = "creado" });
                        }
                        else
                        {
                            ViewData["Error"] = "Criterio ya registrado";

                            List<CRITERIO_EVALUACION> criterios = evaluacionPrestadoraBL.criterioListar();
                            ViewData["dsCriterio"] = new SelectList(criterios, "Co_Criterio", "No_Criterio", dsCriterioList);

                            ViewData["co_Prestadora"] = collection["co_Prestadora"];
                            return View(evaluacionPrestadora);
                        }
                    }
                    else
                    {
                        ViewData["Error"] = "El puntaje debe estar en el rango de 0 a 10";

                        List<CRITERIO_EVALUACION> criterios = evaluacionPrestadoraBL.criterioListar();
                        ViewData["dsCriterio"] = new SelectList(criterios, "Co_Criterio", "No_Criterio", dsCriterioList);

                        ViewData["co_Prestadora"] = collection["co_Prestadora"];
                        return View(evaluacionPrestadora);
                    }
                }
            }
            catch (Exception ex)
            {
                ViewData["Error"] = "Debe llenar todos los campos obligatorios";

                List<CRITERIO_EVALUACION> criterios = evaluacionPrestadoraBL.criterioListar();
                ViewData["dsCriterio"] = new SelectList(criterios, "Co_Criterio", "No_Criterio", dsCriterioList);

                ViewData["co_Prestadora"] = collection["co_Prestadora"];
                return View(evaluacionPrestadora);
            }
        }

        public ActionResult Edit(int id, int CoPrestadora)
        {
            EVALUACION_PRESTADORA model = evaluacionPrestadoraBL.ObtenerEvaluacionPrestadora(id, CoPrestadora);

            List<CRITERIO_EVALUACION> criterios = evaluacionPrestadoraBL.criterioListar();
            ViewData["dsCriterio"] = new SelectList(criterios, "Co_Criterio", "No_Criterio",model.Co_Criterio);

            ViewData["co_Prestadora"] = CoPrestadora;
            return View(model);
        }
        [HttpPost]
        public ActionResult Edit(int id, int CoPrestadora, FormCollection collection)
        {
            try
            {
                if (string.IsNullOrEmpty(collection["Tx_Observacion"].ToString()))
                {
                    throw new Exception();
                }
                else
                {
                    EVALUACION_PRESTADORA evaluacionPrestadoraModificar = new EVALUACION_PRESTADORA();

                    //prestadoraModificar.Co_Prestadora;
                    evaluacionPrestadoraModificar.Co_Criterio = int.Parse(collection["Co_Criterio"]);
                    evaluacionPrestadoraModificar.Nu_Puntaje = decimal.Parse(collection["Nu_Puntaje"]);
                    evaluacionPrestadoraModificar.Tx_Observacion = collection["Tx_Observacion"];

                    Boolean modificado = evaluacionPrestadoraBL.EditarEvaluacionPrestadora(id, CoPrestadora, evaluacionPrestadoraModificar);

                    if (modificado)
                    {
                        return RedirectToAction("Index", "EvaluacionPrestadora", new { codigoPrestadora = int.Parse(collection["co_Prestadora"]), criterioModificado = "modificado" });
                    }
                    else
                    {
                        ViewData["Error"] = "Hubo un error al Editar el Criteria. Modificación No Realizada";

                        EVALUACION_PRESTADORA model = evaluacionPrestadoraBL.ObtenerEvaluacionPrestadora(id, CoPrestadora);

                        List<CRITERIO_EVALUACION> criterios = evaluacionPrestadoraBL.criterioListar();
                        ViewData["dsCriterio"] = new SelectList(criterios, "Co_Criterio", "No_Criterio", model.Co_Criterio);

                        ViewData["co_Prestadora"] = CoPrestadora;
                        return View(model);
                    }
                }
            }
            catch
            {
                ViewData["Error"] = "Debe llenar todos los campos obligatorios";

                EVALUACION_PRESTADORA model = evaluacionPrestadoraBL.ObtenerEvaluacionPrestadora(id, CoPrestadora);

                List<CRITERIO_EVALUACION> criterios = evaluacionPrestadoraBL.criterioListar();
                ViewData["dsCriterio"] = new SelectList(criterios, "Co_Criterio", "No_Criterio", model.Co_Criterio);

                ViewData["co_Prestadora"] = CoPrestadora;
                return View(model);
            }
        }

        public ActionResult Delete(int id, int CoPrestadora)
        {
            Boolean borrado = evaluacionPrestadoraBL.BorrarEvaluacionPrestadora(id, CoPrestadora);

            if (borrado)
            {
                return RedirectToAction("Index", "EvaluacionPrestadora", new { codigoPrestadora = CoPrestadora, criterioEliminado = "eliminado" });
            }
            else
            {
                return RedirectToAction("Index", "EvaluacionPrestadora", new { codigoPrestadora = CoPrestadora, criterioNoEliminado = "noeliminado" });
            }
        }
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult Evaluar(decimal puntaje, decimal peso, int CoPrestadora)
        {

            if (peso==100)
            {
                if (puntaje < 5 ) {

                    Boolean cambioEstado = prestadoraBL.EditarPrestadoraEstado(CoPrestadora, 0);

                    return RedirectToAction("IndexPrestadora", "Prestadora", new { coPrestadora = CoPrestadora.ToString() , inactivo = "inactivo" });
                }
                else
                {
                    return RedirectToAction("IndexPrestadora", "Prestadora", new { coPrestadora = CoPrestadora.ToString() });
                }
            }
            else
                if (peso < 100)
                {
                    return RedirectToAction("Index", "EvaluacionPrestadora", new { codigoPrestadora = CoPrestadora, evaluacionMenos = "evaluado" });
                }
                else{
                    return RedirectToAction("Index", "EvaluacionPrestadora", new { codigoPrestadora = CoPrestadora, evaluacionMas = "evaluado" });
                }

        }

    }
}
