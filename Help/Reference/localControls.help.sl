# localControls

- _localControls(r)_

Answer a `Dictionary` with the same keys as the record _r_,
where each value is a `namedControl` named by `key` and with a default value given by `value`.

The expression:

~~~spl syn=A
let ctl = (freq: 440, amp: 0.1).localControls;
sinOsc(ctl['freq'], 0) * ctl['amp']
~~~

is equivalent to:

~~~spl syn=B
let ctl = (
	freq: namedControl('freq', 440),
	amp: namedControl('amp', 0.1)
);
sinOsc(ctl['freq'], 0) * ctl['amp']
~~~

* * *

See also: LocalControl, namedControl

Guides: Local Controls
