//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Pacifico.DataAccess
{
    using System;
    using System.Collections.Generic;
    
    public partial class INFORME_PROCURADORIA
    {
        public INFORME_PROCURADORIA()
        {
            this.CARTA_NOTARIAL = new HashSet<CARTA_NOTARIAL>();
        }
    
        public int Co_NumInfProc { get; set; }
        public string Fl_TipoResultado { get; set; }
        public string Tx_Conclusiones { get; set; }
        public Nullable<System.DateTime> Fe_Emision { get; set; }
        public Nullable<bool> Fl_Aprobacion { get; set; }
        public int Co_Expediente { get; set; }
    
        public virtual ICollection<CARTA_NOTARIAL> CARTA_NOTARIAL { get; set; }
        public virtual EXPEDIENTE EXPEDIENTE { get; set; }
    }
}
