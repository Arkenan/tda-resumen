# Análisis de Algoritmos
Nos interesa como crece un problema en tiempo y espacio cuando crece su entrada. La idea es conseguir una noción independiente de la plataforma y que permita comparar.

En general nos va a interesar el **peor caso** de los algoritmos, aunque a veces analizaremos el mejor o el promedio si los casos patológicos son muy pocos. Los generadores aleatorios de problemas para el "**caso promedio**" pueden ser bastante malos, ya que las instancias reales de un problema no suelen ser aleatorias y los espacios de problemas demasiado grandes como para randomizar.

Una primera aproximación a "bueno" o "malo" suele ser la comparación con una búsqueda de fuerza bruta sobre todo el espacio de soluciones. Esto siempre se puede hacer, es trivial y muy ineficiente. Se quiere que el algoritmo pensado sea al menos analíticamente mejor, es decir, que provea más información sobre la naturaleza del problema.

Se considera eficiente a un algoritmo que tiene un tiempo de ejecución polinomial respecto al tamaño de la entrada. Hay excepciones.

## Orden de crecimiento de una función

### Cota Superior Asintótica $O$
Qué significa que $T(n)$ sea "del orden de" $f(n)$?

\begin{equation}
T(n) \in O(f(n)) \Leftrightarrow c > 0 , n_0 \ge 0 / \forall n \ge n_0: T(n) \le c f(n)
\end{equation}

Esto significa que $f$ es una _cota superior asintótica_ para $T$.

### Cota Inferior Asintótica $\Omega$

Del mismo modo, se define un equivalente para una función que acota inferiormente a otra.

\begin{equation}
T(n) \in \Omega(f(n)) \Leftrightarrow c > 0 , n_0 \ge 0 / \forall n \ge n_0: T(n) \ge c f(n)
\end{equation}

### Ajuste Asintótico $\Theta$

Si una función T es acotada superior e inferiormente por f, entonces f _ajusta_ a T.

\begin{equation}
T(n) \in \Omega(f(n)) \land T(n) \in O(f(n)) \Leftrightarrow T(n) \in \Theta(f(n))
\end{equation}

## Propiedades

- Transitividad de $O$: $f = O(g) \land g = O(h) \Rightarrow f = O(h)$
- Transitividad de $\Omega$: $f = \Omega(g) \land g = \Omega(h) \Rightarrow f = \Omega(h)$
- Transitividad de $\Theta$: $f = \Theta(g) \land g = \Theta(h) \Rightarrow f = \Theta(h)$
- Suma: $f_1, ..., f_k = O(h) \Rightarrow f_1+...+f_k = O(h)$
  - La suma implica que la multiplicación por una constante también mantiene el orden.
- $f,g$ funciones no negativas, $g = O(f) \Rightarrow f+g=O(f)$
- $f = O(g) \Rightarrow g = \Omega(f)$

## Órdenes típicos

### Polinomios
Todos los polinomios de grado $p$ son $\Theta(n^p)$.

### Logaritmos
Los logaritmos para un mismo número $n$ tienen todos el mismo orden asintótico, sin importar la base, gracias a la propiedad

\begin{equation}
  \log_a n = \frac{log_b n}{log_b a}
\end{equation}

Por esto suelen escribirse los órdenes logarítmicos sin explicitar la base.

### Exponenciales

Los exponenciales son todos distintos entre sí, pero cualquier exponencial acota superiormente a un polinómico, así como cualquier polinómico acota superiormente a un logarítmico.

Por este motivo, a veces se dice "exponencial" sin aclarar la base. No por su equivalencia, sino por su falta de eficiencia.
