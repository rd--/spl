# sentences

- _sentences(aString)_

Answer a `List` of sentences in _aString_.
This is a simple `RegExp` based method and will not work for complex sentences.

```
>>> 'A sentence. Another. A third.'
>>> .sentences
['A sentence.', ' Another.', ' A third.']
```

It does handle a number of common cases:

```
>>> 'A.  B!!  C? "D." E 2.3 f.g. (H.)'
>>> .sentences
[
	'A.'
	'  B!!'
	'  C?'
	' "D."'
	' E 2.3 f.g.'
	' (H.)'
]
```

Including common Markdown cases:

```
>>> [
>>> 	'_A_ b *c* [d](http://x.y/z) e.'
>>> 	'*F*, g.'
>>> 	'![H](i).'
>>> 	'`I` j...'
>>> ].join(' ').sentences
[
	'_A_ b *c* [d](http://x.y/z) e.',
	' *F*, g.',
	' ![H](i).',
	' `I` j...'
]
```

* * *

See also: lines, paragraphs, words

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/TextSentences.html)
