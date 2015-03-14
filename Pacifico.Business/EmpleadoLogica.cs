using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pacifico.DataAccess;

namespace Pacifico.Business
{
    public class EmpleadoLogica
    {

        PACIFICOEntities empleadoDA = new PACIFICOEntities();

        public List<EMPLEADO> empleadoListar()
        {
            List<EMPLEADO> empleados = empleadoDA.EMPLEADO.ToList();

            return empleados;
        }

    }
}
