using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pacifico.DataAccess;

namespace Pacifico.Business
{
    public class ServicioSedeLogica
    {
        PACIFICOEntities servicioSedeDA = new PACIFICOEntities();

        public List<SERVICIO> servicioListar()
        {
            List<SERVICIO> servicios = servicioSedeDA.SERVICIO.ToList();

            return servicios;
        }

        public List<SERVICIO_SEDE> servicioSedeListar()
        {
            List<SERVICIO_SEDE> servicioSedes = servicioSedeDA.SERVICIO_SEDE.ToList();

            return servicioSedes;
        }

        public List<SERVICIO_SEDE> servicioSedeListarFiltradoSede(int codigoSede)
        {
            List<SERVICIO_SEDE> servicioSedesObtenidas = new List<SERVICIO_SEDE>();

            List<SERVICIO_SEDE> servicioSedes = servicioSedeDA.SERVICIO_SEDE.ToList();

            IEnumerable<SERVICIO_SEDE> servicioSedesFiltrado = null;

            servicioSedesFiltrado = servicioSedes.Where(x => x.Co_Sede == codigoSede);

            foreach (SERVICIO_SEDE servicioSede in servicioSedesFiltrado)
            {
                servicioSedesObtenidas.Add(servicioSede);
            }

            return servicioSedesObtenidas;
        }

        public Boolean AgregarServicioSede(SERVICIO_SEDE servicioSedeNueva)
        {
            try
            {
                servicioSedeDA.SERVICIO_SEDE.Add(servicioSedeNueva);
                servicioSedeDA.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public SERVICIO_SEDE ObtenerServicioSede(int idSede, int idServicio)
        {

            SERVICIO_SEDE servicioSedeObtenida = new SERVICIO_SEDE();

            List<SERVICIO_SEDE> servicioSedes = servicioSedeDA.SERVICIO_SEDE.ToList();

            foreach (SERVICIO_SEDE servicioSede in servicioSedes)
            {
                if (servicioSede.Co_Sede == idSede)
                {
                    if (servicioSede.Co_Servicio == idServicio)
                    {
                        servicioSedeObtenida = servicioSede;
                        break;
                    }
                }
            }

            return servicioSedeObtenida;
        }

        public Boolean EditarServicioSede(int idSede, int idServicio, SERVICIO_SEDE servicioSedeModificar)
        {
            try
            {
                SERVICIO_SEDE servicioSedeEditar = ObtenerServicioSede(idSede, idServicio);

                servicioSedeEditar.Co_Sede = servicioSedeModificar.Co_Sede;
                servicioSedeEditar.Co_Servicio = servicioSedeModificar.Co_Servicio;
           //     servicioSedeEditar.Tx_Estado = servicioSedeModificar.Tx_Estado;
             //   servicioSedeEditar.Tx_Observacion = servicioSedeModificar.Tx_Observacion;

                servicioSedeDA.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}
