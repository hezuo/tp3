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
    
    public partial class HISTORIAL_CLINICO
    {
        public int Co_HistorialCli { get; set; }
        public string No_Hospital { get; set; }
        public string No_ApeDoctor { get; set; }
        public System.DateTime Fe_Consulta { get; set; }
        public string Tx_ResultadoExamenes { get; set; }
        public string Tx_Diagnostico { get; set; }
        public string Tx_Tratamiento { get; set; }
        public string Nu_Siniestro { get; set; }
        public int Co_Expediente { get; set; }
    
        public virtual EXPEDIENTE EXPEDIENTE { get; set; }
    }
}
