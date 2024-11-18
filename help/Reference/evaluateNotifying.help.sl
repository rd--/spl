# evaluateNotifying

- _evaluateNotifying(aSystem, aString, aBlock:/1)_

Compile and execute _aString_ in the context of _aSystem_.
If there is an error evaluate _aBlock_ with the error value.

Non-existing method:

```
>>> system.evaluateNotifying('pi.notAMethod') { :unusedError | true }
true
```

Syntax error:

```
>>> system.evaluateNotifying('not a valid expression') { :unusedError | true }
true
```

* * *

See also: evaluateNotifying, System

References:
_Tc39_
[1](https://tc39.es/ecma262/multipage/global-object.html#sec-eval-x)

Categories: Evaluating
