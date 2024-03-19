# localControls

- _localControls(aRecord)_

Answer a `Dictionary` with the same keys as _aRecord_,
where each value is a `NamedControl` named by `key` and with a default value given by `value`.

The expression:

~~~
let ctl = (freq: 440, amp: 0.1).localControls;
SinOsc(ctl::freq, 0) * ctl::amp
~~~

is equivalent to:

~~~
let ctl = (freq: NamedControl('freq', 440), amp: NamedControl('amp', 0.1));
SinOsc(ctl::freq, 0) * ctl::amp
~~~

* * *

See also: LocalControl, NamedControl
