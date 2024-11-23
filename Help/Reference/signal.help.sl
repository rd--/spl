# signal

- _signal(anError)_

Signal the occurrence of an exceptional condition.
Execution of the current `Block` will stop, the statements after throw will not be executed.
Control will be passed to the first error handler `Block` in the call stack.
If no such block exists, the program will terminate.

```
>>> { Error('An error').signal }.ifError { :err | err.messageText }
'An error'
```

* * *

See also: ensure, error, Error, ifError

References:
_Mdn_
[1](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/throw),
_Smalltalk_
5.5.2.1,
_Tc39_
[1](https://tc39.es/ecma262/multipage/ecmascript-language-statements-and-declarations.html#sec-throw-statement)
