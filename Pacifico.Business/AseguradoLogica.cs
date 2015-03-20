using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pacifico.DataAccess;

namespace Pacifico.Business
{
    public class AseguradoLogica
    {

        PACIFICOEntities AseguradoDA = new PACIFICOEntities();

        public List<ASEGURADO> listarAsegurados()
        {
            List<ASEGURADO> estados = AseguradoDA.ASEGURADO.ToList();

            return estados;
        }

        public Boolean AgregarAsegurado(ASEGURADO asegurado)
        {
            try
            {
                AseguradoDA.ASEGURADO.Add(asegurado);
                AseguradoDA.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public ASEGURADO ObtenerAsegurado(int codigo)
        {

            ASEGURADO aseguradoObtenido = new ASEGURADO();

            List<ASEGURADO> asegurados = AseguradoDA.ASEGURADO.ToList();

            foreach (ASEGURADO asegurado in asegurados)
            {
                if (asegurado.Co_Asegurado == codigo)
                {
                    aseguradoObtenido = asegurado;
                    break;
                }
            }

            return aseguradoObtenido;
        }

        public List<ASEGURADO> aseguradoListarFiltrado(String nombreAsegurado)
        {

            List<ASEGURADO> aseguradosObtenidos = new List<ASEGURADO>();

            List<ASEGURADO> asegurados = AseguradoDA.ASEGURADO.ToList();

            IEnumerable<ASEGURADO> aseguradoFiltrado = null;

            aseguradoFiltrado = asegurados.Where(x => x.No_Asegurado == nombreAsegurado);

            foreach (ASEGURADO asegurado in aseguradoFiltrado)
            {
                aseguradosObtenidos.Add(asegurado);
            }

            return aseguradosObtenidos;
        }

        //public ASEGURADO ObtenerAseguradoFiltradoUltima(String nombreAsegurado)
        //{
        //    ASEGURADO aseguradoFiltradoUltima = aseguradoListarFiltrado(nombreAsegurado).Last();

        //    return aseguradoFiltradoUltima;
        //}

        public Boolean EditarAsegurado(int id, ASEGURADO aseguradoModificar)
        {
            try
            {
                ASEGURADO aseguradoEditar = ObtenerAsegurado(id);

                aseguradoEditar.Co_Asegurado = aseguradoModificar.Co_Asegurado;
                aseguradoEditar.Nu_DocumentoIdentidad = aseguradoModificar.Nu_DocumentoIdentidad;
                aseguradoEditar.No_Asegurado = aseguradoModificar.No_Asegurado;
                aseguradoEditar.No_ApePaterno = aseguradoModificar.No_ApePaterno;
                aseguradoEditar.No_ApeMaterno = aseguradoModificar.No_ApeMaterno;
                aseguradoEditar.Fl_Sexo = aseguradoModificar.Fl_Sexo;
                aseguradoEditar.Fe_Nacimiento = aseguradoModificar.Fe_Nacimiento;
                aseguradoEditar.Tx_EstadoCivil = aseguradoModificar.Tx_EstadoCivil;
                aseguradoEditar.Tx_Direccion = aseguradoModificar.Tx_Direccion;
                aseguradoEditar.Co_Distrito = aseguradoModificar.Co_Distrito;
                aseguradoEditar.Tx_Correo = aseguradoModificar.Tx_Correo;
                aseguradoEditar.Nu_Telefono1 = aseguradoModificar.Nu_Telefono1;
                aseguradoEditar.Nu_Telefono2 = aseguradoModificar.Nu_Telefono2;
                aseguradoEditar.Nu_Movil = aseguradoModificar.Nu_Movil;
                aseguradoEditar.Tx_CentroTrabajo = aseguradoModificar.Tx_CentroTrabajo;
                aseguradoEditar.Tx_DireccionTrabajo = aseguradoModificar.Tx_DireccionTrabajo;
                aseguradoEditar.Tx_CargoTrabajo = aseguradoModificar.Tx_CargoTrabajo;
                aseguradoEditar.Tx_Estado = aseguradoModificar.Tx_Estado;

                AseguradoDA.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }




    }
}