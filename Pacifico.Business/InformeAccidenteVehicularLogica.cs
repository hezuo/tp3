using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pacifico.DataAccess;

namespace Pacifico.Business
{

    public class InformeAccidenteVehicularLogica
    {
        PACIFICOEntities informeAccidenteVehicularDA = new PACIFICOEntities();

        public List<INFORME_ACCIDENTE_VEHICULAR> informeAccidenteVehicularListar()
        {
            List<INFORME_ACCIDENTE_VEHICULAR> informeAccidenteVehicular = informeAccidenteVehicularDA.INFORME_ACCIDENTE_VEHICULAR.ToList();

            return informeAccidenteVehicular;
        }

    }
}