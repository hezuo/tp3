using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pacifico.DataAccess;

namespace Pacifico.Business
{
    public class VehiculoLogica
    {

        PACIFICOEntities vehiculoDA = new PACIFICOEntities();
        public List<VEHICULO> listarVehiculo()
        {
            List<VEHICULO> estados = vehiculoDA.VEHICULO.ToList();

            return estados;
        }

        public Boolean AgregarVehiculo(VEHICULO vehiculo)
        {
            try
            {
                vehiculoDA.VEHICULO.Add(vehiculo);
                vehiculoDA.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public VEHICULO ObtenerVehiculo(int codigo)
        {

            VEHICULO VehiculoObtenido = new VEHICULO();

            List<VEHICULO> vehiculos = vehiculoDA.VEHICULO.ToList();

            foreach (VEHICULO vehiculo in vehiculos)
            {
                if (vehiculo.Co_Vehiculo == codigo)
                {
                    VehiculoObtenido = vehiculo;
                    break;
                }
            }

            return VehiculoObtenido;
        }
    }
}