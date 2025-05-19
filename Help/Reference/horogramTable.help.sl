# horogramTable

- _horogramTable(aList)_

Answer an `Html` table showing a rectangular Wilson horogram of the interval sequences at _aList_,
which should each sum to the same value,
and should contain only integer steps.
A final row of unit divisions of the period is automatically appended.

~~~spl html=A
[
	4;
	1 3;
	1 1 2
].horogramTable
~~~

<table style="width: 100%; border: solid 1px black"><tbody>
<tr><td colspan="4">4</td></tr>
<tr><td>1</td><td colspan="3">3</td></tr>
<tr><td>1</td><td>1</td><td colspan="2">2</td></tr>
<tr><td>1</td><td>1</td><td>1</td><td>1</td></tr>
</tbody></table>

A table of the _5/12_ moment of symmetry scale construction:

~~~spl html=B
[
	5 7;
	5 5 2;
	3 2 3 2 2;
	1 2 2 1 2 2 2
].horogramTable
~~~

<table style="width: 100%; border: solid 1px black"><tbody>
<tr><td colspan="5">5</td><td colspan="7">7</td></tr>
<tr><td colspan="5">5</td><td colspan="5">5</td><td colspan="2">2</td></tr>
<tr><td colspan="3">3</td><td colspan="2">2</td><td colspan="3">3</td><td colspan="2">2</td><td colspan="2">2</td></tr>
<tr><td>1</td><td colspan="2">2</td><td colspan="2">2</td><td>1</td><td colspan="2">2</td><td colspan="2">2</td><td colspan="2">2</td></tr>
<tr></tr>
<tr><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td></tr>
</tbody></table>

* * *

See also: horogramDrawing, Html, integerPartitionsTable, momentOfSymmetry, rectangularHorogramDrawing

Guides: Scale Functions, Xenharmonic Functions

_Xenharmonic_
[1](https://en.xen.wiki/w/Horogram)
