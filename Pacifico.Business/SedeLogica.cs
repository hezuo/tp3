using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pacifico.DataAccess;

namespace Pacifico.Business
{
    public class SedeLogica
    {

        PACIFICOEntities sedeDA = new PACIFICOEntities();

        public List<SEDE> sedeListar()
        {
            List<SEDE> sedes = sedeDA.SEDE.ToList();

            return sedes;
        }

        public List<SEDE> sedeListarFiltrado(int codigoPrestadora)
        {

            List<SEDE> sedesObtenidas = new List<SEDE>();

            List<SEDE> sedes = sedeDA.SEDE.ToList();

            IEnumerable<SEDE> sedesFiltrado = null;

            sedesFiltrado = sedes.Where(x => x.Co_Prestadora == codigoPrestadora);

            foreach (SEDE sede in sedesFiltrado)
            {
                sedesObtenidas.Add(sede);
            }

            return sedesObtenidas;
        }

        public Boolean AgregarSede(SEDE sedeNueva)
        {
            try
            {
                sedeDA.SEDE.Add(sedeNueva);
                sedeDA.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public SEDE ObtenerSede(int codigo)
        {

            SEDE sedeObtenida = new SEDE();

            List<SEDE> sedes = sedeDA.SEDE.ToList();

            foreach (SEDE sede in sedes)
            {
                if (sede.Co_Sede == codigo)
                {
                    sedeObtenida = sede;
                    break;
                }
            }

            return sedeObtenida;
        }

        public SEDE ObtenerSedeFiltradoUltima(int codigoPrestadora)
        {
            SEDE sedeFiltradoUltima = sedeListarFiltrado(codigoPrestadora).Last();

            return sedeFiltradoUltima;
        }

        public Boolean EditarSede(int id, SEDE sedeModificar)
        {
            try
            {
                SEDE sedeEditar = ObtenerSede(id);

                sedeEditar.No_Sede = sedeModificar.No_Sede;
                sedeEditar.Tx_Direccion = sedeModificar.Tx_Direccion;
                sedeEditar.Co_Distrito = sedeModificar.Co_Distrito;
                sedeEditar.Nu_Telefono = sedeModificar.Nu_Telefono;
                sedeEditar.No_Contacto = sedeModificar.No_Contacto;
                sedeEditar.No_ApePatContacto = sedeModificar.No_ApePatContacto;
                sedeEditar.No_ApeMatContacto = sedeModificar.No_ApeMatContacto;
                sedeEditar.Tx_CorreoContacto = sedeModificar.Tx_CorreoContacto;
                sedeEditar.Fe_RegistroUpd = sedeModificar.Fe_RegistroUpd;
                sedeEditar.No_UsuarioUpd = sedeModificar.No_UsuarioUpd;

                sedeDA.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}
