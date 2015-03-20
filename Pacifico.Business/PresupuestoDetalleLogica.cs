using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pacifico.DataAccess;

namespace Pacifico.Business
{
    public class PresupuestoDetalleLogica
    {



        PACIFICOEntities presupuestoDetalleDA = new PACIFICOEntities();
        public List<PRESUPUESTO_DETALLE> listarPresupuestoDetalle()
        {
            List<PRESUPUESTO_DETALLE> estados = presupuestoDetalleDA.PRESUPUESTO_DETALLE.ToList();

            return estados;
        }

        public Boolean AgregarPresupuestoDetalle(PRESUPUESTO_DETALLE detalle)
        {
            try
            {
                presupuestoDetalleDA.PRESUPUESTO_DETALLE.Add(detalle);
                presupuestoDetalleDA.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public PRESUPUESTO_DETALLE ObtenerPresupuestoDetalle(int codigo)
        {

            PRESUPUESTO_DETALLE detalleObtenido = new PRESUPUESTO_DETALLE();

            List<PRESUPUESTO_DETALLE> detalles = presupuestoDetalleDA.PRESUPUESTO_DETALLE.ToList();

            foreach (PRESUPUESTO_DETALLE presupuesto_detalle in detalles)
            {
                if (presupuesto_detalle.Co_Presupuesto == codigo)
                {
                    detalleObtenido = presupuesto_detalle;
                    break;
                }
            }

            return detalleObtenido;
        }
    }
}