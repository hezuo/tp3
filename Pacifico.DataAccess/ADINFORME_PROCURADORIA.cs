using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.Entity;

namespace Pacifico.DataAccess
{
    public class ADINFORME_PROCURADORIA
    {
        private PACIFICOEntities db = new PACIFICOEntities();
        public int Add(INFORME_PROCURADORIA informe_procuradoria)
        {
            db.INFORME_PROCURADORIA.Add(informe_procuradoria);
            return db.SaveChanges();
        }
        public int Edit(INFORME_PROCURADORIA informe_procuradoria)
        {
            db.Entry(informe_procuradoria).State = EntityState.Modified;
            return db.SaveChanges();
        }

    }
}