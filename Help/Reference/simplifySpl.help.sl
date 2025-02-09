# simplifySpl

- _simplifySpl(aString)_

Answer a simplified form of the Spl program at _aString_.
The program is re-written to use only the core syntactic forms of the language.
This process is sometimes called _desugaring_.

`Binary Operator Syntax` expressions are rewritten as `Apply Syntax` expressions:

```
>>> '3 + 4'.simplifySpl
'+(3, 4)'

>>> '3 + 4 * 0.1'.simplifySpl
'*(+(x, y), z); '
```

`Method Syntax` expression are rewritten as `Apply Syntax` expressions:

```
>>> '9.sqrt'.simplifySpl
'sqrt(9)'

>>> '-1.min(1)'.simplifySpl
'min(-1,1); '
```

`Range Syntax` is rewritten:

```
>>> '1:9'.simplifySpl
'to(1, 9); '

>>> '1:2:9'.simplifySpl
'toBy(1, 9, 2); '
```

* * *

See also: evaluate

Guides: Syntax Guides
