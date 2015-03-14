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
    public class UsuarioController : Controller
    {

        UsuarioLogica usuarioBL = new UsuarioLogica();

        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();

            return RedirectToAction("Index", "Home");
        }

        public ActionResult LogIn()
        {
            return View();
        }

        [HttpPost]
        public ActionResult LogIn(USUARIO usuario, FormCollection collection)
        {
            try
            {

                string usuarioValidado = usuarioBL.ValidarUsuario(collection["No_Usuario"].ToString(), collection["Tx_Password"].ToString());

                if (usuarioValidado.Equals("Valido"))
                {
                    FormsAuthentication.SetAuthCookie(collection["No_Usuario"].ToString(), true);
                    return RedirectToAction("Index", "Home");
                }
                else
                    if (usuarioValidado.Equals("No Password"))
                    {
                        ViewData["Error"] = "Password Incorrecto";

                        return View(usuario);
                    }
                    else
                    {
                        ViewData["Error"] = "Usuario Incorrecto";

                        return View(usuario);
                    }
            }
            catch (Exception ex)
            {
                ViewData["Error"] = ex.Message;
                return View();
            }
        }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Details(int id)
        {
            return View();
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(FormCollection collection)
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

        public ActionResult Edit(int id)
        {
            return View();
        }

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
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

        public ActionResult Delete(int id)
        {
            return View();
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
    }
}
