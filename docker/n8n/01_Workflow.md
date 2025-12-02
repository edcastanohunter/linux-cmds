## Un workflow debe cumplir con lo siguiente

1. Inicio - normalmente es una acción (Request, chat)
2. Acción
3. Decisión
4. Salida de datos


## Flujo de Leads
1. ¿Que inicia el flujo?
1. ¿Que decisiones evaluan? 
1. ¿Qué resultado esperamos en cada caso?
1. ¿Qué acciones se ejecutan?


Que tarea repetitiva podría realizar? 
- Automatizar los emails. 


---

## Tipos de Nodods

### ¿Cuáles son los tipos de nodos clave en N8N?
Dominar estos tipos acelera tu aprendizaje. Cada uno responde a una pregunta: cuándo iniciar, qué hacer, por dónde seguir.

### ¿Cómo funcionan los nodos trigger?
Su rol es iniciar el flujo sin intervención manual. Detectan eventos y arrancan el proceso.

Formularios enviados: inicio automático cuando alguien lo envía.
Correos recibidos: arranque al llegar un email.
Hora específica: ejecución programada a una hora concreta.

### ¿Qué hacen los nodos de acción?
Ejecutan tareas concretas una vez iniciado el flujo. Realizan la operación que necesitas.

Enviar un correo a una persona o equipo.
Crear una fila en una hoja de cálculos.
Enviar un mensaje a Slack para notificar avances.

### ¿Cómo deciden los nodos de condición?
Permiten bifurcar caminos según reglas. Con nodos como IF y SWITCH tomas decisiones lógicas.

Si el mensaje dice “demo”, sigue por la ruta A.
Si el correo contiene “@miempresa.com”, aplica la regla interna.
Usa IF para verdadero/falso y SWITCH para múltiples casos.

### ¿Cómo transformar, controlar y esperar en tus flujos?
Antes de ejecutar o decidir, muchas veces hay que preparar datos y gestionar tiempos. Aquí entran los nodos de transformación y control.

### ¿Cómo transformar datos con nodos especializados?
Sirven para limpiar, adaptar y estandarizar información. El más usado es edit fields.

Renombrar campos para mantener consistencia.
Cambiar formatos de fechas o números.
Dejar datos listos para pasos posteriores.
Habilidades que ejercitas: normalización de datos, mapeo de campos y preparación para integración.

### ¿Cómo controlar tiempos, repeticiones y errores?
Gestiona cuándo y cuántas veces ejecutar, y qué hacer si algo falla. Usa wait, loop over items y error trigger.

- Esperar un día antes de realizar una acción con wait.
- Repetir una acción para cada elemento de una lista con loop over items.
- Capturar errores y reaccionar con error trigger.
- Habilidades que desarrollas: control de flujos, manejo de errores y orquestación de procesos.

En conjunto, estos cinco tipos de nodos te permiten construir casi cualquier flujo y combinarlos a tu ritmo para automatizar con confianza. ¿Qué automatización te gustaría crear primero? Cuéntalo en los comentarios y comenta dónde te gustaría aplicar trigger, acción, condición o wait.


----

## Buenas prácticas

## Resumen
Optimiza tu automatización en n8n con un proceso claro y sin fallos. Aquí aprenderás a renombrar nodos, probar expresiones, verificar condiciones con IA, etiquetar por departamento y activar en producción. Todo enfocado en que tu flujo sea entendible y estable.

¿Cómo dejar listo tu workflow en n8n?
Para garantizar calidad, aplica una secuencia simple: nombra bien, prueba paso a paso, valida condiciones, organiza con etiquetas y publica. Así evitas errores y aseguras que cualquiera del equipo sepa qué hace cada nodo.

¿Cómo renombrar nodos de forma clara?
Usa la tecla space para renombrar más rápido que con el menú contextual.
Nombra con intención: trigger formulario, normalizar datos, excluir Platzi, clasificar mensaje.
Describe función y resultado: qué entra, qué sale y por qué importa.
Mantén consistencia de nombres para facilitar el debug.
¿Cómo testear expresiones y flujos?
Asegúrate de tener datos congelados en pin: se ven en morado.
Ejecuta con execute workflow para recorrer el camino actual.
Abre el nodo inicial (trigger): normalmente no requiere verificación.
Avanza nodo a nodo con la navegación lateral: adelante y atrás sin cerrar ventanas.
Confirma que las expresiones estén en verde en cada paso.
Repite en todos los caminos del flujo para evitar errores ocultos.
¿Cómo verificar condiciones y salidas?
Revisa el condicional de exclusión: excluir correos con arroba Plaxi respecto a un correo como promptandplay@gmail.com.
Valida el enrutamiento por intención con IA: demo, info, soporte, compra.
En el switch, alinea nombres de salidas con las condiciones: demo con demo, etc.
Elige el campo correcto: usa la output del nodo de inteligencia artificial si cambiaste la fuente.
Haz clic en la condición para ver su información prevista antes de aceptar.
¿Cómo organizar y encontrar tus automatizaciones?
Un buen nombre y un sistema de etiquetas te ahorran tiempo cuando crece el número de flujos. Además, comunican propósito y dueño sin explicaciones extra.

¿Cómo nombrar y etiquetar el flujo?
Cambia el nombre genérico por uno descriptivo: clasificador inteligente de leads.
Añade tags para filtrar por departamento o uso.
Crea la etiqueta “ventas” si no existe y aplícala.
En la vista principal de n8n, filtra por tags y encuentra el flujo al instante.
¿Cómo publicar en producción y validar ejecuciones?
Trabajar en test y pasar a producción requiere un cambio simple pero crítico. Activa tu workflow, prueba con datos reales y valida resultados desde la vista de ejecuciones.

¿Cómo activar y probar en producción?
Cambia de la URL de test a la URL de producción.
Activa el flujo con el switch superior hasta ver la confirmación.
Abre la URL, completa el lead: nombre, correo y mensaje como “Quiero una demo”.
Tras enviar, el canvas no mostrará en verde lo ocurrido en producción: es normal.
¿Cómo revisar ejecuciones y datos?
Entra a la vista de ejecuciones para ver historial y estado.
Identifica pruebas de test con el icono de probeta.
En producción no aparece ese icono: así distingues entornos.
Abre una ejecución y revisa los datos usados, por ejemplo el texto “Quiero una demo”.
¿Te animas a mejorarlo? Agrega una nota útil, ajusta un nombre o refina una condición. Comparte una captura y cuéntanos qué cambio hiciste y por qué.