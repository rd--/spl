# DecodeB2

_DecodeB2(numChans, w, x, y, orientation=0.5)_

Decode a two dimensional ambisonic B-format signal to a set of speakers in a regular polygon.
The outputs will be in clockwise order.
The position of the first speaker is either center or left of center.
Answers an array of channels, one for each speaker.

- numChans: Number of output speakers. Typically 4 to 8.
- w,x,y: The B-format signal.
- orientation: Should be zero if the front is a vertex of the polygon.
  The first speaker will be directly in front.
  Should be 0.5 if the front bisects a side of the polygon.
  Then the first speaker will be the one left of center.

	let p = PinkNoise(); (* Source *)
	let [w, x, y] = PanB2(p, MouseX(-1, 1, 0, 0.2), 0.1); (* B-format encode *)
	let [a, b, c, d] = DecodeB2(4, w, x, y, 0.5); (* B-format decode to quad *)
	[a, b, d, c] (* Reorder for speaker arrangement *)

* * *

See also: PanB2, Rotate2
