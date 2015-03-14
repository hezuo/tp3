using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pacifico.DataAccess;

namespace Pacifico.Business
{
    public class FormaPagoLogica
    {


        PACIFICOEntities formaPagoDA = new PACIFICOEntities();
        public List<FORMA_PAGO> listarFormaPago()
        {
            List<FORMA_PAGO> estados = formaPagoDA.FORMA_PAGO.ToList();

            return estados;
        }
    }
}
