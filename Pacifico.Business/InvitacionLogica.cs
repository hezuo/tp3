using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pacifico.DataAccess;

namespace Pacifico.Business
{
    public class InvitacionLogica
    {
        PACIFICOEntities invitacionDA = new PACIFICOEntities();

        public List<INVITACION> invitacionListar()
        {
            List<INVITACION> invitaciones = invitacionDA.INVITACION.ToList();

            return invitaciones;
        }

        public INVITACION ObtenerInvitacion(int codigo)
        {

            INVITACION invitacionObtenida = new INVITACION();
            
            List<INVITACION> invitaciones = invitacionDA.INVITACION.ToList();

            foreach (INVITACION invitacion in invitaciones)
            {
                if (invitacion.Co_Invitacion == codigo)
                {
                    invitacionObtenida = invitacion;
                    break;
                }
            }

            return invitacionObtenida;
        }

        public string ValidarInvitacion(int codigo)
        {
            INVITACION invitacionObtenida = ObtenerInvitacion(codigo);

            if (invitacionObtenida.Co_Invitacion == 0)
            {
                return "No encontrado";
            }
            else
            {
                if (invitacionObtenida.Fe_Expiracion.CompareTo(DateTime.Now) < 0)
                {
                    return "Expiro";
                }
                else
                {
                    if (invitacionObtenida.Fl_Estado == 1)
                    {
                        return "Usada";
                    }
                    else{
                        return "Valido";
                    }
                }
            }
        }

        public void cambiarEstado(int codigo)
        {
            INVITACION invitacionEditar = ObtenerInvitacion(codigo);

            invitacionEditar.Fl_Estado = 1;
            invitacionEditar.Fe_RegistroUpd = DateTime.Now;
            invitacionEditar.No_UsuarioUpd = "wfuentes";

            invitacionDA.SaveChanges();
        }


    }

}
