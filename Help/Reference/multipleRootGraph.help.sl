# multipleRootGraph

- _multipleRootGraph(aUgen, anotherUgen)_

Evaluates to _aUgen_ after attaching _anotherUgen_ to it.

This ensures that _anotherUgen_ is included in the graph of which _aUgen_ is a part,
in cases where it would otherwise not be discovered by traversing the completed graph.

Required where graphs have multiple end points, such as graphs using `LocalOut` &etc.

* * *

See also: <!, FirstArg
