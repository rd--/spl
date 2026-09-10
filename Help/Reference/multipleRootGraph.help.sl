# multipleRootGraph

- _multipleRootGraph(u, v)_

Evaluates to the unit generator _u_ after attaching another unit generator, _v_, to it.

This ensures that _v_ is included in the graph of which _u_ is a part,
in cases where it would otherwise not be discovered by traversing the completed graph.

Required where graphs have multiple end points, such as graphs using `LocalOut` &etc.

The binary operator `<!` is an alias.

* * *

See also: <!, FirstArg
