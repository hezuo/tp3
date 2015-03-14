using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pacifico.DataAccess;

namespace Pacifico.Business
{
    public class LNINFORME_PROCURADORIA
    {
        public static int Add(INFORME_PROCURADORIA informe_procuradoria)
        {
            ADINFORME_PROCURADORIA ad = new ADINFORME_PROCURADORIA();
            return ad.Add(informe_procuradoria);
        }
        public static int Edit(INFORME_PROCURADORIA informe_procuradoria)
        {
            ADINFORME_PROCURADORIA ad = new ADINFORME_PROCURADORIA();
            return ad.Edit(informe_procuradoria);
        }
    }
}