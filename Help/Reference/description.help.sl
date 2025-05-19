# description

- _description(x)_

Answer a textual description of the value _x_, if there is one.

At `Scale`:

```
>>> 'Major'
>>> .namedScale
>>> .description
>>> .splitBy(', ')
[
	'G.Lydian'
	'M.Ionian'
	'M.Hypolydian'
	'Major'
	'Bilaval That'
	'Mela Shankarabharanam'
	'Raga Atana'
	'Ghana Heptatonic'
	'Peruvian Major'
	'Matzore'
	'Rast ascending: Greece'
	'4th plagal Byzantine'
	'Ararai: Ethiopia'
	'Makam Cargah'
	'Ajam Ashiran'
	'Dastgah-e Mahur'
	'Dastgah-e Rast Panjgah'
	'Xin: China'
	'DS2'
	'Heptatonia prima'
]
```

At `Error`, describes in a human readable form an occurrence of an exception.
If an explicit message text was provided by the signaler of the exception, that text should be incorporated into the description.

```
>>> Error('message text').description
'Error: message text'
```

* * *

See also: error, Error, messageText, reason, Scale

Guides: Scale Functions, Tuning Functions

References:
_Smalltalk_
5.5.1.2

Categories: Errors
