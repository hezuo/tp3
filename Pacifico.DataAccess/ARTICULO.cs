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
    
    public partial class ARTICULO
    {
        public ARTICULO()
        {
            this.PRESUPUESTO_DETALLE = new HashSet<PRESUPUESTO_DETALLE>();
        }
    
        public int Co_Articulo { get; set; }
        public string Nu_Articulo { get; set; }
        public string Tx_Descripcion { get; set; }
        public Nullable<decimal> Ss_PrecioLista { get; set; }
    
        public virtual ICollection<PRESUPUESTO_DETALLE> PRESUPUESTO_DETALLE { get; set; }
    }
}
