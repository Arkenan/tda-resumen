## Problema de prueba de resistencia
En una fábrica se quiere probar la resistencia de un jarro dejándolo caer desde una altura cada vez mayor en una escalera de $n$ escalones.

**Limitación**: Se tiene una cantidad limitada de jarros para la prueba y sí o sí debemos averiguar el n. Si no tuviéramos esta limitación, simplemente haríamos búsqueda binaria para llegar a la altura $n$ que define la resistencia en tiempo $O(log(n))$. Con esta limitación, sin embargo, la búsqueda binaria probablemente llegaría a gastar los jarros antes de averiguar la resistencia.

### Caso de 1 jarrón: Idea lineal

Para el caso de 1 solo jarro, por ejemplo, el único método de estar seguros de que no lo vamos a romper en vano, es empezar por el escalón más bajo e ir subiendo de a uno hasta que se rompa. De ese modo, si bien es un algoritmo lineal $O(n)$, sabremos la resistencia con seguridad.

### Caso General
Ahora, tenemos eficacia, pero no eficiencia. Si tenemos $k$ jarros, ¿Cómo generalizamos el algoritmo seguro para hacerlo lo más eficiente posible? Ideas:

1. **Búsqueda binaria** hasta que quede 1 solo jarrón. Luego búsqueda lineal en la sección que quede. ¿Cuál es el orden de esto? Haremos siempre $k-1$ divisiones por 2 y luego haremos un recorrido en el sector restante. Sería $O(\frac{n}{2^{k-1}})$.

2.
