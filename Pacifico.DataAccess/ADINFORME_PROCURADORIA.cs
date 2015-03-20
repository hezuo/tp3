using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.Entity;
using Pacifico.DataAccess;

namespace Pacifico.DataAccess
{
    public class ADINFORME_PROCURADORIA
    {
        private PACIFICOEntities db = new PACIFICOEntities();
        public int Add(INFORME_PROCURADORIA informe_procuradoria)
        {
            informe_procuradoria.Fe_Emision = DateTime.Now;
            db.INFORME_PROCURADORIA.Add(informe_procuradoria);
            return db.SaveChanges();
        }
        public int Edit(INFORME_PROCURADORIA informe_procuradoria)
        {

            INFORME_PROCURADORIA oINFORME_PROCURADORIA = db.INFORME_PROCURADORIA.Find(informe_procuradoria.Co_NumInfProc);


            oINFORME_PROCURADORIA.Tx_Conclusiones = informe_procuradoria.Tx_Conclusiones;
            oINFORME_PROCURADORIA.Fl_TipoResultado = informe_procuradoria.Fl_TipoResultado;


            db.Entry(oINFORME_PROCURADORIA).State = EntityState.Modified;
            return db.SaveChanges();
        }

    }
}