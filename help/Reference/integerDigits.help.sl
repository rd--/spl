# integerDigits

- _integerDigits(anInteger, base)_
- _integerDigits(alpha)_ => _integerDigits(alpha, 10)_

Answer a list of the decimal digits in the integer _anInteger_.

Find digits in base 10:

```
>>> 58127.integerDigits
[5 8 1 2 7]
```

Find digits in base 2 & 3:

```
>>> 58127.integerDigits(2)
[1 1 1 0 0 0 1 1 0 0 0 0 1 1 1 1 ]

>>> 58127.integerDigits(3)
[2 2 2 1 2 0 1 2 1 2]
```

Bases larger than 10 can be used:

```
>>> 58127.integerDigits(16)
[14 3 0 15]
```

Threads over lists:

```
>>> [6 7 2].integerDigits(2)
[1 1 0; 1 1 1; 1 0]
```

Find the digits of 7 in different bases:

```
>>> 7.integerDigits(2:4)
[1 1 1; 2 1; 1 3]
```

Find only the last 4 digits:

```
>>> 6345354.integerDigits(10, 4)
[5 3 5 4]
```

Count from zero to seven in binary, answers to three places:

```
>>> 0:7.integerDigits(2, 3)
[0 0 0; 0 0 1; 0 1 0; 0 1 1; 1 0 0; 1 0 1; 1 1 0; 1 1 1]
```

* * *

See also: digitCount

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Digit.html)
[2](https://reference.wolfram.com/language/ref/IntegerDigits.html)
