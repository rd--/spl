# <! (lessThanSignExclamationMark)

- _aUgen <! anotherUgen_

Evaluates to _aUgen_ after attaching _anotherUgen_ to it.

Ensures _anotherUgen_ is included in the graph of which _aUgen_ is a part in cases where it would otherwise not be discovered by traversing the completed graph.

Required where graphs have multiple end points, such as graphs using `LocalOut` &etc.

Stereo cross channel feedback modulation with mouse control:

~~~
let index = 5;
let fb = [10, 5];
let pan = 0;
let amp = 0.1;
let freq = MouseY(20, 4000, 1, 0.2);
let mratio = MouseX(1 / 8, 8, 1, 0.2);
let in = LocalIn(2, [0 0]);
let mod = SinOsc(freq * mratio, 0) * freq * mratio * index;
let car = SinOsc([freq * mod * in.second, freq + mod + in.first], 0);
Pan2(LeakDc(car.Sum, 0.995), pan, amp) <! LocalOut(car * fb)
~~~

_Note_:
This uses `FirstArg` where _anotherUgen_ has output ports,
else it uses `multipleRootGraph`.

The name of this operator is `lessThanSignExclamationMark`.

* * *

See also: FirstArg, multipleRootGraph

References:
_SuperCollider_
[1](https://doc.sccode.org/Overviews/Operators.html#%3C!)

Categories: Ugen
