# isRoughNumber

- _isRoughNumber(anInteger, k)_

Answer `true` if _anInteger_ is a _k_-rough number,
a positive integer all of whose prime factors are greater than or equal to _k_.

Find the eleven rough numbers up to three hundred:

```
>>> 1:300.select { :each | each.isRoughNumber(11) }
[
	  1  11  13  17  19  23  29  31  37  41
	 43  47  53  59  61  67  71  73  79  83
	 89  97 101 103 107 109 113 121 127 131
	137 139 143 149 151 157 163 167 169 173
	179 181 187 191 193 197 199 209 211 221
	223 227 229 233 239 241 247 251 253 257
	263 269 271 277 281 283 289 293 299
]
```

* * *

See also: allSatisfy, isSmoothNumber, primeFactors

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RoughNumber.html),
_W_
[1](https://en.wikipedia.org/wiki/Rough_number)
