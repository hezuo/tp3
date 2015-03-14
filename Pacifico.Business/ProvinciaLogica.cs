using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pacifico.DataAccess;


namespace Pacifico.Business
{
    public class ProvinciaLogica
    {
        PACIFICOEntities provinciaDA = new PACIFICOEntities();
        PACIFICOEntities distritoDA = new PACIFICOEntities();

        public List<PROVINCIA> provinciaListar()
        {
            List<PROVINCIA> provincias = provinciaDA.PROVINCIA.ToList();

            return provincias;
        }

        public List<PROVINCIA> provinciasListaObt(int codigo)
        {

            List<PROVINCIA> provinciasObtenida = new List<PROVINCIA>();

            List<PROVINCIA> provincias = provinciaDA.PROVINCIA.ToList();

            foreach (PROVINCIA provincia in provincias)
            {
                if (provincia.Co_Departamento == codigo)
                {
                    provinciasObtenida.Add(provincia);
                }
            }

            return provinciasObtenida;
        }

        public List<string> provinciasListaObtenida(int codigo)
        {

            List<string> provinciasObtenida = new List<string>();

            List<PROVINCIA> provincias = provinciaDA.PROVINCIA.ToList();

            foreach (PROVINCIA provincia in provincias)
            {
                if (provincia.Co_Departamento == codigo)
                {
                    provinciasObtenida.Add(provincia.No_Provincia.ToString());
                }
            }

            return provinciasObtenida;
        }

        public List<DISTRITO> distListaObtenida(string nombreProvincia, int codigoDepartamento)
        {
            List<DISTRITO> distritosObtenida = new List<DISTRITO>();

            List<PROVINCIA> provinciasObtenida = provinciasListaObt(codigoDepartamento);
            PROVINCIA prov = new PROVINCIA();

            foreach (PROVINCIA provincia in provinciasObtenida)
            {
                if (provincia.No_Provincia.ToString().Equals(nombreProvincia))
                {
                    prov = provincia;
                    break;
                }
            }

            List<DISTRITO> distritos = distritoDA.DISTRITO.ToList();

            foreach (DISTRITO distrito in distritos)
            {
                if (distrito.Co_Provincia == prov.Co_Provincia)
                {
                    distritosObtenida.Add(distrito);
                }
            }

            return distritosObtenida;
        }

        public List<string> distritosListaObtenida(string nombreProvincia, int codigoDepartamento)
        {
            List<string> distritosObtenida = new List<string>();

            List<PROVINCIA> provinciasObtenida = provinciasListaObt(codigoDepartamento);
            PROVINCIA prov = new PROVINCIA();

            foreach (PROVINCIA provincia in provinciasObtenida)
            {
                if (provincia.No_Provincia.ToString().Equals(nombreProvincia))
                {
                    prov = provincia;
                    break;
                }
            }

            List<DISTRITO> distritos = distritoDA.DISTRITO.ToList();

            foreach (DISTRITO distrito in distritos)
            {
                if (distrito.Co_Provincia == prov.Co_Provincia)
                {
                    distritosObtenida.Add(distrito.No_Distrito.ToString());
                }
            }

            return distritosObtenida;
        }

        public int distritoObtenido(string nombreDistrito, string nombreProvincia, int codigoDepartamento)
        {
            int distritoObtenida = 0;

            List<PROVINCIA> provinciasObtenida = provinciasListaObt(codigoDepartamento);
            PROVINCIA prov = new PROVINCIA();

            foreach (PROVINCIA provincia in provinciasObtenida)
            {
                if (provincia.No_Provincia.ToString().Equals(nombreProvincia))
                {
                    prov = provincia;
                    break;
                }
            }

            List<DISTRITO> distritosObtenida = new List<DISTRITO>();
            List<DISTRITO> distritos = distritoDA.DISTRITO.ToList();

            foreach (DISTRITO distrito in distritos)
            {
                if (distrito.Co_Provincia == prov.Co_Provincia)
                {
                    distritosObtenida.Add(distrito);
                }
            }

            foreach (DISTRITO distrito in distritosObtenida)
            {
                if (distrito.No_Distrito.ToString().Equals(nombreDistrito))
                {
                    distritoObtenida = int.Parse(distrito.Co_Distrito.ToString());
                    break;
                }
            }


            return distritoObtenida;
        }
    }
}
