1️⃣ Qué es un subworkflow

Definición: Un subworkflow es un workflow independiente invocado desde otro workflow principal.
Analogía: Funciona como una función en programación: recibe parámetros, ejecuta lógica interna y devuelve una respuesta.
Objetivo: Mantener el flujo principal limpio, modular y fácil de mantener.
Beneficio: Permite reutilizar procesos comunes (por ejemplo validaciones, formateo de datos, llamadas a APIs) sin duplicar nodos.
2️⃣ Cómo pensarlo: función → lógica → respuesta

Input claro: Se pasa un conjunto definido de datos (JSON u otros parámetros).
Lógica definida: El subworkflow hace su trabajo específico.
Respuesta concreta: Devuelve un resultado consistente para que el flujo principal continúe.
3️⃣ Nodo clave: Execute Workflow

Ubicación: Nodo de tipo “Execute Workflow” (antes “Execute to Workflow” en versiones previas).
Ejecución: Llama al workflow objetivo de forma síncrona.
Salida: Los datos devueltos por el último nodo del subworkflow (ideal para encadenar).
Configuraciones importantes:
Wait for Completion: (por defecto) Espera a que termine el subworkflow antes de continuar.
Forward Input Data: Permite enviar automáticamente los datos entrantes como input del subworkflow.
Additional Fields / Static Data: Pasar parámetros extra si es necesario.
4️⃣ Datos devueltos por el subworkflow

Se recibe un array de items JSON con la salida del último nodo.
Si hay varios items en el subworkflow, se devuelven todos; si solo uno, un único item.
Se puede mapear la salida directamente a nodos posteriores del flujo principal.
5️⃣ Buenas prácticas para subworkflows profesionales

Diseña el input y output de forma explícita: agrega nodos Set al inicio y al final del subworkflow para normalizar la estructura.
Versiona y documenta los subworkflows: así sabes qué versión está usando cada flujo principal.
Usa nombres claros: tanto en los workflows como en los nodos para mantener trazabilidad.
Gestión de errores: añade nodos de captura o rutas de error para que no “rompan” el flujo principal.
Prueba individualmente: ejecuta primero el subworkflow solo, valida la salida, luego intégralo.
Logs y auditoría: agrega $execution.id y $workflow.name en tus logs para rastrear subworkflows en producción.
6️⃣ Ventajas reales

Reutilización: Construir un subworkflow para autenticación de API y reutilizarlo en todos tus flujos.
Escalabilidad: Menos nodos en el flujo principal → más fácil de mantener.
Colaboración: Diferentes equipos pueden mantener subworkflows específicos sin tocar el principal.
Tiempo de desarrollo reducido: Cambias el subworkflow y automáticamente todos los workflows que lo usan reciben la mejora.
7️⃣ Riesgos y consideraciones técnicas

Dependencias: Si cambias la estructura del output de un subworkflow puedes romper los workflows que lo consumen.
Performance: Cada “Execute Workflow” es una ejecución adicional; evita llamar a subworkflows muy pesados dentro de bucles intensivos.
Permisos y credenciales: Asegúrate de que el subworkflow tiene acceso a las credenciales necesarias.
Monitoreo: Usa Execution Logs en n8n para rastrear ejecuciones anidadas.
8️⃣ Referencias oficiales

n8n Docs – Execute Workflow Node
Best Practices for Workflows

---- 

Impulsa tu automatización en n8n creando un subworkflow reutilizable que integra inteligencia artificial para clasificar mensajes y devolver una salida JSON consistente. Aquí verás, paso a paso, cómo definir entradas, configurar un AI Agent, normalizar datos con Set y consumir el subworkflow desde el flujo principal para responder por webhook.

¿Cómo crear un subworkflow en n8n y definir entradas?
Un subworkflow es parte clave de la arquitectura del workflow: encapsula lógica reutilizable y se ejecuta desde otro flujo. El proceso es similar a crear un workflow normal, con la diferencia de su trigger.

Crea un Workflow y añade el nodo Subworkflow como primer paso.
Elige el trigger: when executed by another workflow.
Define las entradas con add fields: crea el campo mensaje como tipo texto.
Guarda para asegurar la configuración inicial.
¿Qué trigger usar para subworkflow reusable?
Usa el trigger “when executed by another workflow”.
Esto permite que otro flujo invoque el subworkflow con datos.
¿Cómo definir el campo mensaje como texto?
En add fields, selecciona “texto”.
Aceptar “cualquier cosa” no es necesario: aquí es un string claro.
¿Cómo probar con datos congelados en el trigger?
Doble clic en el trigger y entra a la opción json.
Edita el valor de “mensaje” con el lápiz y guarda.
Verás el nodo en morado: hay dato congelado para testear.
¿Cómo integrar un agente de IA para clasificar mensajes?
Añade un AI/EI Agent para decidir si el mensaje va a IT, legal, facilities u otro. Configurar bien la fuente, el system message y el modelo evita errores y hace la salida predecible.

Fuente de datos: selecciona “define below” para usar el valor dinámico.
Mensaje dinámico: referencia el campo del trigger con una expresión.
Prompt de sistema: instrucción clara con categorías y formato de salida.
Modelo y credenciales: conecta OpenAI y elige GPT-4.1 mini.
¿Qué expresión usar para pasar el mensaje dinámico?
Utiliza la expresión que apunta al campo de entrada “mensaje”:

{{ $json.mensaje }}
Asegura que exista el valor al testear: usa el dato congelado en el trigger.
¿Cómo redactar el system message para categorías?
Indica la tarea, el conjunto de clases y la restricción de formato:

clasifica el siguiente mensaje según su tema: it, legal, facilities u otro. devuelve solo una palabra en minúscula.
Si el nodo está en rojo, falta el modelo: selecciona credenciales y modelo.
Conectar OpenAI y elegir GPT-4.1 mini deja el nodo en gris: sin error.
¿Cómo asegurar salida consistente con Require Specific Output Format?
Activa Require Specific Output Format y añade un Output Parser. Define un ejemplo de JSON con las claves deseadas para guiar la respuesta del modelo.

{
  "Categoría": "it",
  "confianza": "alta"
}
Esto fuerza una estructura de salida estable.
Verifica con Ejecutar: el agente debe devolver ambas claves.
¿Cómo consumir el subworkflow desde el flujo principal y responder por webhook?
Una vez probado, integra el subworkflow en tu flujo principal. Así podrás clasificar en caliente y responder desde el webhook con los datos limpios.

Añade el nodo Subworkflow como acción tras la lógica que decide si clasificar.
Origen: database y selección by ID para apuntar al subworkflow correcto.
Usa Execute previous nodes y envía una petición para generar datos.
Mapea el campo mensaje hacia la entrada del subworkflow.
Normaliza la salida con Set/Edit Fields: elimina prefijos como “output.” y conserva “Categoría” y “confianza”.
¿Cómo vincular por ID y mapear el campo mensaje?
Copia el ID del subworkflow y pégalo en el nodo Subworkflow del flujo principal.
Tras ejecutar nodos previos, arrastra el campo mensaje hacia el parámetro “mensaje”.
¿Cómo normalizar con set y construir la respuesta?
En Set, arrastra “Categoría” y “confianza”; elimina “output.” del path.
En el nodo de webhook/función de respuesta, agrega ambas claves al JSON de salida mediante arrastrar y soltar desde “edit fields”.
Ejemplo de respuesta esperada:

{
  "Categoría": "it",
  "confianza": "alta"
}
Prueba con una nueva petición: deberías ver Categoría y confianza como parte de la respuesta.