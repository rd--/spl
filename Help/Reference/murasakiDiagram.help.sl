# murasakiDiagram

- _murasakiDiagram(p)_

Answer a drawing of the Murasaki diagram of the set partition _p_.
Murasaki diagrams are also called Genji-mon (源氏紋).
Draws arbitrary set partitions,
not only partitions of five.

Does not agree with the traditional drawings in four cases.

Suma (須磨):

~~~spl svg=A
[1 3 4; 2 5].murasakiDiagram
~~~

![](sw/spl/Help/Image/murasakiDiagram-A.svg)

Hatsune (初音):

~~~spl svg=B
[1 3; 2 4; 5].murasakiDiagram
~~~

![](sw/spl/Help/Image/murasakiDiagram-B.svg)

Yūgiri (夕霧):

~~~spl svg=C
[1 4; 2; 3 5].murasakiDiagram
~~~

![](sw/spl/Help/Image/murasakiDiagram-C.svg)

Nioumiya (匂宮):

~~~spl svg=D
[1 2 4; 3 5].murasakiDiagram
~~~

![](sw/spl/Help/Image/murasakiDiagram-D.svg)

A three-partition of six:

~~~spl svg=E
[1 2 6; 3 5; 4].murasakiDiagram
~~~

![](sw/spl/Help/Image/murasakiDiagram-E.svg)

Plot the set partitions of four,
enumerated by the Dyck words:

~~~spl svg=F
4.dyckWords.collect { :w |
	DyckWord(w)
	.setPartition
	.murasakiDiagram
}.reshape([2 7]).PlotSet
~~~

![](sw/spl/Help/Image/murasakiDiagram-F.svg)

Plot the non-crossing set partitions of four,
enumerated by the Dyck words:

~~~spl svg=G
4.dyckWords.collect { :w |
	DyckWord(w)
	.noncrossingPartition
	.murasakiDiagram
}.reshape([2 7]).PlotSet
~~~

![](sw/spl/Help/Image/murasakiDiagram-G.svg)

* * *

See also: noncrossingPartition, setPartition, setPartitions

Guides: Combinatorial Functions, Plotting Functions

Further Reading: Dower 1971
