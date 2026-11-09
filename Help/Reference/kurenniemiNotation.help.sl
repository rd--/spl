# kurenniemiNotation

- _kurenniemiNotation([p₁ p₂ …])_

Answer a `LineDrawing` showing the pitch list _p_ using Kurenniemi’s notation.

Staff and ledger lines are drawn in logarithmic space,
and pitches are drawn at precisely their pitch,
relative to C1 (the pitch three octaves below middle C).

> This system of notation does not use any accidentals. […] Observe
> that the spaces between staff lines are unequal. In the narrow space
> there is room for two pitch levels, in the large for
> three. (Kurenniemi 2015, p. 5)

Draw the twelve pitches of the `divisors` set of sixty:

~~~spl svg=A
60.divisors.kurenniemiNotation
~~~

![](Help/Image/kurenniemiNotation-A.svg)

The pitches in the drawing are _C1 C2 C3_, _G2 G3 G4_, _E3 E4 E5_ and _B4 B5 B6_.
Note that _G3_ is midway between the _F3_ and _A3_ lines,
there is space below for _F#3_ and space above for _G#3_.

The approximate pitches of a set of Gamelan instruments from Yogyakarta:

~~~spl svg=B
[
	1.4  2.1  2.3  2.7  3.2
	3.3  3.5  3.6  4.0  4.4
	4.6  4.9  5.2  5.3  6.1
	6.6  7.0  7.1  8.0  8.1
	9.0  9.2  9.7  9.8 10.5
	10.6 10.7 10.8 12.3 12.4
	12.5 13.3 14.1 14.2 14.4
	15.9 16.0 16.4 18.2 18.8
	18.9 19.6 19.7 21.4 21.6
	21.7 25.1 25.3 27.1 28.7
	28.8 32.0 32.4 33.1 33.3
	37.0 37.4 37.8 38.1 39.9
	40.3 43.2 43.5 43.7 49.6
	50.5 50.8 53.8 56.4 57.0
	59.7 64.7 65.1 65.9 76.1
].kurenniemiNotation
~~~

![](Help/Image/kurenniemiNotation-B.svg)

* * *

See also: LineDrawing, divisors

Guides: Tuning Functions

Further Reading: Kurenniemi 2015
