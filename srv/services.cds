using {cap_app_pg as cpg} from '../db/Schema';

@path: 'Student'
service StudentService {


    entity Student @(restrict: [
        {
            grant: ['READ'],
            to   : ['StudentViewer']
        },
        {
            grant: ['*'],
            to   : ['StudentAdmin']
        }
    ]) as projection on cpg.Student;

    annotate Student with @odata.draft.enabled;
}


/*

Aspecto	                                    |   @requires	                        |@restrict
¿Dónde se aplica?                           |	A servicios, funciones o acciones   |	A entidades o proyecciones
Nivel de control                            |	General (todo o nada)               |	Detallado (por operación: READ, CREATE, etc.)
Tipo de autorización                        |	Quien puede entrar al servicio      |	Qué puede hacer cada rol dentro del servicio
¿Permite diferentes roles por operación?    |	❌ No	                           |     ✅ Sí

 */