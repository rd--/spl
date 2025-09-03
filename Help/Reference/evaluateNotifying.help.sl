# evaluateNotifying

- _evaluateNotifying(system, s, f:/1)_

Compile and execute the string _s_ in the context of `system`.
If there is an error evaluate the block _f_ with the error value.

Non-existing method:

```
>>> system.evaluateNotifying(
>>> 	'1.pi.notAMethod'
>>> ) { :unusedError |
>>> 	true
>>> }
true
```

Syntax error:

```
>>> system.evaluateNotifying(
>>> 	'not a valid expression'
>>> ) { :unusedError |
>>> 	true
>>> }
true
```

* * *

See also: evaluate, ifError, System

Guides: Reflection Functions

References:
_Tc39_
[1](https://tc39.es/ecma262/multipage/global-object.html#sec-eval-x)

Categories: Evaluating
