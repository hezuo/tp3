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
    
    public partial class MODELO_VEHICULO
    {
        public MODELO_VEHICULO()
        {
            this.VEHICULO = new HashSet<VEHICULO>();
        }
    
        public int Co_ModeloVehiculo { get; set; }
        public string No_ModeloVehiculo { get; set; }
        public int Co_MarcaVehiculo { get; set; }
    
        public virtual MARCA_VEHICULO MARCA_VEHICULO { get; set; }
        public virtual ICollection<VEHICULO> VEHICULO { get; set; }
    }
}
