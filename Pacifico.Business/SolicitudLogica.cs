using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pacifico.DataAccess;

namespace Pacifico.Business
{
    public class SolicitudLogica
    {

        PACIFICOEntities solicitudDA = new PACIFICOEntities();
        PACIFICOEntities prestadoraDA = new PACIFICOEntities();
        PACIFICOEntities estadoSolicitudDA = new PACIFICOEntities();

        public List<ESTADO_SOLICITUD> estadoSolicitudListar()
        {
            List<ESTADO_SOLICITUD> estados = estadoSolicitudDA.ESTADO_SOLICITUD.ToList();

            return estados;
        }

        public List<ESTADO_SOLICITUD> estadoSolicitudListarRegEnEval()
        {

            List<ESTADO_SOLICITUD> estados = estadoSolicitudDA.ESTADO_SOLICITUD.ToList();

            List<ESTADO_SOLICITUD> estadosObtenidas = new List<ESTADO_SOLICITUD>();

            IEnumerable<ESTADO_SOLICITUD> estadosFiltrado;


            estadosFiltrado = from s in estados
                                  where s.Co_Estado == 1 || s.Co_Estado == 2
                                  select s;


            foreach (ESTADO_SOLICITUD estado in estadosFiltrado)
            {
                estadosObtenidas.Add(estado);
            }

            return estadosObtenidas;
        }

        public List<SOLICITUD_AFILIACION> solicitudListar()
        {
            List<SOLICITUD_AFILIACION> solicitudes = solicitudDA.SOLICITUD_AFILIACION.ToList().OrderByDescending(x => x.Co_Solicitud).ToList();

            return solicitudes;
        }

        public List<SOLICITUD_AFILIACION> solicitudListarRegEnEval()
        {

            List<SOLICITUD_AFILIACION> solicitudes = solicitudDA.SOLICITUD_AFILIACION.ToList();

            List<SOLICITUD_AFILIACION> solicitudesObtenidas = new List<SOLICITUD_AFILIACION>();

            IEnumerable<SOLICITUD_AFILIACION> solicitudesFiltrado;


            solicitudesFiltrado = from s in solicitudes
                                    where s.Co_Estado == 1 || s.Co_Estado == 2
                                    select s;


            foreach (SOLICITUD_AFILIACION solicitud in solicitudesFiltrado)
            {
                solicitudesObtenidas.Add(solicitud);
            }

            solicitudesObtenidas = solicitudesObtenidas.OrderByDescending(x => x.Co_Solicitud).ToList();

            return solicitudesObtenidas;
        }

        public SOLICITUD_AFILIACION ObtenerSolicitud(int codigo)
        {
            List<SOLICITUD_AFILIACION> solicitudes = solicitudDA.SOLICITUD_AFILIACION.ToList();
            
            SOLICITUD_AFILIACION solicitudObtenida = solicitudes.Single(delegate(SOLICITUD_AFILIACION solicitud)
            {
                if (solicitud.Co_Solicitud == codigo)
                    return true;
                else
                    return false;
            });
            return solicitudObtenida;
        }

        public SOLICITUD_AFILIACION ObtenerSolicitudUltima()
        {
            SOLICITUD_AFILIACION solicitudUltima = solicitudDA.SOLICITUD_AFILIACION.ToList().Last();

            return solicitudUltima;
        }

