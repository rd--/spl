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

* * *

See also: setPartitions

Guides: Plotting Functions

Further Reading: Dower 1971
