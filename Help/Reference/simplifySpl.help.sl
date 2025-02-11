# simplifySpl

- _simplifySpl(aString)_

Answer a simplified form of the Spl program at _aString_.
The program is re-written to use only the core syntactic forms of the language.
This process is sometimes called _desugaring_.

`nil`,
`Boolean` literals,
`String` literals,
and `List Syntax` expressions are not rewritten:

```
>>> let expr = '[nil, true, false, \'xyz\', []]';
>>> expr.simplifySpl
expr
```

`SmallFloat` and `LargeInteger` literals are not rewritten:

```
>>> let expr = '[23, 3.141, 23L]';
>>> expr.simplifySpl
expr
```

`Block` literals,
`Assignment Syntax`,
`Apply Syntax` and
`Value Apply Syntax` are not rewritten:

```
>>> let expr = '{ :x | x := f(x); f . (x) }';
>>> expr.simplifySpl
expr
```

`Let Syntax` is not rewritten:

```
>>> let expr = 'let x = 23; x';
>>> expr.simplifySpl
expr
```

`Complex`,
`Fraction` and
`Residue` literals are rewritten as `Apply Syntax`:

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

`Radix Syntax` integer literals are rewritten as `SmallFloat` literals:

```
>>> '16rFF'.simplifySpl
'255'

>>> '-8r77'.simplifySpl
'-63'
```

`DoubleQuotedString` and `BacktickQuotedString` literals are rewritten as `Apply Syntax` and `String` literals:

```
>>> '"q"'.simplifySpl
'DoubleQuotedString(\'q\')'

>>> '`q`'.simplifySpl
'BacktickQuotedString(\'q\')'
```

`Dictionary Syntax` is rewritten as `Apply Syntax` and `List Syntax`:

```
>>> '(k: v)'.simplifySpl
'Record([[\'k\', v]])'
```

`Tuple Syntax` is rewritten as `Apply Syntax` and `List Syntax`:

```
>>> '(1, 2, 3)'.simplifySpl
'asTuple([1, 2, 3])'
```

All of the forms of `Range Syntax` are rewritten  as `Apply Syntax`.
Range literals:

```
>>> '1:9'.simplifySpl
'to(1, 9)'

>>> '1:2:9'.simplifySpl
'toBy(1, 9, 2)'
```

Range expressions:

```
>>> '(1 .. 9)'.simplifySpl
'upOrDownTo(1, 9)'

>>> '(1, 3 .. 9)'.simplifySpl
'thenTo(1, 3, 9)'
```

List range expressions:

```
>>> '[1 .. 9]'.simplifySpl
'asList(upOrDownTo(1, 9))'

>>> '[1, 3 .. 9]'.simplifySpl
'asList(thenTo(1, 3, 9))'
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

`Binary Operator Syntax` is rewritten as `Apply Syntax`:

```
>>> '3 + 4'.simplifySpl
'+(3, 4)'

>>> '3 + 4 * 0.1'.simplifySpl
'*(+(3, 4), 0.1)'
```

`Trailing Block Syntax` is rewritten as `Apply Syntax`:

```
>>> 'f(x) { :i | i }'.simplifySpl
'f(x, { :i | i })'

>>> 'x.f { :i | i }'.simplifySpl
'f(x, { :i | i })'
```

`Trailing Dictionary Syntax` is rewritten as `Apply Syntax`:

```
>>> 'f(k: v)'.simplifySpl
'f(Record([[\'k\', v]]))'

>>> 'x.f(k: v)'.simplifySpl
'f(x, Record([[\'k\', v]]))'
```

`Slot Assignment Syntax` is rewritten as `Apply Syntax`:

```
>>> 'p.x := 0'.simplifySpl
'x(p, 0)'

>>> 'p.q.x := a.b'.simplifySpl
'x(q(p), b(a))'
```

`Infix Method Syntax` is rewritten as `Apply Syntax`:

```
>>> '-1 min: 1'.simplifySpl
'min(-1, 1)'
```

`At Syntax` is rewritten as `Apply Syntax`:

```
>>> 'c[i + 1]'.simplifySpl
'at(c, +(i, 1))'
```

`AtPut Syntax` is rewritten as `Apply Syntax`:

```
>>> 'c[i] := x'.simplifySpl
'atPut(c, i, x)'
```

`AtAll Syntax` is rewritten as `Apply Syntax`:

```
>>> 'c[1:9]'.simplifySpl
'atAll(c, to(1, 9))'
```

`Quoted At Syntax` is rewritten as `Apply Syntax`:

```
>>> 'c::k'.simplifySpl
'at(c, \'k\')'
```

`Quoted AtPut Syntax` is rewritten as `Apply Syntax`:

```
>>> 'c::k := x'.simplifySpl
'atPut(c, \'k\', x)'
```

`Vector Syntax` is rewritten as `List Syntax`:

```
>>> '[1 3 5 7]'.simplifySpl
'[1, 3, 5, 7]'

>>> '[x y.sqrt z]'.simplifySpl
'[x, sqrt(y), z]'
```

`Matrix Syntax` is rewritten as `List Syntax`:

```
>>> '[1 3; 5 7]'.simplifySpl
'[[1, 3], [5, 7]]'
```

`Volume Syntax` is rewritten as `List Syntax`:

```
>>> '[1 2; 3 4:; 5 6; 7 8]'.simplifySpl
'[[[1, 2], [3, 4]], [[5, 6], [7, 8]]]'
```

* * *

See also: evaluate

Guides: Syntax Guides
