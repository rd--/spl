# format

- _format(aString, aSequence)_

Answer a `String` that is like _aString_ but where _%_ characters are replaced with items from _aSequence_.
Items in _aSequence_ are formatted using `printString`.

```
>>> 'pi=% & e=%'.format([pi, e])
'pi=3.141592653589793 & e=2.718281828459045'
```

There are no directives to modify item formatting,
instead we can adapt the items:

```
>>> '`pi` = % and `e` = %.'.format([pi, e].roundTo(1E-4))
'`pi` = 3.1416 and `e` = 2.7183.'
```

* * *

See also: riffle, stringConcatenation, splitBy, String

References:
_Common Lisp_
[1](http://www.ai.mit.edu/projects/iiip/doc/CommonLISP/HyperSpec/Body/fun_format.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/String.html#-format)

Categories: Printing
