# isSingleton

- _isSingleton(x)_

Answer `true` if the object _x_ is a singleton.

At `List`:

```
>>> [1].isSingleton
true

>>> [].isSingleton
false

>>> [1 2 3].isSingleton
false
```

At `Set`:

```
>>> {|1|}.isSingleton
true
```

At `Record`:

```
>>> (x: 1).isSingleton
true
```

At `Graph`, a singleton has one vertex and no edges.
The singleton graph is the graph consisting of a single isolated node with no edges.
It is therefore the empty graph on one node.
It is commonly denoted _K1_ (i.e., the complete graph on one node).

```
>>> Graph([1], []).isSingleton
true

>>> 1.completeGraph.isSingleton
true
```

* * *

See also: completeGraph, Graph, isEmpty, size

Guides: Graph Functions, List Functions, Set Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SingletonGraph.html),
_W_
[1](https://en.wikipedia.org/wiki/Singleton_(mathematics))

Categories: Testing, Graph
