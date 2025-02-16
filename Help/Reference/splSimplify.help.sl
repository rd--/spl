# splSimplify

- _splSimplify(aString)_

Answer a simplified form of the Spl program at _aString_.
The program is re-written to use only the core syntactic forms of the language.
This process is sometimes called _desugaring_.

`nil`,
`Boolean` literals,
and `List Syntax` expressions are not rewritten:

```
>>> let expr = '[nil, true, false, []]';
>>> expr.splSimplify
expr
```

`SmallFloat`,
`LargeInteger` and
`String` literals are not rewritten:

```
>>> let expr = '[23, 3.141, 23L, 2.3E1, \'23\']';
>>> expr.splSimplify
expr
```

`Block` literals,
`Assignment Syntax`,
`Apply Syntax` and
`Value Apply Syntax` are not rewritten:

```
>>> let expr = '{ :x | x := f(x); f . (x) }';
>>> expr.splSimplify
expr

>>> '{  }'.splSimplify
'{  }'
```

`Let Syntax` is not rewritten:

```
>>> let expr = 'let x = 23; x';
>>> expr.splSimplify
expr
```

`List Assignment Syntax` is rewritten as `Let Syntax` and `Assignment Syntax`:

```
>>> let expr = 'let [x] = y; x';
>>> expr.splSimplify ~= expr
true

>>> let expr = '[x] := y';
>>> expr.splSimplify ~= expr
true
```

`Dictionary Assignment Syntax` is rewritten:

```
>>> let expr = 'let (x: x) = d; x';
>>> expr.splSimplify ~= expr
true

>>> let expr = '(x: x) := d';
>>> expr.splSimplify ~= expr
true
```

`Complex`,
`Fraction` and
`Residue` literals are rewritten as `Apply Syntax`:

```
>>> '3J4'.splSimplify
'Complex(3, 4)'

>>> '3/4'.splSimplify
'Fraction(3L, 4L)'

>>> '-3/4'.splSimplify
'Fraction(-3L, 4L)'

>>> '5Z12'.splSimplify
'Residue(5, 12)'
```

`Radix Syntax` integer literals are rewritten as `SmallFloat` literals:

```
>>> '16rFF'.splSimplify
'255'

>>> '-8r77'.splSimplify
'-63'
```

`DoubleQuotedString` and `BacktickQuotedString` literals are rewritten as `Apply Syntax` and `String` literals:

```
>>> '"q"'.splSimplify
'DoubleQuotedString(\'q\')'

>>> '`q`'.splSimplify
'BacktickQuotedString(\'q\')'
```

`Dictionary Syntax` is rewritten as `Apply Syntax` and `List Syntax`:

```
>>> '(k: v)'.splSimplify
'Record([[\'k\', v]])'
```

`Tuple Syntax` is rewritten as `Apply Syntax` and `List Syntax`:

```
>>> '(1, 2, 3)'.splSimplify
'asTuple([1, 2, 3])'
```

All of the forms of `Range Syntax` are rewritten  as `Apply Syntax`.
Range literals:

```
>>> '1:9'.splSimplify
'to(1, 9)'

>>> '1:2:9'.splSimplify
'toBy(1, 9, 2)'
```

Range expressions:

```
>>> '(1 .. 9)'.splSimplify
'upOrDownTo(1, 9)'

>>> '(1, 3 .. 9)'.splSimplify
'thenTo(1, 3, 9)'
```

List range expressions:

```
>>> '[1 .. 9]'.splSimplify
'asList(upOrDownTo(1, 9))'

>>> '[1, 3 .. 9]'.splSimplify
'asList(thenTo(1, 3, 9))'
```

`Method Syntax` is rewritten as `Apply Syntax`:

```
>>> '9.sqrt'.splSimplify
'sqrt(9)'

>>> '-1.min(1)'.splSimplify
'min(-1,1)'

>>> 'x.-'.splSimplify
'-(x)'
```

`Binary Operator Syntax` is rewritten as `Apply Syntax`:

```
>>> '3 + 4'.splSimplify
'+(3, 4)'

>>> '3 + 4 * 0.1'.splSimplify
'*(+(3, 4), 0.1)'
```

`Trailing Block Syntax` is rewritten as `Apply Syntax`:

```
>>> 'f(x) { :i | i }'.splSimplify
'f(x, { :i | i })'

>>> 'x.f { :i | i }'.splSimplify
'f(x, { :i | i })'
```

`Trailing Dictionary Syntax` is rewritten as `Apply Syntax`:

```
>>> 'f(k: v)'.splSimplify
'f(Record([[\'k\', v]]))'

>>> 'x.f(k: v)'.splSimplify
'f(x, Record([[\'k\', v]]))'
```

`Slot Assignment Syntax` is rewritten as `Apply Syntax`:

```
>>> 'p.x := 0'.splSimplify
'x(p, 0)'

>>> 'p.q.x := a.b'.splSimplify
'x(q(p), b(a))'
```

`At Syntax` is rewritten as `Apply Syntax`:

```
>>> 'c[i + 1]'.splSimplify
'at(c, +(i, 1))'
```

`AtPut Syntax` is rewritten as `Apply Syntax`:

```
>>> 'c[i] := x'.splSimplify
'atPut(c, i, x)'
```

`AtAll Syntax` is rewritten as `Apply Syntax`:

```
>>> 'c[1:9]'.splSimplify
'atAll(c, to(1, 9))'
```

`Quoted At Syntax` is rewritten as `Apply Syntax`:

```
>>> 'c::k'.splSimplify
'at(c, \'k\')'
```

`Quoted AtPut Syntax` is rewritten as `Apply Syntax`:

```
>>> 'c::k := x'.splSimplify
'atPut(c, \'k\', x)'
```

`Vector Syntax` is rewritten as `List Syntax`:

```
>>> '[1 3 5 7]'.splSimplify
'[1, 3, 5, 7]'

>>> '[x y.sqrt z]'.splSimplify
'[x, sqrt(y), z]'
```

Certain one-element cases are re-written as `enclose`,
which avoids having any `Vector Syntax` expressions in the rewritten text,
where _[0]_ parses as a vector in order to resolves the ambiguity of _[0 -1]_,
which arises because spaces around operators are not checked:

```
>>> '[x]'.splSimplify
'enclose(x)'

>>> '[3 + 4]'.splSimplify
'[+(3, 4)]'
```

`Matrix Syntax` is rewritten as `List Syntax`:

```
>>> '[1 3; 5 7]'.splSimplify
'[[1, 3], [5, 7]]'
```

`Volume Syntax` is rewritten as `List Syntax`:

```
>>> '[1 2; 3 4:; 5 6; 7 8]'.splSimplify
'[[[1, 2], [3, 4]], [[5, 6], [7, 8]]]'
```

Simplify `hypotenuse` function:

```
>>> '{ :x :y | ((x * x) + (y * y)).sqrt }'
>>> .splSimplify
'{ :x :y | sqrt((+((*(x, x)), (*(y, y))))) }'
```

_Type Extension_ and _Trait Extension_ expressions are rewritten as a _Method Definitions_ expressions:

```
>>> '+X {\n\tx { y }\n}\n'.splSimplify
'+[X] {\n\tx { y }\n}\n'

>>> '+@X {\n\tx { y }\n}\n'.splSimplify
'+[@X] {\n\tx { y }\n}\n'
```

* * *

See also: evaluate

Guides: Syntax Guides
