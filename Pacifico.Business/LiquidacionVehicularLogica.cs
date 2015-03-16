using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pacifico.DataAccess;

namespace Pacifico.Business
{
    public class LiquidacionVehicularLogica
    {
        PACIFICOEntities LiquidacionDA = new PACIFICOEntities();

        public List<LIQUIDACION_VEHICULAR> listarLiquidacion()
        {
            var Listado = LiquidacionDA.LIQUIDACION_VEHICULAR.ToList();
            return Listado;
        }
        public Boolean AgregarLiquidacion(LIQUIDACION_VEHICULAR liquidacion)
        {
            try
            {
                LiquidacionDA.LIQUIDACION_VEHICULAR.Add(liquidacion);
                LiquidacionDA.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public LIQUIDACION_VEHICULAR ObtenerLiquidacion(int codigo)
        {

            LIQUIDACION_VEHICULAR liquidacionObtenido = new LIQUIDACION_VEHICULAR();

            List<LIQUIDACION_VEHICULAR> liquidaciones = LiquidacionDA.LIQUIDACION_VEHICULAR.ToList();

            foreach (LIQUIDACION_VEHICULAR liquidacion in liquidaciones)
            {
                if (liquidacion.Co_LiquidacionVehicular == codigo)
                {
                    liquidacionObtenido = liquidacion;
                    break;
                }
            }

            return liquidacionObtenido;
        }
        public Boolean EditarLiquidacion(int id, LIQUIDACION_VEHICULAR liquidacionModificar)
        {
            try
            {
                LIQUIDACION_VEHICULAR liquidacionEditar = ObtenerLiquidacion(id);

                liquidacionEditar.Co_LiquidacionVehicular = liquidacionModificar.Co_LiquidacionVehicular;
                liquidacionEditar.Co_Siniestro = liquidacionModificar.Co_Siniestro;
                liquidacionEditar.Tx_Observaciones = liquidacionModificar.Tx_Observaciones;
                liquidacionEditar.Tx_Estado = liquidacionModificar.Tx_Estado;
                liquidacionEditar.Co_Usuario = liquidacionModificar.Co_Usuario;
                liquidacionEditar.Fe_Registro = liquidacionModificar.Fe_Registro;

                LiquidacionDA.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}
