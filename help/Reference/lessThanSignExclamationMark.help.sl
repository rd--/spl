# <!

- _aUgen <! anotherUgen_

Evaluates to _aUgen_ after attaching _anotherUgen_ to it.

Ensures _anotherUgen_ is included in the graph of which _aUgen_ is a part in cases where it would otherwise not be discovered by traversing the completed graph.

Required where graphs have multiple end points, such as graphs using _LocalOut_ &etc.

_Note_:
This uses FirstArg where _anotherUgen_ has output ports,
else it uses multipleRootGraph.

* * *

See also: FirstArg, multipleRootGraph

Categories: First argument
