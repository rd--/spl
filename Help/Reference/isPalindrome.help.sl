# isPalindrome

- _isPalindrome(x)_

Answer `true` is _x_ is a palindrome, else `false`.

Empty and unary lists are considered palindromes:

```
>>> [].isPalindrome
true

>>> [1].isPalindrome
true
```

At odd list:

```
>>> [1 3 5 3 1].isPalindrome
true

>>> [1 2 3 4 5].isPalindrome
false
```

At even list:

```
>>> [2 4 6 6 4 2].isPalindrome
true

>>> [1 2 3 4 5 6].isPalindrome
false
```

At `String`:

```
>>> 'rotator'.isPalindrome
true

>>> 'rotator'.characters.isPalindrome
true
```

At `Integer`:

```
>>> 12321.isPalindrome
true

>>> 001232100.isPalindrome
false
```

Search for palindromic primes:

```
>>> 100.primesList.select(isPalindrome:/1)
[
	  2   3   5   7  11
	101 131 151 181 191
	313 353 373 383
]
```

English palindromic words:

```
>>> 'madam tenet redder racecar'
>>> .words.select(isPalindrome:/1)
['madam' 'tenet' 'redder' 'racecar']
```

Palindromic decimal integers:

```
>>> [12321 3883 100001]
>>> .collect(isPalindrome:/1)
[true true true]
```

Tetradic numbers,
the palindromic numbers containing only _(0,1,8)_ as digits,
OEIS [006072](https://oeis.org/A006072):

```
>>> [0 1 8].tuples(5)
>>> .collect(fromDigits:/1)
>>> .select(isPalindrome:/1)
[
	    0     1     8    11    88
	  101   111   181   808   818
	  888  1001  1111  1881  8008
	 8118  8888 10001 10101 10801
	11011 11111 11811 18081 18181
	18881 80008 80108 80808 81018
	81118 81818 88088 88188 88888
]
```

Find the palindromic Roman numerals up to 1000:

```
>>> 1:1000.romanNumeral
>>> .select(isPalindrome:/1)
[
	  'I'  'II' 'III'   'V'   'X'
	'XIX'  'XX' 'XXX'   'L'   'C'
	'CXC'  'CC' 'CCC'   'D'   'M'
]
```

The squares of 1, 11, 111 and so on are special palindromes:

```
>>> 1:9.collect { :n |
>>> 	let m = (1 # n).fromDigits;
>>> 	m.asLargeInteger.square
>>> }
[
	1
	121
	12321
	1234321
	123454321
	12345654321
	1234567654321
	123456787654321
	12345678987654321L
]
```

* * *

See also: =, reverse

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PalindromeQ.html),
_OEIS_
[1](https://oeis.org/A006072),
_W_
[1](https://en.wikipedia.org/wiki/Palindrome)
