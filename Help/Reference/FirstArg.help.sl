# FirstArg

- _FirstArg(a, b)_

Evaluates to the unit-generator _a_ after attaching another unit-generator _b_ to it.

This ensures that _b_ is included in the graph of which _a_ is a part,
even in cases where it would otherwise not be discovered by traversing the completed graph.

Required where graphs have multiple end points, such as graphs using `LocalOut` &etc.

* * *

See also: <!, multipleRootGraph

Guides: Unit Generators

Categories: Ugen
