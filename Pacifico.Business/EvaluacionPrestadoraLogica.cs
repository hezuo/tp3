using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pacifico.DataAccess;

namespace Pacifico.Business
{
    public class EvaluacionPrestadoraLogica
    {

        PACIFICOEntities evaluacionPrestadoraDA = new PACIFICOEntities();

        public List<CRITERIO_EVALUACION> criterioListar()
        {
            List<CRITERIO_EVALUACION> criterios = evaluacionPrestadoraDA.CRITERIO_EVALUACION.ToList();

            return criterios;
        }

        public List<string> ObtenerCriterio(int codigo)
        {
            List<string> criteriosObtenida = new List<string>();

            List<CRITERIO_EVALUACION> criterios = evaluacionPrestadoraDA.CRITERIO_EVALUACION.ToList();

            foreach (CRITERIO_EVALUACION criterio in criterios)
            {
                if (criterio.Co_Criterio == codigo)
                {
                    criteriosObtenida.Add(criterio.Po_Peso.ToString());
                    break;
                }
            }

            return criteriosObtenida;
        }

        public List<EVALUACION_PRESTADORA> evaluacionPrestadoraListarFiltrado(int codigoPrestadora)
        {
            List<EVALUACION_PRESTADORA> evaluacionPrestadorasObtenidas = new List<EVALUACION_PRESTADORA>();

            List<EVALUACION_PRESTADORA> evaluacionPrestadoras = evaluacionPrestadoraDA.EVALUACION_PRESTADORA.ToList();

            IEnumerable<EVALUACION_PRESTADORA> evaluacionPrestadorasFiltrado = null;

            evaluacionPrestadorasFiltrado = evaluacionPrestadoras.Where(x => x.Co_Prestadora == codigoPrestadora);

            foreach (EVALUACION_PRESTADORA evaluacionPrestadora in evaluacionPrestadorasFiltrado)
            {
                evaluacionPrestadorasObtenidas.Add(evaluacionPrestadora);
            }

            return evaluacionPrestadorasObtenidas;
        }

        public Boolean AgregarEvaluacionPrestadora(EVALUACION_PRESTADORA evaluacionPrestadoraNueva)
        {
            try
            {
                evaluacionPrestadoraDA.EVALUACION_PRESTADORA.Add(evaluacionPrestadoraNueva);
                evaluacionPrestadoraDA.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public EVALUACION_PRESTADORA ObtenerEvaluacionPrestadora(int idCriterio, int idPrestadora)
        {

            EVALUACION_PRESTADORA evaluacionPrestadoraObtenida = new EVALUACION_PRESTADORA();

            List<EVALUACION_PRESTADORA> evaluacionPrestadoras = evaluacionPrestadoraDA.EVALUACION_PRESTADORA.ToList();

            foreach (EVALUACION_PRESTADORA evaluacionPrestadora in evaluacionPrestadoras)
            {
                if (evaluacionPrestadora.Co_Prestadora == idPrestadora)
                {
                    if (evaluacionPrestadora.Co_Criterio == idCriterio)
                    {
                        evaluacionPrestadoraObtenida = evaluacionPrestadora;
                        break;
                    }
                }
            }

            return evaluacionPrestadoraObtenida;
        }

        public Boolean BorrarEvaluacionPrestadora(int idCriterio, int idPrestadora)
        {
            try
            {
                EVALUACION_PRESTADORA evaluacionPrestadorEliminar = ObtenerEvaluacionPrestadora(idCriterio, idPrestadora);
                
                evaluacionPrestadoraDA.EVALUACION_PRESTADORA.Remove(evaluacionPrestadorEliminar);
                evaluacionPrestadoraDA.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public Boolean EditarEvaluacionPrestadora(int idCriterio, int idPrestadora, EVALUACION_PRESTADORA evaluacionPrestadoraModificar)
        {
            try
            {
                EVALUACION_PRESTADORA evaluacionPrestadoraEditar = ObtenerEvaluacionPrestadora(idCriterio, idPrestadora);

                evaluacionPrestadoraEditar.Co_Criterio = evaluacionPrestadoraModificar.Co_Criterio;
                evaluacionPrestadoraEditar.Nu_Puntaje = evaluacionPrestadoraModificar.Nu_Puntaje;
                evaluacionPrestadoraEditar.Tx_Observacion = evaluacionPrestadoraModificar.Tx_Observacion;

                evaluacionPrestadoraDA.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

    }
}
