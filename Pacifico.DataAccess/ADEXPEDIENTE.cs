using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.Entity;

namespace Pacifico.DataAccess
{
    public class ADEXPEDIENTE
    {
        private PACIFICOEntities db = new PACIFICOEntities();
        public IEnumerable<EXPEDIENTE> getAll()
        {
            var expediente = db.EXPEDIENTE.Include(e => e.ASEGURADO).Include(e => e.BENEFICIARIO);
            return expediente.ToList();
        }
        public EXPEDIENTE getOne(int id=0)
        {
            return  db.EXPEDIENTE.Find(id);
        }
    }
}
