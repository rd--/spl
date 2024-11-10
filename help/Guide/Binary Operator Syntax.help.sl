# Binary Operator Syntax

Binary operators are written _α + β_:

```
>>> 3 + 4
7
```

Binary operators associate to the left, _α + β * γ_ = _(α + β) * γ_:

```
>>> 3 + 4 * 5
35
```

Binary operators are grouped using parentheses:


```
>>> 3 + (4 * 5)
23
```

Binary operators have lower precedence than ordinary application,
_α + β.γ_ = _α + (β.γ)_:

```
>>> 3 + 4.squared
19

>>> 3 + squared(4)
19

>>> (3 + 4).squared
49
```

Binary operators may be written as names in ordinary method application contexts:

```
>>> +(3, 4)
7

>>> 3.+(4)
7
```

Binary operators may be written as names in non-operator contexts, i.e. _α.β(+)_.

```
>>> 1:9.reduce(*)
362880
```

Binary operators are rewritten as the arity qualified names of their symbols.
The names are those given to the glyphs in _The Unicode Standard_.
`+` as _plusSign:/2_,
`*` as _asterisk:/2_, &etc.

```
>>> + == plusSign:/2
true
```

These names are in the same space as all other block names,
defining _&_ defines _ampersand_, and defining _+_ defines _plusSign_.

```
>>> plusSign(3, 4)
7

>>> ampersand(true) { true }
true
```

Binary operators with multiple characters are named by joining together the character names,
i.e. _++_ is _plusSignPlusSign_ not _append_, and _<=_ is _lessThanSignEqualsSign_.

```
>>> ++ == plusSignPlusSign:/2
true
```

Math and logic binary operators:

- `+`: plusSign
- `*`: asterisk
- `-`: hyphenMinus
- `/`: solidus
- `%`: percentSign
- `=`: equalsSign
- `<`: lessThanSign
- `>`: greaterThanSign
- `&`: ampersand
- `|`: verticalLine
- `~`: tilde

Other binary operators:

- `!`: exclamationMark
- `@`: commercialAt
- `#`: numberSign
- `$`: dollarSign
- `^`: circumflexAccent
- `\\`: reverseSolidus
- `?`: questionMark

_Rationale_: While it is not neccesary to use the text names of the operators within the system,
there are a number of places where they are required.
The help entries for operators are named using the text names,
as many file systems disallow the use of operator characters in file names.
The help entry names are also used in Url addresses where operator characters must be escaped and are therefore not readable.
The help lookup translates between the symbolic and text names.
When compiling the operators are likewise given text names, again because of rules about which characters may be used in variable names.

* * *

See also: Operator List, Operator Names, Unary Operator Syntax

Further Reading: Unicode Consortium (1992)

Categories: Syntax
