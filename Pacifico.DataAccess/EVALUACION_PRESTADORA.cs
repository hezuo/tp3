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
    
    public partial class EVALUACION_PRESTADORA
    {
        public int Co_Prestadora { get; set; }
        public int Co_Criterio { get; set; }
        public decimal Nu_Puntaje { get; set; }
        public string Tx_Observacion { get; set; }
    
        public virtual CRITERIO_EVALUACION CRITERIO_EVALUACION { get; set; }
        public virtual PRESTADORA PRESTADORA { get; set; }
    }
}
