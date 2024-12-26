# kurenniemiNotation

- _kurenniemiNotation(pitchList)_

Answer a `LineDrawing` showing the _pitchList_ using Kurenniemi’s notation.

Staff and ledger lines are drawn in logarithmic space,
and pitches are drawn at precisely their pitch,
relative to C1 (the pitch three octaves below middle C).

> This system of notation does not use any accidentals. [...] Observe
> that the spaces between staff lines are unequal. In the narrow space
> there is room for two pitch levels, in the large for
> three. (Kurenniemi 2015, p. 5)

Draw the twelve pitches of the `divisors` set of sixty:

~~~
60.divisors.kurenniemiNotation
~~~

![](sw/spl/Help/Image/kurenniemiNotation-A.svg)

The pitches in the drawing are _C1 C2 C3_, _G2 G3 G4_, _E3 E4 E5_ and _B4 B5 B6_.
Note that _G3_ is midway between the _F3_ and _A3_ lines,
there is space below for _F#3_ and space above for _G#3_.

* * *

See also: divisors, LineDrawing

Further Reading: Kurenniemi 2015
