### Casamientos Estables


Problema:

- n Personas con un ranking de las compañías en las que les gustaría trabajar en orden de preferencia.
- n compañías con un ranking de personas que querrían tomar en orden de preferencia.

Un modelo simplificado a este problema es el de matrimonios.

- Conjunto de n hombres $M = \{m_1, m_2, ..., m_n\}$
- Conjunto de n mujeres $W = \{w_1, w_1, ... , w_n\}$

Un par de matrimonios e inestable si hay un miembro de cada uno que prefiere al miembro opuesto del otro. Ej:

$(m1,w1)$ y $(m2,w2)$ donde $w2$ prefiere a $m1$ sobre $m2$ y $m1$ también prefiere a $w2$ sobre $w1$. Es inestable porque tenderá a desarmarse para que $m1$ y $w2$ mejoren su situación.

Qué es un __Matching__? Un conjunto de pares en $M \times W$. Particularmente un __Matching Perfecto__ es uno en el que cada elemento de $M$ y $W$ está en exactamente un par (si lo pensamos en grafos, el grado de cada vértice debe ser 1).

Nuestro objetivo para este problema es, dados $M$ y $W$, encontrar un __Matching Estable__, es decir que:

- Es Perfecto.
- No tener inestabilidades.

#### Solución:

Tenemos una idea greedy que detecte inestabilidades y las corrija.

- Inicialmente todos solteros.
Lo resolvemos para un grupo. Por ejemplo, hombres.
- Un hombre $m$ soltero le propone matrimonio a la mujer $w$ que está más alta en su rango.
  - Si $w$ está soltera, acepta.
  - Si $w$ está con $m'$, entonces decide:
    - Si $r_w(m) > r_w(m')$ entonces deshace su matrimonio y lo rehace con $m$
    - Si no, lo mantiene.

Hacemos esto para todos los hombres solteros. Si uno queda soltero porque su matrimonio quedó deshecho por otro, vuelve a la lista. El algoritmo termina cuando no haya hombres solteros (y por lo tanto tampoco mujeres).

#### El algoritmo termina siempre

A cada paso un hombre propone a una mujer que nunca le haya propuesto antes. Esto se debe a que si una mujer lo rechaza o lo abandona, entonces ha encontrado a un hombre de mayor preferencia y nunca bajará de ahí. Aquel hombre la eligió del tope de sus preferencias, con lo cual no buscará a otra.

De este modo, como hay a lo sumo $n^2$ propuestas posibles, este algoritmo tarda a lo sumo $n^2$ pasos. No tenemos el orden verdadero aún porque no sabemos con qué estructuras buscaremos.

#### El matching encontrado es Perfecto

En cada paso se elige a una mujer para un hombre, y si esta acepta, o estaba soltera o abandonó a su anterior marido, con lo cual nunca va a haber más de un hombre para una mujer ni más de una mujer para un hombre.

Nunca será posible que un hombre se quede sin nadie a quien proponerle, ya que esto implicaría que todas las mujeres tienen un hombre y contradiría el párrafo anterior.

Como el algoritmo se detiene cuando no hay hombres solteros, entonces tampoco habrá mujeres solteras, logrando un matching perfecto.

#### El matching encontrado no tiene inestabilidades

Supongamos que existe una inestabilidad. Esto implica:

_Un hombre $m_1$ prefiere a una mujer de mayor rango en su lista que la que tiene ($w_1$) y aquella ($w_2$) lo prefiere en su lista sobre su actual marido ($m_2$)_.

Esto no es posible, ya que para haber llegado a $w_1$, como los hombres proponen en orden de preferencia, ya antes le había propuesto a $w_2$ y esta o lo rechazó o lo abandonó. En cualquier caso, encontró un hombre de mayor rango y por lo tanto no le corresponde y la inestabilidad no existe.

#### Estrucutra

Necesitamos ver que estructuras usamos para acceder eficientemente a los datos.

Entradas:

- Lista de hombres, con sus preferencias.

- Lista de mujeres, con sus preferencias.

Si hay nombres, se puede usar un diccionario, pero solo para entrada y salida. Internamente conviene tenerlos en listas de enteros.

Para las __preferencias__ es sencillo, conviene tener dos matrices, una para las preferencias de las mujeres, una para las preferencias de los hombres, que representan los valores de la función y se accede a cada rango en O(1). El problema es que para cambiar la "siguiente mujer a elegir" esto no nos da alternativa fácil.

Entonces mantenemos una matriz, donde cada fila es un hombre, y en cada columna están sus preferencias en orden. Para hombres esto nos basta, ya que siempre accederemos en orden. Entonces guardámos un vector de índices de mujer actual a elegir para cada uno.

Para las mujeres, por otro lado, tenemos que consultar rápidamente su rango, con lo cual sí convendrá tener una matriz con el rango para acceder en O(1).

Luego, necesitamos tener una **lista de los solteros** para iterar hasta que esté vacía. Cómo no es importante el orden, una lista será suficiente (y probablemente la mejor opción).

Lo único que falta determinar es cómo almacenamos **los pares del matching**. Debemos poder consultar tanto para hombres como para mujeres, como para hombres. Pero para hombres solo hace falta consultar si está soltero, ya que si está en pareja no haremos nada con él. Entonces mantenemos:

- Para los hombres una **lista con la mujer siguiente a elegir** para cada uno (su índice en la matriz).

- Para las mujeres una **lista con la pareja actual** para cada una. -1 si está soltera. No usamos esto mismo para los hombres solteros ya que buscar un soltero podría hacerse O(n).

#### Implementación en pseudopython:

``` python
# inicialmente no hay pares en el matching.
solteros = M
casadas = [-1]*n

for m in M.rows():
  sig_muj[m] = 0


while solteros:
  # Elegimos a un soltero.
  m = solteros[-1]
  w = M[m][sig_muj[m]]
  mp = maridoActual[w]
  # Vemos si está disponible o si corresponde.
  if mp == -1:
    casadas[w] = m
    solteros.pop()
  elif rank[w][m] < rank[w][mp]:
    sig_muj[m] += 1
  else:
    maridoActual[w] = m
    solteros[-1] = mp #reemplazo, ya que sacaria uno y meteria al otro.
    sig_muj[mp] += 1
```
