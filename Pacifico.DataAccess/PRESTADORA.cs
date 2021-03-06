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

    public partial class PRESTADORA
    {
        public PRESTADORA()
        {
            this.EVALUACION_PRESTADORA = new HashSet<EVALUACION_PRESTADORA>();
            this.SEDE = new HashSet<SEDE>();
            this.SOLICITUD_AFILIACION = new HashSet<SOLICITUD_AFILIACION>();
        }

        public int Co_Prestadora { get; set; }
        [Required]
        [StringLength(11, MinimumLength = 11)]
        [Display(Name = "RUC")]
        public string Nu_Ruc { get; set; }
        public string Tx_RazonSocial { get; set; }
        public string Tx_DomicilioFiscal { get; set; }
        [Display(Name = "Distrito")]
        public int Co_Distrito { get; set; }
        public string No_RepresentanteLegal { get; set; }
        public string No_ApePatRepresentanteLegal { get; set; }
        public string No_ApeMatRepresentanteLegal { get; set; }
        [DataType(DataType.EmailAddress)]
        [EmailAddress]
        [Required]
        [Display(Name = "Correo Representante Legal")]
        public string Tx_CorreoRepresentanteLegal { get; set; }
        [Range(0, int.MaxValue, ErrorMessage = "Ingrese s�lo n�meros")]
        public string Nu_TelefonoRepresentanteLegal { get; set; }
        public string Tx_PaginaWeb { get; set; }
        public System.DateTime Fe_Afiliacion { get; set; }
        public int Fl_Activo { get; set; }
        public System.DateTime Fe_RegistroIns { get; set; }
        public string No_UsuarioIns { get; set; }
        public System.DateTime Fe_RegistroUpd { get; set; }
        public string No_UsuarioUpd { get; set; }

        public virtual DISTRITO DISTRITO { get; set; }
        public virtual ICollection<EVALUACION_PRESTADORA> EVALUACION_PRESTADORA { get; set; }
        public virtual ICollection<SEDE> SEDE { get; set; }
        public virtual ICollection<SOLICITUD_AFILIACION> SOLICITUD_AFILIACION { get; set; }
    }
}