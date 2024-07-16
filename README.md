# task_management_app

Task management app es una aplicación desarrollada en flutter que sirve para la gestión de tareas, su propósito es poder tener una manera eficiente y eficaz para la administración de las actividades, algunas de las funcionalidades con las que cuenta son:

- Ver todas las tareas.  
- Ver información a detalle de cada tarea.  
- Crear tareas nuevas.  
- Actualizar tareas creadas anteriormente.  
- Eliminar tareas.  

## Getting Started


### Uso de herramientas
Algunas de las tecnologías utilizadas para el desarrollo de la aplicación fueron:

- [Provider] - Gestor de estados de la app.    
- [http] - Gestión de peticiones a la API.    
- [flutter_dotenv] - Gestión y protección de credenciales.    
- [intl] - Para la conversión de formatos.    

### Guía de instalación para el proyecto
  
El primer paso es clonar el repositorio del proyecto, esto lo hacemos con el siguiente comando:  

- git clone [https://github.com/IsaiGonzalez08/task_management_app.git](https://github.com/IsaiGonzalez08/task_management_app)


El siguiente paso es realizar la instalación de las dependencias de flutter necesarias para que el proyecto pueda funcionar, para esto tenemos que ejecutar el siguiente comando:  

- flutter pub get  

Una vez termine la instalación las dependencias podremos ejecutar el proyecto, para esto podemos utilizar el siguiente comando:  

- flutter run


## Uso de proyecto

Una vez hecha las instalaciones necesarias el proyecto y haber realizado la ejecución del proyecto, lo primero que veremos será lo siguiente:




Esta es la vista donde podremos ver todas nuestras tareas creadas, aquí podemos observar la información básica de cada tarea, por ejemplo:

 - Nombre.
 - Fecha.
 - Completado.


Cada tarea cuenta con un botón de configuración, que se encuentra al costado derecho de la tarea, es botón al darle click nos mostrará la siguiente alerta:


Esta alerta nos permite ver la información más a detalle de cada tarea, algunos de los campos de información que podemos observar son:

 - Nombre.
 - Fecha.
 - Completado.
 - Comentarios.
 - Descripción.
 - Tags.
 - Fecha de creación.
 - Fecha de actualización.

También podemos observar que contamos con dos botones en la parte superior de nuestra alerta, el primer botón nos permitirá editar la información de la tarea, este botón al darle click nos redirigirá a la vista para poder realizar la edición de la tarea, la cuál es la siguiente:



Una vez completados los campos con la información necesaria y al darle click al botón para editar la tarea, la edición se completará con la información nueva y la tarea habrá cambiado.


La aplicación también cuenta con la sección para poder crear una tarea nueva, que es la siguiente:


Una vez se hayan completado los campos con la información necesaria para la creación de la tarea y al darle click al botón para crear la tarea, esta aparecerá en la lista de nuestra tareas como una nueva tarea:


Para la eliminación de una tarea tendremos que ir a la información a detalle de esa tarea, una vez dentro de la alerta el botón para eliminar la tarea se encontrará en la parte superior derecha de esta, al darle click al botón aparecerá una alerta de advertencia para confirmar si se desea eliminar la tarea, una vez al darle click al botón de confirmar esta tarea se eliminará y ya no aparecerá en la lista de tareas. 
