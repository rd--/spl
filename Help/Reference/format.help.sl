# format

- _format(aString, aSequence)_

Answer a `String` that is like _aString_ but where _%_ characters are replaced with items from _aSequence_.
Items in _aSequence_ are formatted using `asString`.

```
>>> 'pi=% & e=%'.format([1.pi, 1.e])
'pi=3.141592653589793 & e=2.718281828459045'

>>> '23^23=%'.format([23L ^ 23])
'23^23=20880467999847912034355032910567'
```

There are no directives to modify item formatting,
instead we can adapt the items:

```
>>> '`pi` = % and `e` = %.'.format([1.pi, 1.e].roundTo(1E-4))
'`pi` = 3.1416 and `e` = 2.7183.'
```

Format `Boolean`:

```
>>> '% > % = %'.format([3, 4, 3 > 4])
'3 > 4 = false'
```

Format `String`:

```
>>> '% ≺ % = %'.format(['pqr', 'xyz', 'pqr'.precedes('xyz')])
'pqr ≺ xyz = true'
```

* * *

See also: riffle, stringConcatenation, splitBy, String

References:
_Common Lisp_
[1](http://www.ai.mit.edu/projects/iiip/doc/CommonLISP/HyperSpec/Body/fun_format.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/String.html#-format)

Categories: Printing
