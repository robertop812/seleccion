# Metricas Selecciones

Es un ambiente de docker el cual permite visualizar las metricas de los jugadores de las selecciones.
En este primer desarrollo solo se consdieran las estadisticas de los jugadores que se encuentran en las ligas europeas, segun el dataset en https://www.kaggle.com/datasets/vivovinco/20212022-football-player-stats
En particular se considera en analisis los jugadores Argentinos que son delanteros, en la lista de preseleccionados


*Para probar el ambiente seguir los siguientes pasos* 


### Instalación e inicio 
shell
git clone https://github.com/robertop812/seleccion.git 
cd seleccion

./control-env.sh start

### Ejecución 

1. Para obtener el token e ingresar a Jupyter desde el [localhost:8888](http://localhost:8888/)
 shell
./control-env.sh token 

2. Correr la notebook *batch_futbol* 

3. Luego de ejecutar la notebook iniciar superset y acceder al dashboard 
shell
./control-env.sh superset-init 

4. Conectar superset con la base de datos, ingresando en [superset](http://localhost:8088/), seleccionar la opción '+ Database', seleccionar Postgres y agregar los campos necesarios: 
      - SQLAlquemy URI: postgresql://seleccion:selecc10n@postgres/covid  

5. Agregar la conexión del dataset en superset en la opción *Data>Datasets, luego seleccionar la tabla **argentina*. 

6. Importar el dashboard a superset 
Desde Superset:
    Settings
    Import Dashboards
    Choose File

  shell
./control-env.sh superset-import


## Finalización 

Terminar los ambientes de docker 
shell
./control-env.sh stop 