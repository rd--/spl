# splParseExpression

- _splParseExpression(aString)_

Answer a `SymbolicExpression` representing the parse tree of the Sᴘʟ expression at _aString_.

A program expression is indicated by 𝒫,
an identifier by a `Symbol`:

```
>>> 'x; y'
>>> .splParseExpression
>>> .asString
'(𝒫 x y)'
```

A list expression is indicated by 𝓛.
Reserved words and numeric literals are represented by their values:

```
>>> '[false, nil, true, []]'
>>> .splParseExpression
>>> .asString
'(𝒫 (𝓛 false nil true (𝓛)))'

>>> '[3.141 23 23L]'
>>> .splParseExpression
>>> .printString
'(𝒫 (𝓛 3.141 23 23L))'
```

Application is indicated ordinarily:

```
>>> 'f(x)'
>>> .splParseExpression
>>> .asString
'(𝒫 (f x))'

>>> 'f(x, y)'
>>> .splParseExpression
>>> .asString
'(𝒫 (f x y))'
```

Infix application is written in prefix form:

```
>>> 'x + y'
>>> .splParseExpression
>>> .asString
'(𝒫 (+ x y))'

>>> 'x + (y * z)'
>>> .splParseExpression
>>> .asString
'(𝒫 (+ x (* y z)))'
```

`Fraction`, `Complex` and `Residue` are written as applications:

```
>>> '[2/3 2J3]'
>>> .splParseExpression
>>> .asString
'(𝒫 (𝓛 (Fraction 2L 3L) (Complex 2 3)))'
```

Let binding is indicated by ≔.
Assignment is indicated by ←:

```
>>> 'let x = nil; x := 1; x'
>>> .splParseExpression
>>> .asString
'(𝒫 (≔ x nil) (← x 1) x)'
```

Blocks are indicated by 𝜆.
Block arguments, if present, are indicated by 𝓐 at the first operand:

```
>>> '{ :x | { x } }'
>>> .splParseExpression
>>> .asString
'(𝒫 (𝜆 (𝓐 x) (𝜆 x)))'
```

Let bindings, if present, follow arguments:

```
>>> '{ :x | let y = x; y }'
>>> .splParseExpression
>>> .asString
'(𝒫 (𝜆 (𝓐 x) (≔ y x) y))'
```

Conditionals are ordinary blocks,
branches are manually delayed:

```
>>> 'x.if { 1 } { 0 }'
>>> .splParseExpression
>>> .asString
'(𝒫 (if x (𝜆 1) (𝜆 0)))'
```

The `hypotenuse` function:

```
>>> '{ :x :y | ((x * x) + (y * y)).sqrt }'
>>> .splParseExpression
>>> .asString
'(𝒫 (𝜆 (𝓐 x y) (sqrt (+ (* x x) (* y y)))))'
```

* * *

See also: splParseTree, SymbolicExpression
