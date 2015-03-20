using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pacifico.DataAccess;

namespace Pacifico.Business
{
    public class PrestadoraLogica
    {

        PACIFICOEntities prestadoraDA = new PACIFICOEntities();

        public List<PRESTADORA> prestadoraListar()
        {
            List<PRESTADORA> prestadores = prestadoraDA.PRESTADORA.ToList().OrderByDescending(x => x.Co_Prestadora).ToList();

            return prestadores;
        }

        public List<PRESTADORA> prestadoraListarActivo()
        {

            List<PRESTADORA> prestadoras = prestadoraDA.PRESTADORA.ToList();

            List<PRESTADORA> prestadorasObtenidas = new List<PRESTADORA>();

            IEnumerable<PRESTADORA> prestadorasFiltrado;


            prestadorasFiltrado = from s in prestadoras
                                  where s.Fl_Activo == 1
                                  select s;


            foreach (PRESTADORA prestadora in prestadorasFiltrado)
            {
                prestadorasObtenidas.Add(prestadora);
            }

            prestadorasObtenidas = prestadorasObtenidas.OrderByDescending(x => x.Co_Prestadora).ToList();

            return prestadorasObtenidas;
        }

        public string ValidarRuc(string ruc)
        {

            List<PRESTADORA> prestadoras = prestadoraDA.PRESTADORA.ToList();

            foreach (PRESTADORA prestadora in prestadoras)
            {
                if (prestadora.Nu_Ruc.Equals(ruc))
                {
                    return "Existe";
                }
            }

            return "Valido";
        }

        public string ValidarRucEditado(string ruc, int id)
        {

            List<PRESTADORA> prestadoras = prestadoraDA.PRESTADORA.ToList();

            foreach (PRESTADORA prestadora in prestadoras)
            {
                if (prestadora.Nu_Ruc.Equals(ruc))
                {
                    if (prestadora.Co_Prestadora != id)
                    {
                        return "Existe";
                    }
                }
            }

            return "Valido";
        }

        public PRESTADORA ObtenerPrestadoraUltima()
        {
            PRESTADORA prestadoraUltima = prestadoraDA.PRESTADORA.ToList().Last();

            return prestadoraUltima;
        }

        public Boolean AgregarPrestadora(PRESTADORA prestadoraNueva)
        {
            try
            {
                prestadoraDA.PRESTADORA.Add(prestadoraNueva);
                prestadoraDA.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public PRESTADORA ObtenerPrestadora(int codigo)
        {

            PRESTADORA prestadoraObtenida = new PRESTADORA();

            List<PRESTADORA> prestadoras = prestadoraDA.PRESTADORA.ToList();

            foreach (PRESTADORA prestadora in prestadoras)
            {
                if (prestadora.Co_Prestadora == codigo)
                {
                    prestadoraObtenida = prestadora;
                    break;
                }
            }

            return prestadoraObtenida;
        }

        public string ValidarPrestadora(int codigo)
        {
            PRESTADORA prestadoraObtenida = ObtenerPrestadora(codigo);

            if (prestadoraObtenida.Co_Prestadora == 0)
            {
                return "No encontrado";
            }
            else
            {
                return "Valido";
            }
        }

        public Boolean EditarPrestadora(int id, PRESTADORA prestadoraModificar)
        {
            try
            {
                PRESTADORA prestadoraEditar = ObtenerPrestadora(id);

                prestadoraEditar.Tx_RazonSocial = prestadoraModificar.Tx_RazonSocial;
                prestadoraEditar.Nu_Ruc = prestadoraModificar.Nu_Ruc;
                prestadoraEditar.Co_Distrito = prestadoraModificar.Co_Distrito;
                prestadoraEditar.Tx_DomicilioFiscal = prestadoraModificar.Tx_DomicilioFiscal;
                prestadoraEditar.No_RepresentanteLegal = prestadoraModificar.No_RepresentanteLegal;
                prestadoraEditar.No_ApePatRepresentanteLegal = prestadoraModificar.No_ApePatRepresentanteLegal;
                prestadoraEditar.No_ApeMatRepresentanteLegal = prestadoraModificar.No_ApeMatRepresentanteLegal;
                prestadoraEditar.Nu_TelefonoRepresentanteLegal = prestadoraModificar.Nu_TelefonoRepresentanteLegal;
                prestadoraEditar.Tx_CorreoRepresentanteLegal = prestadoraModificar.Tx_CorreoRepresentanteLegal;
                prestadoraEditar.Fe_RegistroUpd = prestadoraModificar.Fe_RegistroUpd;
                prestadoraEditar.No_UsuarioUpd = prestadoraModificar.No_UsuarioUpd;

                prestadoraDA.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public Boolean EditarPrestadoraEstado(int id, int estado)
        {
            try
            {
                PRESTADORA prestadoraEditar = ObtenerPrestadora(id);

                prestadoraEditar.Fl_Activo = estado;

                prestadoraDA.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public List<PRESTADORA> prestadoraListarFiltrado(string razon, string ruc, string fechaIni, string fechaFin, string estado)
        {

            List<PRESTADORA> prestadores = prestadoraDA.PRESTADORA.ToList();

            List<PRESTADORA> prestadorasObtenidas = new List<PRESTADORA>();

            IEnumerable<PRESTADORA>  prestadorasFiltrado = from p in prestadores select p;

            if (!string.IsNullOrEmpty(razon))
            {
                prestadorasFiltrado = prestadorasFiltrado.Where(x => x.Tx_RazonSocial.ToLower().Contains(razon.ToLower()));
            }
            if (!string.IsNullOrEmpty(ruc))
            {
                prestadorasFiltrado = prestadorasFiltrado.Where(x => x.Nu_Ruc.ToLower().Contains(ruc.ToLower()));
            }
            if (!string.IsNullOrEmpty(estado))
            {
                prestadorasFiltrado = prestadorasFiltrado.Where(x => x.Fl_Activo == int.Parse(estado));
            }
            if (!string.IsNullOrEmpty(fechaIni))
            {
                prestadorasFiltrado = prestadorasFiltrado.Where(x => x.Fe_Afiliacion >= DateTime.Parse(fechaIni));
            }
            if (!string.IsNullOrEmpty(fechaFin))
            {
                prestadorasFiltrado = prestadorasFiltrado.Where(x => x.Fe_Afiliacion <= DateTime.Parse(fechaFin));
            }

            foreach (PRESTADORA prestadora in prestadorasFiltrado)
            {
                prestadorasObtenidas.Add(prestadora);
            }

            prestadorasObtenidas = prestadorasObtenidas.OrderByDescending(x => x.Co_Prestadora).ToList();

            return prestadorasObtenidas;
        }

    }
}
