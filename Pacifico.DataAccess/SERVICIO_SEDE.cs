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
    using System.ComponentModel.DataAnnotations;

    public partial class SERVICIO_SEDE
    {
        public int Co_Sede { get; set; }
        public int Co_Servicio { get; set; }
        public Nullable<int> Co_Red { get; set; }
        public decimal Po_Copago { get; set; }
        public decimal Po_Cobertura { get; set; }
        public string Tx_Estado { get; set; }
        public string Tx_Observacion { get; set; }

        public virtual RED RED { get; set; }
        public virtual SEDE SEDE { get; set; }
        public virtual SERVICIO SERVICIO { get; set; }
    }
}