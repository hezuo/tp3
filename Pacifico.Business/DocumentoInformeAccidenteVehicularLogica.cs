using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pacifico.DataAccess;

namespace Pacifico.Business
{

    public class DocumentoInformeAccidenteVehicularLogica
    {
        PACIFICOEntities informeAccidenteVehicularDA = new PACIFICOEntities();

        public List<DOCUMENTO_INFORME_ACCIDENTE_VEHICULAR> documentosPorInformeCodigo(int codigo)
        {
            List<DOCUMENTO_INFORME_ACCIDENTE_VEHICULAR> documentos = informeAccidenteVehicularDA.DOCUMENTO_INFORME_ACCIDENTE_VEHICULAR.ToList();

            List<DOCUMENTO_INFORME_ACCIDENTE_VEHICULAR> documentoInformeAccidenteVehicularList = new List<DOCUMENTO_INFORME_ACCIDENTE_VEHICULAR>();


            IEnumerable<DOCUMENTO_INFORME_ACCIDENTE_VEHICULAR> informeAccidenteVehicularTemp;


            informeAccidenteVehicularTemp = from d in documentos
                                            where d.Co_InformeAccidenteVehicular.Equals(codigo)
                                            select d;


            foreach (DOCUMENTO_INFORME_ACCIDENTE_VEHICULAR documentoInformeAccidenteVehicular in informeAccidenteVehicularTemp)
            {
                documentoInformeAccidenteVehicularList.Add(documentoInformeAccidenteVehicular);
            }
            return documentoInformeAccidenteVehicularList;
        }

    }
}