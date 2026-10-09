# softSign

- _softSign(x)_

Implement the softsign function,
a sigmoid function similar to `tanh`.

Evaluate symbolically:

```
>> `x`.softSign
(/ x (+ 1 (abs x)))
```

Plot over a subset of the reals:

~~~spl svg=A
(-3 -- 3).functionPlot(softSign/1)
~~~

![](Help/Image/softSign-A.svg)

* * *

See also: softMax, softPlus, tanh

Guides: Activation Functions, Sigmoid Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Activation_function)
