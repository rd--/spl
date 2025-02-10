# simplifySpl

- _simplifySpl(aString)_

Answer a simplified form of the Spl program at _aString_.
The program is re-written to use only the core syntactic forms of the language.
This process is sometimes called _desugaring_.

Literals and list expressions are not rewritten:

```
>>> let l = '[nil, true, false, 23, \'xyz\']';
>>> l.simplifySpl
l
```

`Binary Operator Syntax` is rewritten as `Apply Syntax`:

```
>>> '3 + 4'.simplifySpl
'+(3, 4)'

>>> '3 + 4 * 0.1'.simplifySpl
'*(+(3, 4), 0.1)'
```

`Method Syntax` is rewritten as `Apply Syntax`:

```
>>> '9.sqrt'.simplifySpl
'sqrt(9)'

>>> '-1.min(1)'.simplifySpl
'min(-1,1)'

>>> 'x.-'.simplifySpl
'-(x)'
```

`Trailing Block Syntax` is rewritten as `Apply Syntax`:

```
>>> 'f(x) { :i | i }'.simplifySpl
'f(x, { :i | i })'

>>> 'x.f { :i | i }'.simplifySpl
'f(x, { :i | i })'
```


`Dictionary Syntax` is rewritten:

```
>>> '(k: v)'.simplifySpl
'Record([[\'k\', v]])'
```

`Trailing Dictionary Syntax` is rewritten:

```
>>> 'f(k: v)'.simplifySpl
'f(Record([[\'k\', v]]))'

>>> 'x.f(k: v)'.simplifySpl
'f(x, Record([[\'k\', v]]))'
```

`Slot Assignment Syntax` is rewritten:

```
>>> 'p.x := 0'.simplifySpl
'x(p, 0)'

>>> 'p.q.x := a.b'.simplifySpl
'x(q(p), b(a))'
```

`Infix Method Syntax` is rewritten:

```
>>> '-1 min: 1'.simplifySpl
'min(-1, 1)'
```

`Tuple Syntax` is rewritten:

```
>>> '(1, 2, 3)'.simplifySpl
'asTuple([1, 2, 3])'
```

All of the forms of `Range Syntax` are rewritten:

```
>>> '1:9'.simplifySpl
'to(1, 9)'

>>> '1:2:9'.simplifySpl
'toBy(1, 9, 2)'

>>> '(1 .. 9)'.simplifySpl
'upOrDownTo(1, 9)'

>>> '(1, 3 .. 9)'.simplifySpl
'thenTo(1, 3, 9)'

>>> '[1 .. 9]'.simplifySpl
'asList(upOrDownTo(1, 9))'

>>> '[1, 3 .. 9]'.simplifySpl
'asList(thenTo(1, 3, 9))'
```

`At Syntax` is rewritten:

```
>>> 'c[i + 1]'.simplifySpl
'at(c, +(i, 1))'
```

`AtPut Syntax` is rewritten:

```
>>> 'c[i] := x'.simplifySpl
'atPut(c, i, x)'
```

`AtAll Syntax` is rewritten:

```
>>> 'c[1:9]'.simplifySpl
'atAll(c, to(1, 9))'
```

`Quoted At Syntax` is rewritten:

```
>>> 'c::k'.simplifySpl
'at(c, \'k\')'
```

`Quoted AtPut Syntax` is rewritten:

```
>>> 'c::k := x'.simplifySpl
'atPut(c, \'k\', x)'
```

`Vector Syntax` is rewritten:

```
>>> '[1 3 5 7]'.simplifySpl
'[1, 3, 5, 7]'

>>> '[x y.sqrt z]'.simplifySpl
'[x, sqrt(y), z]'
```

`Matrix Syntax` is rewritten:

```
>>> '[1 3; 5 7]'.simplifySpl
'[[1, 3], [5, 7]]'
```

`Volume Syntax` is rewritten:

```
>>> '[1 2; 3 4:; 5 6; 7 8]'.simplifySpl
'[[[1, 2], [3, 4]], [[5, 6], [7, 8]]]'
```

`Complex`, `Fraction` and `Residue` literals are rewritten:

```
>>> '3J4'.simplifySpl
'Complex(3, 4)'

>>> '3/4'.simplifySpl
'Fraction(3L, 4L)'

>>> '-3/4'.simplifySpl
'Fraction(-3L, 4L)'

>>> '5Z12'.simplifySpl
'Residue(5, 12)'
```

Radix integer literals are rewritten:

```
>>> '16rFF'.simplifySpl
'255'
```

`DoubleQuotedString` and `BacktickQuotedString` literals are rewritten:

```
>>> '"q"'.simplifySpl
'DoubleQuotedString(\'q\')'

>>> '`q`'.simplifySpl
'BacktickQuotedString(\'q\')'
```

* * *

See also: evaluate

Guides: Syntax Guides
