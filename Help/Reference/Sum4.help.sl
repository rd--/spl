# Sum4

- _Sum4(in1, in2, in3, in4)_

Sum four signals. Primitive Ugen to efficiently sum four signals. Should be used via Sum.

```
let o = SinOsc([111, 333, 555, 777], 0);
let [a, b, c, d] = o * 0.1;
Sum4(a, b, c, d)
```

_Note:_
Sum4 requires all inputs be operating at the same rate, and will crash the synthesiser otherwise.

* * *

See also: Mix, Sum, sum

Categories: Ugen
