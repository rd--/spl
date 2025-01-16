# dotLayout

- _dotLayout(dotGraph, outputFormat, layoutEngine)_

Ask the _Graphviz_ graph drawing system to translate a _dot_ language graph into the specified _outputFormat_.

Output formats include _svg_, _dot_, _json_ and _plain_.

The _layoutEngine_ selects which algorithm to request the system utilise.
Layout engines include _dot_, _neato_, _fdp_ and _nop_.
The _dot_ algorithm draws directed graphs,
the _neato_ algorithm draws undirected graphs.

Print the _plain_ form of the graph layout:

~~~
let dotGraph = [
	'digraph {'
	' a -> b;'
	' a -> c;'
	' b -> d;'
	' c -> d'
	'}'
].unlines;
dotGraph.dotLayout(
	'plain',
	'dot'
).then { :answer |
	answer.postLine
}
~~~

Draw graph:

~~~spl svg=A
let dotGraph = [
	'digraph {'
	' graph [size=1.5];'
	' graph [bgcolor=transparent];'
	' node [shape=circle];'
	' edge [arrowsize=0.5];'
	' a -> b; a -> c; b -> d; c -> d'
	'}'
].unlines;
dotGraph.dotLayout(
	'svg',
	'dot'
).then { :answer |
	answer.Svg
}
~~~

![](sw/spl/Help/Image/dotLayout-A.svg)

In _Small Kansas_ the following will display an _Svg_ drawing of the graph:

~~~
let dotGraph = [
	'digraph {'
	' a -> b;'
	' a -> c;'
	' b -> d;'
	' c -> d'
	'}'
].unlines;
dotGraph.dotLayout(
	'svg',
	'dot'
).then { :answer |
	system.smallKansas.SvgViewer(
		'Dot Drawing',
		answer.parseSvg,
		system.smallKansas.where
	)
}
~~~

* * *

See also: Graph, SmallKansas
