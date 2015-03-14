using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pacifico.DataAccess;

namespace Pacifico.Business
{
    public class LNExpediente
    {
        public static IEnumerable<EXPEDIENTE> getAll()
        {
            ADEXPEDIENTE oADEXPEDIENTE = new ADEXPEDIENTE();
            return oADEXPEDIENTE.getAll(); ;
        }
        public static EXPEDIENTE getOne(int id = 0)
        {
            ADEXPEDIENTE oADEXPEDIENTE = new ADEXPEDIENTE();
            return oADEXPEDIENTE.getOne(id); ;
        }

    }
}