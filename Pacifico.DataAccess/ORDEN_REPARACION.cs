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
    
    public partial class ORDEN_REPARACION
    {
        public int Co_OrdenRep { get; set; }
        public string Nu_OrdenRep { get; set; }
        public Nullable<System.DateTime> Fe_RegOrden { get; set; }
        public Nullable<System.DateTime> Fe_Atencion { get; set; }
        public int Co_Presupuesto { get; set; }
    
        public virtual PRESUPUESTO PRESUPUESTO { get; set; }
    }
}