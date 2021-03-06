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
    
    public partial class SINIESTRO
    {
        public SINIESTRO()
        {
            this.INFORME_ACCIDENTE_VEHICULAR = new HashSet<INFORME_ACCIDENTE_VEHICULAR>();
            this.LIQUIDACION_VEHICULAR = new HashSet<LIQUIDACION_VEHICULAR>();
            this.PRESUPUESTO = new HashSet<PRESUPUESTO>();
        }
    
        public int Co_Siniestro { get; set; }
        public string Nu_Siniestro { get; set; }
        public string Tx_Descripcion { get; set; }
        public string Tx_Lugar { get; set; }
        public Nullable<System.DateTime> Fe_Ocurrencia { get; set; }
        public Nullable<System.DateTime> Fe_UltimaRecaudo { get; set; }
        public int Co_Procurador { get; set; }
        public int Co_TipoSiniestro { get; set; }
        public int Co_PolizaVehicular { get; set; }
        public int Co_EstadoSiniestro { get; set; }
    
        public virtual ESTADO_SINIESTRO ESTADO_SINIESTRO { get; set; }
        public virtual ICollection<INFORME_ACCIDENTE_VEHICULAR> INFORME_ACCIDENTE_VEHICULAR { get; set; }
        public virtual ICollection<LIQUIDACION_VEHICULAR> LIQUIDACION_VEHICULAR { get; set; }
        public virtual POLIZA_VEHICULAR POLIZA_VEHICULAR { get; set; }
        public virtual ICollection<PRESUPUESTO> PRESUPUESTO { get; set; }
        public virtual PROCURADOR PROCURADOR { get; set; }
        public virtual TIPO_SINIESTRO TIPO_SINIESTRO { get; set; }
    }
}
