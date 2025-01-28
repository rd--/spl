# DecodeB2

- _DecodeB2(numChans, w, x, y, orientation=0.5)_

Decode a two dimensional ambisonic B-format signal to a set of speakers in a regular polygon.
The outputs will be in clockwise order.
The position of the first speaker is either center or left of center.
Answers a `List` of channels, one for each speaker.

- numChans: number of output speakers, typically 4 to 8
- w,x,y: the B-format signal
- orientation: specify speaker orientation

_orientation_ should be zero if the front is a vertex of the polygon,
the first speaker will be directly in front,
and should be 0.5 if the front bisects a side of the polygon,
in which case the first speaker will be the one left of center.

`PanB2` B-format encodes the noise source,
`DecodeB2` decodes the encoded signals to four channels,
which are reordered for a given speaker arrangement:

```
let p = PinkNoise();
let mx = MouseX(-1, 1, 0, 0.2);
let [w, x, y] = PanB2(p, mx, 0.1);
let [a, b, c, d] = DecodeB2(4, w, x, y, 0.5);
[a, b, d, c]
```

* * *

See also: PanB2, Rotate2

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/DecodeB2.html)

Categories: Ugen, Panning
