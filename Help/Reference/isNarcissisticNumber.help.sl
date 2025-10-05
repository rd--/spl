# isNarcissisticNumber

- _isNarcissisticNumber(n, b=10)_

Answer `true` if the integer _n_ is a narcissistic number in base _b_,
also called an Armstrong or pluperfect or plus perfect number.

In base ten:

```
>>> 1:2000.select(
>>> 	isNarcissisticNumber:/1
>>> )
[1 2 3 4 5 6 7 8 9 153 370 371 407 1634]
```

In base four:

```
>>> 1:250.select { :x |
>>> 	x.isNarcissisticNumber(4)
>>> }
[1 2 3 28 29 35 43 55 62 83 243]
```

In base five:

```
>>> 1:500.select { :x |
>>> 	x.isNarcissisticNumber(5)
>>> }
[1 2 3 4 13 18 28 118 289 353 419]
```

In base six:

```
>>> 1:2500.select { :x |
>>> 	x.isNarcissisticNumber(6)
>>> }
[1 2 3 4 5 99 190 2292 2293 2324]
```

In base seven:

```
>>> 1:250.select { :x |
>>> 	x.isNarcissisticNumber(7)
>>> }
[1 2 3 4 5 6 10 25 32 45 133 134 152 250]
```

In base eight:

```
>>> 1:500.select { :x |
>>> 	x.isNarcissisticNumber(8)
>>> }
[1 2 3 4 5 6 7 20 52 92 133 307 432 433]
```

In base nine:

```
>>> 1:500.select { :x |
>>> 	x.isNarcissisticNumber(9)
>>> }
[1 2 3 4 5 6 7 8 41 50 126 127 468 469]
```

* * *

See also: ^, integerDigits, integerLength, isHappyNumber, isPowerfulNumber, sum

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/NarcissisticNumber.html),
_OEIS_
[1](https://oeis.org/A005188)
[2](http://oeis.org/A010344)
[3](http://oeis.org/A010346)
[4](http://oeis.org/A010348)
[5](http://oeis.org/A010350)
[6](http://oeis.org/A010353)
[7](http://oeis.org/A010354),
_W_
[1](https://en.wikipedia.org/wiki/Narcissistic_number)
