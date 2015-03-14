using Pacifico.Business;
using Pacifico.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Pacifico.Interfaces.Controllers
{
    public class ArticuloController : Controller
    {


        //ArticuloService servicio = new ArticuloServiceImpl();

       // si todo esta bien deberia funcionar, pero tu tabla esta vacia inserta   1 campo
        //Aun no funciona el registrar?
        //primero el listar a ver a ver
        // ya ps
        public ActionResult Index()
        {
            //return View(servicio.listaArticulos());
            return View();
        }

        public ActionResult registrar()
        {
            return View();
        }

        //[HttpPost]
        //public ActionResult registrar(ARTICULO obj)
        //{
        //    if (ModelState.IsValid) {
        //       //mejor que sea boolean para evaluar mejor
        //        if (servicio.guardarArticulo(obj)) {
        //            return RedirectToAction("Index");
        //        };            
        //    }
        //    return View();           
        //}



    }
}
