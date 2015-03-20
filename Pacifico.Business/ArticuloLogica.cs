using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pacifico.DataAccess;


namespace Pacifico.Business
{
    public class ArticuloLogica
    {

        PACIFICOEntities articuloDA = new PACIFICOEntities();

        public List<ARTICULO> listarArticulo()
        {
            List<ARTICULO> estados = articuloDA.ARTICULO.ToList();

            return estados;
        }

        public Boolean AgregarArticulo(ARTICULO Articulo)
        {
            try
            {
                articuloDA.ARTICULO.Add(Articulo);
                articuloDA.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public ARTICULO ObtenerArticulo(int codigo)
        {

            ARTICULO articuloObtenido = new ARTICULO();

            List<ARTICULO> articulos = articuloDA.ARTICULO.ToList();

            foreach (ARTICULO articulo in articulos)
            {
                if (articulo.Co_Articulo == codigo)
                {
                    articuloObtenido = articulo;
                    break;
                }
            }

            return articuloObtenido;
        }

    }
}