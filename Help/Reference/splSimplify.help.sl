# splSimplify

- _splSimplify(s)_

Answer a simplified form of the Sᴘʟ program at the string _s_.
The program is re-written to use only the core syntactic forms of the language.
This process is sometimes called _desugaring_.

`nil`,
`Boolean` literals,
variable identifiers,
arity qualified identifiers,
and `List Syntax` expressions are not rewritten:

```
>>> 'nil'.splSimplify
'nil'

>>> 'true'.splSimplify
'true'

>>> 'false'.splSimplify
'false'

>>> 'x'.splSimplify
'x'

>>> 'f/1'.splSimplify
'f/1'

>>> '[x, y, z]'.splSimplify
'[x, y, z]'
```

`Float`,
`Integer` and
`String` literals are not rewritten:

```
>>> '3.141'.splSimplify
'3.141'

>>> '23L'.splSimplify
'23L'

>> 'x'.printString
>> .splSimplify
'x'
```

Small integer syntax is rewritten:

```
>>> '23'.splSimplify
'23L'
```

`Block` literals,
`Assignment Syntax`,
and `Apply Syntax`
are not rewritten:

```
>>> '{  }'.splSimplify
'{  }'

>>> '{ :x | x }'.splSimplify
'{ :x | x }'

>>> 'x := y'.splSimplify
'x := y'

>>> 'f(x)'.splSimplify
'f(x)'

>>> 'f(x, y)'.splSimplify
'f(x, y)'
```

`Let Syntax` is not rewritten:

```
>>> 'let y = f(x); y'.splSimplify
'let y = f(x); y'
```

Negated variable references are rewritten in terms of `negate`:

```
>>> '-x'.splSimplify
'negate(x)'
```

`List Assignment Syntax` is rewritten as `Let Syntax` and `Assignment Syntax`:

```
>>> let e = 'let [x] = y; x';
>>> e.splSimplify != e
true

>>> let e = '[x] := y';
>>> e.splSimplify != e
true
```

`Record Assignment Syntax` is rewritten:

```
>>> let e = 'let (x: x) = d; x';
>>> e.splSimplify != e
true

>>> let e = '(x: x) := d';
>>> e.splSimplify != e
true
```

`Complex`,
`Fraction`,
`Scientific Notation`,
`Decimal` and
`Residue` literals are rewritten as `Apply Syntax`:

```
>>> '3J4'.splSimplify
'Complex(3.0, 4.0)'

>>> '3I'.splSimplify
'Complex(0.0, 3.0)'

>>> '3/4'.splSimplify
'Fraction(3L, 4L)'

>>> '-3/4'.splSimplify
'Fraction(-3L, 4L)'

>>> '1.0E3'.splSimplify
'times(1.0, power(10.0, 3.0))'

>>> '1E3'.splSimplify
'times(1L, power(10L, 3L))'

>>> '3.141D'.splSimplify
'Decimal(Fraction(3141L, 1000L), 3L)'

>>> '5Z12'.splSimplify
'Residue(5L, 12L)'
```

`Radix Syntax` integer literals are rewritten as `Integer` literals:

```
>>> '16bFF'.splSimplify
'255L'

>>> '-8b77'.splSimplify
'-63L'
```

`DoubleQuotedString` and `Symbol` literals are rewritten as `Apply Syntax` and `String` literals:

```
>> '"q"'.splSimplify
DoubleQuotedString('q')

>> '`q`'.splSimplify
Symbol('q')
```

`Record Syntax` is rewritten as `Apply Syntax` and `List Syntax`:

```
>> '(x: i, y: j)'.splSimplify
Record([['x', i], ['y', j]])

>>> '(:)'.splSimplify
'Record()'
```

`List Constructor Syntax` is rewritten as `Apply Syntax` and `List Syntax`:

```
>>> 'Map[x i; y j]'.splSimplify
'Map([[x, i], [y, j]])'

>>> 'Map[]'.splSimplify
'Map([])'
```