        public Boolean AgregarSolicitud(SOLICITUD_AFILIACION solicitudNueva)
        {
            try
            {
                solicitudDA.SOLICITUD_AFILIACION.Add(solicitudNueva);
                solicitudDA.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public Boolean EditarSolicitud(int id, SOLICITUD_AFILIACION solicitudModificar)
        {
            try
            {
                SOLICITUD_AFILIACION solicitudEditar = ObtenerSolicitud(id);

                solicitudEditar.Nu_Folio = solicitudModificar.Nu_Folio;
                solicitudEditar.No_Contacto = solicitudModificar.No_Contacto;
                solicitudEditar.No_ApePatContacto = solicitudModificar.No_ApePatContacto;
                solicitudEditar.No_ApeMatContacto = solicitudModificar.No_ApeMatContacto;
                solicitudEditar.Nu_TelefonoContacto = solicitudModificar.Nu_TelefonoContacto;
                solicitudEditar.Tx_CorreoContacto = solicitudModificar.Tx_CorreoContacto;
                solicitudEditar.Co_Coordinador = solicitudModificar.Co_Coordinador;
                solicitudEditar.Co_Evaluador = solicitudModificar.Co_Evaluador;
                solicitudEditar.Fe_RegistroUpd = solicitudModificar.Fe_RegistroUpd;
                solicitudEditar.No_UsuarioUpd = solicitudModificar.No_UsuarioUpd;

                solicitudDA.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public Boolean EditarSolicitudServicio(int id, SOLICITUD_AFILIACION solicitudModificar)
        {
            try
            {
                SOLICITUD_AFILIACION solicitudEditar = ObtenerSolicitud(id);

                solicitudEditar.Tx_EvaluacionServicios = solicitudModificar.Tx_EvaluacionServicios;
                solicitudEditar.Fe_RegistroUpd = solicitudModificar.Fe_RegistroUpd;
                solicitudEditar.No_UsuarioUpd = solicitudModificar.No_UsuarioUpd;

                solicitudDA.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public Boolean EditarSolicitudEstado(int id, int estado)
        {
            try
            {
                SOLICITUD_AFILIACION solicitudEditar = ObtenerSolicitud(id);

                solicitudEditar.Co_Estado = estado;

                solicitudDA.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public List<SOLICITUD_AFILIACION> solicitudListarFiltrado(string razon, string ruc, string fechaIni, string fechaFin, string usuario, string estado)
        {

            List<SOLICITUD_AFILIACION> solicitudes = solicitudDA.SOLICITUD_AFILIACION.ToList();
            List<PRESTADORA> prestadores = prestadoraDA.PRESTADORA.ToList();

            List<SOLICITUD_AFILIACION> solicitudesObtenidas = new List<SOLICITUD_AFILIACION>();

            IEnumerable<SOLICITUD_AFILIACION> solicitudesFiltrado;

            if (!string.IsNullOrEmpty(razon) && string.IsNullOrEmpty(ruc))
            {
                solicitudesFiltrado = from s in solicitudes
                                          join p in prestadores
                                          on s.Co_Prestadora equals p.Co_Prestadora
                                          where p.Tx_RazonSocial.ToLower().Contains(razon.ToLower())
                                          select s;
            }
            else
                if(string.IsNullOrEmpty(razon) && !string.IsNullOrEmpty(ruc))
                {
                    solicitudesFiltrado = from s in solicitudes
                                              join p in prestadores
                                              on s.Co_Prestadora equals p.Co_Prestadora
                                              where p.Nu_Ruc.ToLower().Contains(ruc.ToLower())
                                              select s;
                }
                else
                    if (!string.IsNullOrEmpty(razon) && !string.IsNullOrEmpty(ruc))
                    {
                        solicitudesFiltrado = from s in solicitudes
                                                  join p in prestadores
                                                  on s.Co_Prestadora equals p.Co_Prestadora
                                                  where p.Tx_RazonSocial.ToLower().Contains(razon.ToLower()) && p.Nu_Ruc.ToLower().Contains(ruc.ToLower())
                                                  select s;
                    }
                    else
                    {
                        solicitudesFiltrado = from s in solicitudes
                                                  join p in prestadores
                                                  on s.Co_Prestadora equals p.Co_Prestadora
                                                  select s;
                    }

            if (!string.IsNullOrEmpty(usuario))
            {
                solicitudesFiltrado = solicitudesFiltrado.Where(x => x.No_UsuarioIns.ToLower().Contains(usuario.ToLower()));
            }
            if (!string.IsNullOrEmpty(estado))
            {
                solicitudesFiltrado = solicitudesFiltrado.Where(x => x.Co_Estado == int.Parse(estado));
            }
            if (!string.IsNullOrEmpty(fechaIni))
            {
                solicitudesFiltrado = solicitudesFiltrado.Where(x => x.Fe_Solicitud >= DateTime.Parse(fechaIni));
            }
            if (!string.IsNullOrEmpty(fechaFin))
            {
                solicitudesFiltrado = solicitudesFiltrado.Where(x => x.Fe_Solicitud <= DateTime.Parse(fechaFin));
            }

            foreach (SOLICITUD_AFILIACION solicitud in solicitudesFiltrado)
            {
                solicitudesObtenidas.Add(solicitud);
            }

            solicitudesObtenidas = solicitudesObtenidas.OrderByDescending(x => x.Co_Solicitud).ToList();

            return solicitudesObtenidas;
        }

        public List<SOLICITUD_AFILIACION> solicitudListarFiltradoRegEnEval(string razon, string ruc, string fechaIni, string fechaFin, string usuario, string estado)
        {

            List<SOLICITUD_AFILIACION> solicitudes = solicitudListarRegEnEval();
            List<PRESTADORA> prestadores = prestadoraDA.PRESTADORA.ToList();

            List<SOLICITUD_AFILIACION> solicitudesObtenidas = new List<SOLICITUD_AFILIACION>();

            IEnumerable<SOLICITUD_AFILIACION> solicitudesFiltrado;

            if (!string.IsNullOrEmpty(razon) && string.IsNullOrEmpty(ruc))
            {
                solicitudesFiltrado = from s in solicitudes
                                      join p in prestadores
                                      on s.Co_Prestadora equals p.Co_Prestadora
                                      where p.Tx_RazonSocial.ToLower().Contains(razon.ToLower())
                                      select s;
            }
            else
                if (string.IsNullOrEmpty(razon) && !string.IsNullOrEmpty(ruc))
                {
                    solicitudesFiltrado = from s in solicitudes
                                          join p in prestadores
                                          on s.Co_Prestadora equals p.Co_Prestadora
                                          where p.Nu_Ruc.ToLower().Contains(ruc.ToLower())
                                          select s;
                }
                else
                    if (!string.IsNullOrEmpty(razon) && !string.IsNullOrEmpty(ruc))
                    {
                        solicitudesFiltrado = from s in solicitudes
                                              join p in prestadores
                                              on s.Co_Prestadora equals p.Co_Prestadora
                                              where p.Tx_RazonSocial.ToLower().Contains(razon.ToLower()) && p.Nu_Ruc.ToLower().Contains(ruc.ToLower())
                                              select s;
                    }
                    else
                    {
                        solicitudesFiltrado = from s in solicitudes
                                              join p in prestadores
                                              on s.Co_Prestadora equals p.Co_Prestadora
                                              select s;
                    }

            if (!string.IsNullOrEmpty(usuario))
            {
                solicitudesFiltrado = solicitudesFiltrado.Where(x => x.No_UsuarioIns.ToLower().Contains(usuario.ToLower()));
            }
            if (!string.IsNullOrEmpty(estado))
            {
                solicitudesFiltrado = solicitudesFiltrado.Where(x => x.Co_Estado == int.Parse(estado));
            }
            if (!string.IsNullOrEmpty(fechaIni))
            {
                solicitudesFiltrado = solicitudesFiltrado.Where(x => x.Fe_Solicitud >= DateTime.Parse(fechaIni));
            }
            if (!string.IsNullOrEmpty(fechaFin))
            {
                solicitudesFiltrado = solicitudesFiltrado.Where(x => x.Fe_Solicitud <= DateTime.Parse(fechaFin));
            }

            foreach (SOLICITUD_AFILIACION solicitud in solicitudesFiltrado)
            {
                solicitudesObtenidas.Add(solicitud);
            }

            solicitudesObtenidas = solicitudesObtenidas.OrderByDescending(x => x.Co_Solicitud).ToList();

            return solicitudesObtenidas;
        }

    }
}
