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
    
    public partial class ESTADO_SOLICITUD
    {
        public ESTADO_SOLICITUD()
        {
            this.SOLICITUD_AFILIACION = new HashSet<SOLICITUD_AFILIACION>();
        }
    
        public int Co_Estado { get; set; }
        public string No_Estado { get; set; }
    
        public virtual ICollection<SOLICITUD_AFILIACION> SOLICITUD_AFILIACION { get; set; }
    }
}
