# ^* (circumflexAccentAsterisk)

- _m ^* n_

The binary operator form of `signedPower`.
`^` is the operator form of `power`,
and `*` is the Apl and J name for `sign`.

```
>>> -0.25 ^* 0.75
signedPower(-0.25, 0.75)
```

The name of this operator is `circumflexAccentAsterisk`:

```
>>> 'm ^* n'.splSimplify
'circumflexAccentAsterisk(m, n)'
```

_Rationale_:
`signedPower` is not called `**` because `**` is often defined to mean `power`.

* * *

See also: circumflexAccent, asterisk, signedPower

Guides: Arithmetic Functions, Binary Operators
