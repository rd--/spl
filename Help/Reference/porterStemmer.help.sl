# porterStemmer

- _porterStemmer(w)_

Answer the stemmed form of the word _w_, removing plurals, inflections, and so on.

Find the stemmed form of a word:

```
>>> 'dogs'.porterStemmer
'dog'
```

Stem a list of words:

```
>>> ['dogs' 'cats' 'crying' 'running']
>>> .porterStemmer
['dog' 'cat' 'cry' 'run']

>>> 'fishing fished fisher'
>>> .words.porterStemmer
['fish' 'fish' 'fisher']

>>> 'adoption formative formalize'
>>> .words.porterStemmer
['adopt' 'form' 'formal']

>>> 'hopeful goodness dependent'
>>> .words.porterStemmer
['hope' 'good' 'depend']

>>> 'allowance inference adjustable'
>>> .words.porterStemmer
['allow' 'infer' 'adjust']

>>> 'effective plastered motoring failing'
>>> .words.porterStemmer
['effect' 'plaster' 'motor' 'fail']
```

The Porter stemmer does not always return a proper English word:

```
>>> 'irritating'.porterStemmer
'irrit'

>>> 'apples'.porterStemmer
'appl'
```

The Porter stemmer does not always stem a word:

```
>>> 'fisher'.porterStemmer
'fisher'
```

* * *

See also: RegularExpression, String

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/WordStem.html),
_Porter_
[1](https://tartarus.org/martin/PorterStemmer/),
_W_
[1](https://en.wikipedia.org/wiki/Stemming)
