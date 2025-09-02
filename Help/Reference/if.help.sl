# if

- _if(condition, whenTrue:/0, whenFalse:/0)_

Conditional evaluation.
If _aBoolean_ is `true` answer the result of  _whenTrue()_, else answer _whenFalse()_.

Note that the branches are not evaluated using `value`, and therefore _must_ be no-argument blocks.

Ordinarily _whenTrue_ and _whenFalse_ are literal no-argument blocks.
`Trailing Block Syntax` provides an idiomatic notation for writing such conditionals.
The standard libraries write if conditions as:

```
>>> (3 > 2).if { true } { false }
true
```

where there are two branches and as either:

```
>>> (3 > 2).ifTrue { true }
true
```

or:

```
>>> (3 < 2).ifFalse { true }
true
```

where there is one.

At `Symbol`:

```
>> (𝒙 < 𝒚).if { 𝒂 } { 𝒃 }
(if (< x y) a b)
```

_Rationale:_
Spl follows Smalltalk in having no special purpose conditional evaluation mechanisms.
Conditional expressions are implemented as ordinary blocks.
To delay evaluation of alternatives each must be written as a no argument block.

* * *

See also: boole, ifEmpty, ifFalse, ifNil, ifNotNil, ifTrue, which

Guides: Boolean Functions, Control Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/If.html),
_Smalltalk_
5.3.3.8

Categories: Evaluating
