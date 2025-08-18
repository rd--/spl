# integerString

- _integerString(n, b=10)_

Answer a string consisting of the base-_b_ digits in the integer _n_.

Convert to binary, giving the result as a string:

```
>>> 17651.integerString(2)
'100010011110011'
```

Base sixteen:

```
>>> 50L.!.integerString(16)
(
	'49EEBC961ED279B02B1EF4F28D1'
	++
	'9A84F5973A1D2C7800000000000'
)
```

Maximum base is thirty-six:

```
>>> 50L.!.integerString(36)
(
	'4Q7EYP9ZIZMTQT0648TXT'
	++
	'4FM720CC1S00000000000'
)
```

Show a single number in successive bases from 4 to 36:

```
>>> 4:36.collect { :b |
>>> 	20.!.integerString(b)
>>> }
[
	'2013003121313302002231000000000'
	'130402040313000221204440000'
	'302523154413030400000000'
	'4233013654405404511500'
	'207033167620255000000'
	'17178403115182870000'
	'2432902008176640000'
	'48A465613446217100'
	'111AAA198400000000'
	'386B8C91C4A80CC00'
	'118D2D096B2393A00'
	'5851344680390000'
	'21C3677C82B40000'
	'E7AD44D9FG741B0'
	'68F15HAG59A0000'
	'30G4092E8G5D0I0'
	'19DJ81EDHF40000'
	'FFFD9KD0G5D600'
	'8D5EAI80DA92G0'
	'4J0935I8L806H0'
	'2IEJJ64L000000'
	'1FKAKGF0C74O00'
	'PCM55B5BG8320'
	'G5HC33E5KQ900'
	'AD9MDO45A5K00'
	'6PBPK5PQ5HJG0'
	'4HA46OK4O0000'
	'32N98H5IOED00'
	'23GR7FI1B8000'
	'1F4G8HFH5EUI0'
	'10MHICWMA0HE0'
	'P6X99F2RYA00'
	'IHFBS9340000'
]
```

* * *

See also: digitSum, fromDigits, integerDigits, integerLength, romanNumeral

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/IntegerString.html)
