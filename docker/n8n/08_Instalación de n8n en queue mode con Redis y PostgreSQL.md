## Resumen
Lleva n8n a producción con un despliegue robusto en queue mode usando Redis como sistema de colas y Postgres como base de datos externa. Siguiendo estos pasos prácticos, configurarás servicios separados de main y worker, activarás la encriptación de credenciales y validarás la cola con un flujo de prueba. Todo con Docker Compose.

### ¿Cómo instalar n8n en queue mode con Docker, Redis y Postgres?
Prepara el entorno reutilizando los ficheros .env y docker-compose previos. El objetivo es que main orqueste y worker ejecute las tareas, descargando la carga de procesos y manteniendo la interfaz estable.

- Genera una “n8n encryption key” larga para encriptar credenciales. Puedes usar un generador como [randomkeygen.com](https://randomkeygen.com/) o un comando con openssl. Añádela al .env.
- Renombra el servicio n8n a n8n main en docker-compose. Mantén Postgres como base externa.
- Agrega Redis como sistema de colas con imagen 6, reinicio always, puerto 6379 mapeado y volumen persistente para datos.

```yaml
docker-compose.yml (fragmento)
services:
  redis:
    image: redis:6
    container_name: n10-redis
    restart: always
    ports:
      - "6379:6379"
    volumes:
      - ./redis-data:/data
```

### ¿Qué variables de entorno activar en main?
Configura variables esenciales para que main no ejecute workflows y use la cola.

- executions_mode: queue. Señala que el nodo principal no ejecuta, solo orquesta.
- queue bull redis host y puerto 6379: apunta al servicio Redis definido.
- encryption key: usa la del .env para proteger credenciales.
- Autenticación del editor de n8n: activa auth, define usuario admin y contraseña (solo a modo de prueba).
- n10 runners enabled: habilita los “task runners” para ejecutar el código (p. ej., JavaScript task runner).
-   offload manual executions to worker: envía ejecuciones manuales al worker.


### ¿Cómo definir el worker y su concurrencia?
Duplica la definición de n8n main para crear n8n worker y ajusta su rol de ejecución.

- depends_on: añade Redis y Postgres tanto en main como en worker.
- env_file: referencia .env en ambos servicios para mantener consistencia.
- command del worker: worker --concurrency=1. Controla cuántas ejecuciones paralelas por worker (ejemplo: 1).
- worker mode: true. Indica que este contenedor es el ejecutor.
- Puertos: no expongas el 5678 en el worker; déjalo solo en main.
- container_name: usa nombres únicos (por ejemplo, n8n-main y n8n-worker) para evitar conflictos.
- Volúmenes: incluye los de Postgres, n8n y el de Redis persistente.

```yaml
docker-compose.yml (fragmento)
services:
  n8n-main:
    depends_on:
      - postgres
      - redis
    env_file: .env
    ports:
      - "5678:5678"
    # environment: [executions_mode=queue, ...]

  n8n-worker:
    depends_on:
      - postgres
      - redis
    env_file: .env
    command: worker --concurrency=1
    # environment: [worker mode=true, offload manual executions to worker, ...]
    # sin puertos expuestos
```

### ¿Cómo verificar que los servicios se levantan y que la cola funciona?
Inicia los servicios y revisa logs para confirmar URL de acceso, registro del worker y estado de Redis y Postgres. La verificación temprana evita errores de configuración.

### ¿Cómo lanzar y depurar con Docker Compose?
Arranca todo con: docker compose up.
Si aparece error por “container name n8n”, cambia los nombres a n8n-main y n8n-worker.
Recuerda: el worker no debe exponer el puerto 5678; bórralo si lo copiaste.
Usa Docker Desktop o la command line para ver logs de cada servicio.

```bash
docker compose up

```

### ¿Qué señales confirman que todo está ok?
- En n8n main: aparece la URL de acceso para registro.
- En n8n worker: se registra un “JavaScript task runner”; verás que toma nuevas tareas.
- En Redis: mensaje “ready to accept connections”.
- En Postgres: listo para aceptar conexiones.

### ¿Cómo probar el encolado con un workflow de cron y espera?
- Accede a http://localhost:5678 y crea la cuenta inicial.
- Crea un workflow “start from scratch”.
- Añade un nodo cron que dispare cada segundo.
- Añade un nodo wait de 15 segundos antes de finalizar.
- Actívalo: se generará un flujo por segundo; con concurrencia 1, muchos quedarán en “pending”.
- Observa en los logs de main los envíos a cola y en los de worker la ejecución de jobs 1, 2, 3, etc.

### ¿Cómo inspeccionar Redis para ver la cola?
- Conéctate al servicio Redis en localhost y puerto 6379 (sin usuario ni contraseña en el ejemplo).
- Revisa las listas: “bool jobs active” y “bool jobs wait”.
- En “wait” verás ejecuciones en cola; en “active”, las que se están procesando ahora.

### ¿Cómo escalar a múltiples workers en queue mode?
Cuando tengas el flujo encolando, escala horizontalmente más workers para aumentar el paralelismo de ejecución.

```bash
# Escalar workers (ejemplos)
docker compose up --scale n8n-worker=2
# o 3, 4, 5, según necesites
```