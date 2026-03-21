# magicSquareSummary

- _magicSquareSummary(m)_

Summarise the properties of a magic square.
A matrix-vector product sums the rows,
a vector-matrix product sums the columns,
also shows the diagonal and antidiagonal sums and the matrix rank.

The only 3×3 magic square,
called the Loh-Shu square,
lexicographically largest variant when read by columns,
OEIS [A033812](https://oeis.org/A033812),
also,
with rows reversed,
OEIS [A126709](https://oeis.org/A126709):

```
>>> let m = 3.magicSquare;
>>> (m, m.magicSquareSummary)
(
	[
		8 1 6;
		3 5 7;
		4 9 2
	],
	(
		sum: 15,
		rowSums: [15 15 15],
		columnSums: [15 15 15],
		diagonalSum: 15,
		anitdiagonalSum: 15,
		rank: 3
	)
)
```

The Loh-Shu magic square multiplied by five,
OEIS [A126652](https://oeis.org/A126652):

```
>>> let m = 3.magicSquare * 5;
>>> (m, m.magicSquareSummary.values)
(
	[40 5 30; 15 25 35; 20 45 10],
	[15, [75 75 75], [75 75 75], 75, 75, 3]
)
```

The Loh-Shu magic square multiplied by three,
OEIS [A126653](https://oeis.org/A126653):

```
>>> let m = 3.magicSquare * 3;
>>> (m, m.magicSquareSummary.values)
(
	[24 3 18; 9 15 21; 12 27 6],
	[15, [45 45 45], [45 45 45], 45, 45, 3]
)
```

A 3×3 magic square,
OEIS [A126654](https://oeis.org/A126654):

```
>>> [32 4 24; 12 20 28; 16 36 8]
>>> .magicSquareSummary.values
[15, [60 60 60], [60 60 60], 60, 60, 3]
```

A 4×4 magic square:

```
>>> [
>>> 	2 16 13 3;
>>> 	11 5 8 10;
>>> 	7 9 12 6;
>>> 	14 4 1 15
>>> ].magicSquareSummary
(
	sum: 34,
	rowSums: [34 34 34 34],
	columnSums: [34 34 34 34],
	diagonalSum: 34,
	anitdiagonalSum: 34,
	rank: 3
)
```

A 4×4 magic square,
found in a Jaina inscription of the twelfth century,
OEIS [A126710](https://oeis.org/A126710):


```
>>> [
>>> 	7 12 1 14;
>>> 	2 13 8 11;
>>> 	16 3 10 5;
>>> 	9 6 15 4
>>> ].magicSquareSummary.values
[34, [34 34 34 34], [34 34 34 34], 34, 34, 3]
```

A 5×5 magic square,
OEIS [A127907](https://oeis.org/A127907):

```
>>> [
>>> 	17 24  1  8 15;
>>> 	23  5  7 14 16;
>>> 	04  6 13 20 22;
>>> 	10 12 19 21  3;
>>> 	11 18 25  2  9
>>> ].magicSquareSummary.values
[65, 5 # [65], 5 # [65], 65, 65, 5]
```

A 6×6 magic square,
OEIS [A126976](https://oeis.org/A126976):

```
>>> [
>>> 	6 32 3 34 35 1;
>>> 	7 11 27 28 8 30;
>>> 	19 14 16 15 23 24;
>>> 	18 20 22 21 17 13;
>>> 	25 29 10 9 26 12;
>>> 	36 5 33 4 2 31
>>> ].magicSquareSummary.values
[111, 6 # [111], 6 # [111], 111, 111, 6]
```

A 7×7 magic square,
OEIS [A126651](https://oeis.org/A126651):

```
>>> [
>>> 	71  1 51 32 50  2 80;
>>> 	21 41 61 56 26 13 69;
>>> 	31 81 11 20 62 65 17;
>>> 	34 40 60 43 28 64 18;
>>> 	48 42 22 54 39 75  7;
>>> 	33 53 15 68 16 44 58;
>>> 	49 29 67 14 66 24 38
>>> ].magicSquareSummary.values
[175, 7 # [287], 7 # [287], 287, 322, 7]
```

A 9×9 magic square,
OEIS [A126650](https://oeis.org/A126650):

```
>>> [
>>> 	71  1 51 32 50  2 80  3 79;
>>> 	21 41 61 56 26 13 69 25 57;
>>> 	31 81 11 20 62 65 17 63 19;
>>> 	34 40 60 43 28 64 18 55 27;
>>> 	48 42 22 54 39 75  7 10 72;
>>> 	33 53 15 68 16 44 58 77  5;
>>> 	49 29 67 14 66 24 38 59 23;
>>> 	76  4 70 73  8 37 36 30 35;
>>> 	06  78 12  9 74 45 46 47 52
>>> ].magicSquareSummary.values
[369, 9 # [369], 9 # [369], 369, 369, 9]
```

Dürer’s 4×4 magic square,
OEIS [A080992](https://oeis.org/A080992):

```
>>> [
>>> 	16 3 2 13;
>>> 	5 10 11 8;
>>> 	9 6 7 12;
>>> 	4 15 14 1
>>> ].magicSquareSummary.values
[34, [34 34 34 34], [34 34 34 34], 34, 34, 3]
```

A 4×4 permutation-free magic square,
OEIS [A125519](https://oeis.org/A125519):

```
>>> [
>>> 	831 326 267 574;
>>> 	584 257 316 841;
>>> 	158 683 742 415;
>>> 	425 732 673 168
>>> ].magicSquareSummary.values
[34, 4 # [1998], 4 # [1998], 1998, 1998, 4]

```

Benjamin Franklin’s 16×16 magic square,
OEIS [A124472](https://oeis.org/A124472):

```
>>> [
>>> 	200 217 232 249 8 25 40 57
>>> 	72 89 104 121 136 153 168 185
>>> 	;
>>> 	58 39 26 7 250 231 218 199
>>> 	186 167 154 135 122 103 90 71
>>> 	;
>>> 	198 219 230 251 6 27 38 59
>>> 	70 91 102 123 134 155 166 187
>>> 	;
>>> 	60 37 28 5 252 229 220 197
>>> 	188 165 156 133 124 101 92 69
>>> 	;
>>> 	201 216 233 248 9 24 41 56
>>> 	73 88 105 120 137 152 169 184
>>> 	;
>>> 	55 42 23 10 247 234 215 202
>>> 	183 170 151 138 119 106 87 74
>>> 	;
>>> 	203 214 235 246 11 22 43 54
>>> 	75 86 107 118 139 150 171 182
>>> 	;
>>> 	53 44 21 12 245 236 213 204
>>> 	181 172 149 140 117 108 85 76
>>> 	;
>>> 	205 212 237 244 13 20 45 52
>>> 	77 84 109 116 141 148 173 180
>>> 	;
>>> 	51 46 19 14 243 238 211 206
>>> 	179 174 147 142 115 110 83 78
>>> 	;
>>> 	207 210 239 242 15 18 47 50
>>> 	79 82 111 114 143 146 175 178
>>> 	;
>>> 	49 48 17 16 241 240 209 208
>>> 	177 176 145 144 113 112 81 80
>>> 	;
>>> 	196 221 228 253 4 29 36 61 68
>>> 	93 100 125 132 157 164 189
>>> 	;
>>> 	62 35 30 3 254 227 222 195 190
>>> 	163 158 131 126 99 94 67
>>> 	;
>>> 	194 223 226 255 2 31 34 63
>>> 	66 95 98 127 130 159 162 191
>>> 	;
>>> 	64 33 32 1 256 225 224 193
>>> 	192 161 160 129 128 97 96 65
>>> ].magicSquareSummary.values
[
	2056,
	16 # [2056],
	16 # [2056],
	1928,
	2184,
	3
]
```

A non-magic square:

```
>>> [3 3].iota.magicSquareSummary
(
	sum: 15,
	rowSums: [6 15 24],
	columnSums: [12 15 18],
	diagonalSum: 15,
	anitdiagonalSum: 15,
	rank: 2
)
```

* * *

See also: antidiagonal, diagonal, isMagicSquare, magicHexagon, magicSquare, matrixRank

Guides: Magic Square Functions, Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MagicSquare.html),
_OEIS_
[1](https://oeis.org/A033812)
[2](https://oeis.org/A126649)
[3](https://oeis.org/A126650)
[4](https://oeis.org/A126651)
[5](https://oeis.org/A127907)
_W_
[1](https://en.wikipedia.org/wiki/Magic_square)
