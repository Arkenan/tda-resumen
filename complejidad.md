# Eficiencia

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
