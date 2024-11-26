# dotToSvg

- _dotToSvg(dotGraph, layoutEngine)_

Ask the _Graphviz_ graph drawing system to translate a _dot_ language graph into an _Svg_ drawing.
The _layoutEngine_ selects which algorithm to request the system utilise.
The _dot_ algorithm draws directed graphs,
the _neato_ algorithm draws undirected graphs.

~~~
let dotGraph = 'digraph { a -> b; a -> c; b -> d; c -> d }';
let layoutEngine = 'dot';
dotGraph.dotToSvg(layoutEngine).then { :answer |
	answer.postLine
}
~~~
