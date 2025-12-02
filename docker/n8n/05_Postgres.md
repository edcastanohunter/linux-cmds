Resumen
Domina cómo conectar un agente de IA en N8N a Postgres para ejecutar consultas con lenguaje natural y validar resultados con SQL. En pocos pasos, configurarás el chat público, enlazarás el AI Agent con OpenAI, elegirás la herramienta correcta de Postgres y obtendrás respuestas comprobables como el empleado con mayor antigüedad o el departamento con más integrantes.

¿Cómo configurar N8N con un agente de IA para Postgres?
La clave es armar un flujo simple pero preciso. Se inicia con un trigger del chat por defecto de N8N y se habilita la opción Make chat public available para poder preguntar de forma pública. Luego se añade el agente por defecto, AI Agent, y se conecta con el “cerebro” de OpenAI. Después, se incorpora un prompt que indica: consultar en Postgres lo que se pregunte por chat y devolver el resultado. Se guarda y se agrega la herramienta de base de datos correcta.

Usa Postgres Tool, no Postgres PG Vector Store. La primera es vectorial para contexto; aquí necesitamos consultas SQL directas.
Conecta OpenAI y el AI Agent. Mantén la configuración por defecto si las entradas vienen del chat.
Agrega un prompt claro. La instrucción es consultar en Postgres según la pregunta y entregar el resultado.
¿Qué herramienta Postgres debes elegir?
Para consultas SQL normales se selecciona la opción Postgres Tool. Evita Postgres PG Vector Store, ya que es una base vectorial para almacenar trozos de texto y dar contexto, no para ejecutar queries transaccionales.

¿Cómo definir credenciales y operación select?
Se crean credenciales nuevas: host (expuesto con Ngrok), base de datos, usuario “admin”, password “admin123” (solo para pruebas), y port 10404 en lugar del 5432 por defecto. Se guarda, se renombra (por ejemplo: “base de datos empleados”) y se vuelve al nodo. En la operación, se elige Select: no insertar, borrar ni actualizar.

Operación: Select para lectura de datos.
Schema: por defecto, “public” (según el entorno).
Tabla: puedes fijar una o dejar que el agente elija según la pregunta.
Parámetros útiles: limitar resultados, seleccionar campos, filtrar filas y crear combinaciones.
Activa el flujo para probar el chat público: abre la URL y verifica que funcione. También puedes usar el chat de prueba dentro de N8N para ver cada interacción con la herramienta y entender cómo “piensa” el agente.

¿Cómo hacer preguntas en lenguaje natural y verificar con SQL?
El flujo permite preguntar en español y que el agente construya las queries correctas en Postgres. Verás cada consulta ejecutada, lo que facilita auditar y aprender del proceso. Luego, puedes validar manualmente en la interfaz de la base de datos.

¿Qué ejemplo muestra el empleado con más antigüedad?
Se pregunta: “¿cuál es el empleado que más tiempo lleva en la empresa?”. El agente responde: Javier Díaz, contable senior, ingresó el 22 de abril de 2017. Para verificar, se corre una consulta equivalente que ordena por la fecha de ingreso y trae el más antiguo:

-- Empleado con mayor antigüedad
SELECT *
FROM empleados
ORDER BY fecha_ingreso ASC
LIMIT 1;
¿Cómo encontrar el departamento con más empleados?
Se consulta: “¿cuál es el departamento con más empleados?”. El agente ejecuta varias queries (uniendo departamentos y empleados) y responde: ingeniería tiene 3 personas. Puedes contrastarlo con una unión y conteo por departamento:

-- Departamento con más empleados
SELECT d.nombre AS departamento, COUNT(e.id) AS total
FROM departamentos d
JOIN empleados e ON e.departamento_id = d.id
GROUP BY d.nombre
ORDER BY total DESC
LIMIT 1;
Transparencia: N8N muestra cada query ejecutada por el agente.
Confianza: valida en la interfaz gráfica copiando y ejecutando la consulta.
Rapidez: del lenguaje natural a SQL en segundos.
¿Qué habilidades y conceptos clave aparecen y por qué importan?
Comprender estos elementos asegura flujos robustos y confiables.

Configuración del chat público: habilitar Make chat public available para recibir preguntas externas.
Agente de IA y prompt eficaz: instrucción clara para consultar Postgres y devolver resultados precisos.
Conexión con OpenAI: enlazar el nodo del agente al “cerebro” para interpretar lenguaje natural.
Elección de herramienta: usar Postgres Tool para SQL; no confundir con Postgres PG Vector Store.
Credenciales correctas: host vía Ngrok, usuario “admin”, password “admin123” (solo pruebas), port 10404.
Buenas prácticas de seguridad: la password de ejemplo no es segura; se usa solo para testeo.
Operación de solo lectura: Select para evitar insertar, borrar o actualizar por error.
Schema y tablas: “public” por defecto; opción de dejar que el agente detecte tablas necesarias.
Uniones entre tablas: combinar “departamentos” y “empleados” para métricas como conteos.
Observabilidad del flujo: ver cada query ayuda a auditar y a aprender del comportamiento del agente.
Lenguaje natural a SQL: preguntas como “empleado más longevo” o “departamento con más empleados” resueltas al instante.
¿Quieres que prepare ejemplos adicionales de prompts o queries para tus propios esquemas de empleados y departamentos? Cuéntame tus tablas y campos y lo armamos juntos.