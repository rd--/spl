# asDot

- _asDot(g)_

Answer a Dot language description of the graph _g_.

The three `cycleGraph`:

~~~
>> 3.cycleGraph.asDot
graph {
graph [layout="neato"];
graph [size="1.214,0.75",bgcolor="transparent"];
node [shape="point"];
edge [penwidth="0.75",arrowsize="0.5"];
/* implicit nodes */
1 -- 2;
2 -- 3;
1 -- 3;
}
~~~

* * *

See also: dotLayout, Graph
