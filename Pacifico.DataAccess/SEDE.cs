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

    public partial class SEDE
    {
        public SEDE()
        {
            this.SERVICIO_SEDE = new HashSet<SERVICIO_SEDE>();
        }

        public int Co_Sede { get; set; }
        [Display(Name = "Prestadora")]
        public int Co_Prestadora { get; set; }
        public string No_Sede { get; set; }
        public string Tx_Direccion { get; set; }
        public int Co_Distrito { get; set; }
        [Range(0, int.MaxValue, ErrorMessage = "Ingrese s�lo n�meros")]
        public string Nu_Telefono { get; set; }
        public string No_Contacto { get; set; }
        public string No_ApePatContacto { get; set; }
        public string No_ApeMatContacto { get; set; }
        [DataType(DataType.EmailAddress)]
        [EmailAddress]
        [Required]
        [Display(Name = "Correo Contacto")]
        public string Tx_CorreoContacto { get; set; }
        public System.DateTime Fe_RegistroIns { get; set; }
        public string No_UsuarioIns { get; set; }
        public System.DateTime Fe_RegistroUpd { get; set; }
        public string No_UsuarioUpd { get; set; }

        public virtual DISTRITO DISTRITO { get; set; }
        public virtual PRESTADORA PRESTADORA { get; set; }
        public virtual ICollection<SERVICIO_SEDE> SERVICIO_SEDE { get; set; }
    }
}