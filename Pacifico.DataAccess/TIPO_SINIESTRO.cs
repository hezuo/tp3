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
    
    public partial class TIPO_SINIESTRO
    {
        public TIPO_SINIESTRO()
        {
            this.SINIESTRO = new HashSet<SINIESTRO>();
        }
    
        public int Co_TipoSiniestro { get; set; }
        public string No_TipoSiniestro { get; set; }
    
        public virtual ICollection<SINIESTRO> SINIESTRO { get; set; }
    }
}
