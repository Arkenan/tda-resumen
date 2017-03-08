# Heaps

Queremos implementar una cola de prioridad eficiente. Que agregar o quitar un elemento sea a lo sumo O(logn) y mirar el mínimo sea O(1). Esto no es posible ni con arrays ordenados (donde quitar es O(n) por el reorden) o listas con puntero al mínimo (donde quitar es O(n) por buscar el nuevo mínimo o colocar un elemento donde corresponda).

## Idea de estructuras

Se utiliza un árbol binario donde se cumple la propiedad de **orden de heap**: _Cada padre es menor que cualquiera de sus hijos_.

## Representación (opciones)

1. Punteros. Árbol con nodos que apuntan a sus hijos y a sus padres. Fácilmente expandible, pero complicado y de acceso lento.
2. Si se conoce una cota superior a la cantidad de elementos que tendrá la cola, se puede implementar directamente sobre un **array**.

La implementación que usaremos es la segunda. En ella, el primer elemento es la raíz. El segundo y el tercero son el primer nivel de hijos. Los siguientes 4, son a su vez, los hijos de estos.

Es decir, para
