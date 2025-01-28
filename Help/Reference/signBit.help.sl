# signBit

- _signBit(aNumber)_

Answer `true` if _aNumber_ has sign bit set (including case of IEEE-754 negative-zero and negative infinity), else `false`.

```
>>> [-1.inf -1 -0 0 1 1.inf].collect(signBit:/1)
[true true true false false false]
```

* * *

See also: isNegative, isNegativeZero, sign

References:
_C_
[1](https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1570.pdf),
_Go_
[1](https://pkg.go.dev/math#Signbit),
_Octave_
[1](https://octave.sourceforge.io/octave/function/signbit.html),
_OpenGroup_
[1](https://pubs.opengroup.org/onlinepubs/007904875/functions/signbit.html),
_Tc39_
[1](https://tc39.es/proposal-Math.signbit/Math.signbit.html)

Categories: Math
