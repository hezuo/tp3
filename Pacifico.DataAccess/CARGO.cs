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
    
    public partial class CARGO
    {
        public CARGO()
        {
            this.EMPLEADO = new HashSet<EMPLEADO>();
        }
    
        public int Co_Cargo { get; set; }
        public string No_Cargo { get; set; }
    
        public virtual ICollection<EMPLEADO> EMPLEADO { get; set; }
    }
}
