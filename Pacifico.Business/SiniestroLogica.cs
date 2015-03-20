using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pacifico.DataAccess;

namespace Pacifico.Business
{
    public class SiniestroLogica
    {

        PACIFICOEntities siniestroDA = new PACIFICOEntities();
        PACIFICOEntities estadoSiniestroDA = new PACIFICOEntities();



        public List<SINIESTRO> listarSiniestros()
        {
            List<SINIESTRO> estados = siniestroDA.SINIESTRO.ToList();

            return estados;
        }

        public List<SINIESTRO> listarSiniestrosVehicular()
        {
            List<SINIESTRO> siniestros = siniestroDA.SINIESTRO.ToList();
            List<ESTADO_SINIESTRO> estadosSiniestro = estadoSiniestroDA.ESTADO_SINIESTRO.ToList();
            IEnumerable<SINIESTRO> siniestrosFiltrado;

            List<SINIESTRO> siniestrosObtenidos = new List<SINIESTRO>();

            siniestrosFiltrado = from s in siniestros
                                 join e in estadosSiniestro
                                  on s.Co_EstadoSiniestro equals e.Co_EstadoSiniestro
                                 where e.No_EstadoSiniestro.ToLower().Contains("pendiente informe vehicular")
                                 select s;

            foreach (SINIESTRO siniestro in siniestrosFiltrado)
            {
                siniestrosObtenidos.Add(siniestro);
            }

            return siniestrosObtenidos;
        }

        public List<SINIESTRO> listarSiniestrosPresupuestos()
        {
            List<SINIESTRO> siniestros = siniestroDA.SINIESTRO.ToList();
            List<ESTADO_SINIESTRO> estadosSiniestro = estadoSiniestroDA.ESTADO_SINIESTRO.ToList();
            IEnumerable<SINIESTRO> siniestrosFiltrado;

            List<SINIESTRO> siniestrosObtenidos = new List<SINIESTRO>();

            siniestrosFiltrado = from s in siniestros
                                 join e in estadosSiniestro
                                  on s.Co_EstadoSiniestro equals e.Co_EstadoSiniestro
                                 where e.No_EstadoSiniestro.ToLower().Contains("con informe vehicular")
                                 select s;

            foreach (SINIESTRO siniestro in siniestrosFiltrado)
            {
                siniestrosObtenidos.Add(siniestro);
            }

            return siniestrosObtenidos;
        }

        public List<SINIESTRO> actualizarEstadoSiniestro(SINIESTRO siniestro, string estado)
        {
            List<SINIESTRO> estados = siniestroDA.SINIESTRO.ToList();

            return estados;
        }

        public IQueryable<SINIESTRO> listarSiniestroVehicular(int codigoSiniestro)
        {
            var consulta = (from siniestro in siniestroDA.SINIESTRO
                            join poliza_vehicular in siniestroDA.POLIZA_VEHICULAR
                            on siniestro.Co_PolizaVehicular equals poliza_vehicular.Co_PolizaVehicular
                            join asegurado in siniestroDA.ASEGURADO on poliza_vehicular.Co_Asegurado equals asegurado.Co_Asegurado
                            join vehiculo in siniestroDA.VEHICULO on poliza_vehicular.Co_Vehiculo equals vehiculo.Co_Vehiculo
                            where siniestro.Co_TipoSiniestro == codigoSiniestro
                            select siniestro
                             );
            return consulta;
        }
    }

}