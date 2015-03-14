using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
             using Pacifico.DataAccess;

namespace Pacifico.Business
{
    public class PresupuestoLogica
    {




        PACIFICOEntities presupuestoDA = new PACIFICOEntities();


        public List<PRESUPUESTO> listarPresupuesto()
        {
            List<PRESUPUESTO> estados = presupuestoDA.PRESUPUESTO.ToList();

            return estados;
        }

        public Boolean AgregarPresupuesto(PRESUPUESTO presupuesto)
        {
            try
            {
                presupuestoDA.PRESUPUESTO.Add(presupuesto);
                presupuestoDA.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public PRESUPUESTO ObtenerPresupuesto(int codigo)
        {

            PRESUPUESTO presupuestoObtenido = new PRESUPUESTO();

            List<PRESUPUESTO> presupuestos = presupuestoDA.PRESUPUESTO.ToList();

            foreach (PRESUPUESTO presupuesto in presupuestos)
            {
                if (presupuesto.Co_Presupuesto == codigo)
                {
                    presupuestoObtenido = presupuesto;
                    break;
                }
            }

            return presupuestoObtenido;
        }

    }
}
