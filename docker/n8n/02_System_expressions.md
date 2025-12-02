### Resumen
Domina las expresiones de sistema de n8n para construir flujos profesionales y fiables. Con ellas puedes leer datos del nodo actual, identificar cada ejecución, incorporar el nombre del workflow o usar la fecha actual. Todo con doble llave {{ }}, expresiones de JavaScript y con previsualización del resultado en tiempo real.

### ¿Qué son y por qué importan las expresiones de sistema de n8n?
Las expresiones de sistema te permiten inyectar datos dinámicos en cualquier campo. Así evitas valores fijos y documentas mejor cada paso.

- Acceder a datos del nodo con $json.
- Identificar la ejecución con $execution.id para auditorías y errores.
- Obtener metadatos con $workflow.name.
- Usar fecha y hora actuales con $now.
- Referenciar nodos por nombre con $node['Nombre'] y la sintaxis moderna $item.json.

### ¿Cómo acceder a los datos del nodo con $json?
Cuando abres un campo en edit fields, activa "expressions" y usa doble llave.

Ejemplos usando los campos mensaje y prioridad definidos en edit fields:
```
{{ $json.mensaje }}
{{ $json.prioridad }}
```

- json apunta al nodo previo conectado.
Útil para leer los valores actuales sin configurar nada extra.

### ¿Cómo identificar la ejecución con $execution?
Necesitas un identificador único por corrida del flujo. Úsalo para logs, auditorías o rastreo de errores.
```
{{ $execution.id }}
```
Genera un ID único por ejecución.
Ideal para adjuntar en respuestas o en registros.

### ¿Cómo obtener metadatos y la fecha actual con $workflow y $now?
Incluye el nombre del workflow en mensajes o logs.

```
{{ $workflow.name }}
```
Trabaja con la fecha y hora actual. Puedes mostrarla en ISO o aplicar format.

```
{{ $now.toIso }}
{{ $now.format }}
```
Son expresiones de JavaScript, por lo que puedes encadenar métodos.
Visualiza a la derecha la previsualización del valor antes de guardar.

### ¿Cómo referenciar nodos por nombre sin romper el flujo?
Cuando insertas un nodo intermedio (por ejemplo, un set que añade categoría: IT), $json puede cambiar porque apunta al nodo directamente anterior. En cambio, $node['Nombre'] apunta por nombre y no se rompe al reordenar.

### ¿Por qué $json puede fallar al insertar nodos intermedios?
Si agregas un set entre el nodo "Editar" y tu campo actual, $json ya no es el mismo.

$json se actualiza al nodo inmediatamente anterior.
Un cambio en la cadena de nodos puede romper referencias como {{ $json.prioridad }}.

### ¿Cómo usar $node['Editar'] y la sintaxis moderna con $item.json?
Para apuntar al nodo "Editar" por nombre y leer prioridad:

{{ $node['Editar'].json.prioridad }}
En la sintaxis más moderna, se trabaja con $item y luego con json:

{{ $item.json.prioridad }}
En ambos casos verás el mismo valor cuando no hay nodos intermedios.
Con nodos añadidos, $node['Editar'] mantiene la referencia estable.

### ¿Qué práctica recomiendan para flujos estables?
Preferir $node['NombreDelNodo'] para datos críticos.
Usar $json cuando el orden de nodos no cambiará.
Documentar con $execution.id y $workflow.name en tus logs.
Normalizar fechas con $now.toIso.

### ¿Cómo replicar el ejercicio y consolidar el aprendizaje?
Configura un trigger manual, un edit fields con mensaje y prioridad, y un set final para ver valores. Luego:

- Prueba ``{{ $json.prioridad }}``y ``{{ $node['Editar'].json.prioridad }}`` en el set.
- Inserta un set intermedio que añada categoría: IT.
- Ejecuta el workflow y observa cómo $json se rompe mientras $node sigue correcto.
- Añade ``{{ $execution.id }}``, ``{{ $workflow.name }}`` y ``{{ $now.toIso }}`` a tus campos.