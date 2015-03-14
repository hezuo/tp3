using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pacifico.DataAccess;

namespace Pacifico.Business
{
    public class DepartamentoLogica
    {
        PACIFICOEntities departamentoDA = new PACIFICOEntities();

        public List<DEPARTAMENTO> departamentoListar()
        {
            List<DEPARTAMENTO> departamentos = departamentoDA.DEPARTAMENTO.ToList();

            return departamentos;
        }
    }
}