`Tuple Syntax` is rewritten as `Apply Syntax` and `List Syntax`:

```
>>> '(x, y, z)'.splSimplify
'Tuple([x, y, z])'
```

All of the forms of `Range Syntax` are rewritten as `Apply Syntax`.

`Range Literal Syntax`:

```
>> '1L:9L'.splSimplify
Range(1L, 9L)

>> '1L:9L:2L'.splSimplify
Range(1L, 9L, 2L)
```

`Range` expressions:

```
>>> '(i .. j)'.splSimplify
'Range(i, j)'

>>> '(i, j .. k)'.splSimplify
'thenTo(i, j, k)'

>>> '(i .. j; k)'.splSimplify
'Range(i, j, k)'
```

List range expressions:

```
>>> '[i .. j]'.splSimplify
'listRange(i, j)'

>>> '[i, j .. k]'.splSimplify
'listThenTo(i, j, k)'

>>> '[i .. j; k]'.splSimplify
'listRange(i, j, k)'
```

`Method Syntax` is rewritten as `Apply Syntax`:

```
>>> 'x.f'.splSimplify
'f(x)'

>> 'x.f(y)'.splSimplify
f(x, y)

>> 'x.f(y, z)'.splSimplify
f(x, y, z)

>>> 'x.-'.splSimplify
'hyphenMinus(x)'
```

`Binary Operator Syntax` is rewritten as `Apply Syntax`:

```
>>> 'x + y'.splSimplify
'plusSign(x, y)'

>>> 'x + y * z'.splSimplify
'asterisk(plusSign(x, y), z)'

>> '(n * x) + (m * y)'.splSimplify
plusSign(
  (asterisk(n, x)),
  (asterisk(m, y))
)
```

`Trailing Block Syntax` is rewritten as `Apply Syntax`:

```
>>> 'f(x) { :i | i }'.splSimplify
'f(x, { :i | i })'

>>> 'x.f { :i | i }'.splSimplify
'f(x, { :i | i })'
```

`Record Constructor Syntax` is rewritten as `Apply Syntax`:

```
>> 'F(k: v)'.splSimplify
F(Record([['k', v]]))
```

`Dot Assignment Syntax` is rewritten as `Apply Syntax`:

```
>>> 'p.x := y'.splSimplify
'xMutateInPlace(p, y)'

>>> 'p.q.x := a.b'.splSimplify
'xMutateInPlace(q(p), b(a))'
```

`At Syntax` is rewritten as `Apply Syntax`:

```
>>> 'c[i + j]'.splSimplify
'at(c, plusSign(i, j))'
```

`Put Syntax` is rewritten as `Apply Syntax`:

```
>>> 'c[i] := x'.splSimplify
'put!(c, i, x)'
```

`AtAll Syntax` is rewritten as `Apply Syntax`:

```
>>> 'c[i .. j]'.splSimplify
'atAll(c, listRange(i, j))'

>>> 'c[i, j]'.splSimplify
'atAll(c, [i, j])'
```

`Vector Syntax` is rewritten as `List Syntax`:

```
>>> '[x y z]'.splSimplify
'[x, y, z]'

>>> '[x.f y.g.h z]'.splSimplify
'[f(x), h(g(y)), z]'
```

`Matrix Syntax` is rewritten as `List Syntax`:

```
>>> '[a b; c d]'.splSimplify
'[[a, b], [c, d]]'
```

`Volume Syntax` is rewritten as `List Syntax`:

```
>>> '[a b; c d:; p q; r s]'.splSimplify
'[[[a, b], [c, d]], [[p, q], [r, s]]]'
```

Simplify the `hypotenuse` function:

```
>> '{ :x :y | [x y].square.sum.sqrt }'
>> .splSimplify
{ :x :y | sqrt(sum(square([x, y]))) }
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
