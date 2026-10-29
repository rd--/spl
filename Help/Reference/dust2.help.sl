# dust2

- _dust2(density)_

Bipolar random impulses.
Generates random impulses from -1 to +1.
There is no noticeable difference in sound from dust, but it may be useful for its properties in some situations.

- density: average number of impulses per second

Fixed density:

~~~spl syn=A
dust2(200) * 0.1
~~~

Modulate density:

~~~spl syn=B
dust2(xLine(20000, 2, 10)) * 0.1
~~~

* * *

See also: dust, dustRange

Guides: Unit Generators

References:
_Csound_
[1](https://csound.com/docs/manual/dust2.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Dust2.html)

Categories: Ugen
