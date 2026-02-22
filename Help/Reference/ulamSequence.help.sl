# ulamSequence

- _ulamSequence(n, i=[1 2])_

Answer the first _n_ terms of the Ulam sequence.

First few terms,
OEIS [A002858](https://oeis.org/A002858):

```
>>> 59.ulamSequence
[
	  1   2   3   4   6
	  8  11  13  16  18
	 26  28  36  38  47
	 48  53  57  62  69
	 72  77  82  87  97
	 99 102 106 114 126
	131 138 145 148 155
	175 177 180 182 189
	197 206 209 219 221
	236 238 241 243 253
	258 260 273 282 309
	316 319 324 339
]
```

First differences,
OEIS [A072832](https://oeis.org/A072832):

```
>>> 94.ulamSequence.differences
[
	 1  1  1  2  2  3  2  3  2  8
	 2  8  2  9  1  5  4  5  7  3
	 5  5  5 10  2  3  4  8 12  5
	 7  7  3  7 20  2  3  2  7  8
	 9  3 10  2 15  2  3  2 10  5
	 2 13  9 27  7  3  5 15  2 15
	 2  5  7 12  8 10  2  7  3  2
	15  2  3  7 10  5 27  2 12  5
	20  2 20  2 20  2 17 17  3  2
	 5 12  3
]
```

Ulam sequence _i=1,3_,
OEIS [A002859](https://oeis.org/A002859):

```
>>> 60.ulamSequence([1 3])
[
	1 3 4 5 6 8 10 12 17 21 23 28 32 34
	39 43 48 52 54 59 63 68 72 74 79 83
	 98  99 101 110 114 121 125 132 136
	139 143 145 152 161 165 172 176 187
	192 196 201 205 212 216 223 227 232
	234 236 243 247 252 256 258
]
```

Ulam sequence _i=1,4_,
OEIS [A003666](https://oeis.org/A003666):

```
>>> 60.ulamSequence([1 4])
[
	1 4 5 6 7 8 10 16 18 19 21 31 32 33
	42 46 56 57 66 70 79 82  91  96 104
	105 107 116 129 130 131 141 158 165
	168 179 180 182 191 204 205 206 216
	217 218 219 229 230 244 256 266 267
	268 281 290 315 316 317 318 328
]
```

Ulam sequence _i=1,5_,
OEIS [A003667](https://oeis.org/A003667):

```
>>> 60.ulamSequence([1 5])
[
	1 5 6 7 8 9 10 12 20 22 23 24 26 38
	39 40 41 52 57 69 70 71 82 87 98 102
	113 119 129 130 133 144 160 161 162
	163 175 196 205 208 209 222 223 224
	226 237 253 254 255 256 268 269 270
	271 272 284 285 286 303 318
]
```

Ulam sequence _i=2,3_,
OEIS [A001857](https://oeis.org/A001857):

```
>>> 60.ulamSequence([2 3])
[
	2 3 5 7 8 9 13 14 18 19 24 25 29 30
	35 36 40 41 46 51 56 63 68 72 73 78
	79 83 84 89 94 115 117 126 153 160
	165 169 170 175 176 181 186 191 212
	214 230 235 240 245 266 273 278 283
	288 325 331 332 337 342
]
```

Ulam sequence _i=2,5_,
OEIS [A007300](https://oeis.org/A007300):

```
>>> 61.ulamSequence([2 5])
[
	2 5 7  9 11 12 13 15 19 23 27 29 35
	37 41 43 45 49 51 55 61 67 69 71 79
	83 85 87 89  95  99 107 109 119 131
	133 135 137 139 141 145 149 153 155
	161 163 167 169 171 175 177 181 187
	193 195 197 205 209 211 213 215
]
```

Ulam sequence _i=4,5_,
OEIS [A006844](https://oeis.org/A006844):

```
>>> 48.ulamSequence([4 5])
[
	4 5 9 13 14 17 19 21 24 25 27 35 37
	43 45 47 57 67 69 73 77 83 93 101
	105 109 113 115 123 125 133 149 153
	163 173 197 201 205 209 211 213 217
	219 227 229 235 237 239
]
```

Plot first few terms,
OEIS [A002858](https://oeis.org/A002858):

~~~spl svg=A
80.ulamSequence.scatterPlot
~~~

![](sw/spl/Help/Image/ulamSequence-A.svg)

Plot first differences,
OEIS [A072832](https://oeis.org/A072832):

~~~spl svg=B
175.ulamSequence
.differences
.scatterPlot
~~~

![](sw/spl/Help/Image/ulamSequence-B.svg)

* * *

References:
_Mathematica_
[1](https://mathworld.wolfram.com/UlamSequence.html),
_W_
[1](https://en.wikipedia.org/wiki/Ulam_number)
