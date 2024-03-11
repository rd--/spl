# sentences

- _sentences(aString)_

Answer a `List` of sentences in _aString_.
This is a simple `RegExp` based method and will not work for complex sentences.

```
>>> 'First sentence. Second sentence. Third sentence.'.sentences
['First sentence.', ' Second sentence.', ' Third sentence.']
```

It does handle a number of common cases:

```
>>> 'A.  B!!  C? "D." E 2.3 f.g. (H.)'.sentences
['A.', '  B!!', '  C?', ' "D."', ' E 2.3 f.g.', ' (H.)']
```

Including common Markdown cases:

```
>>> '_A_ b *c* [d](http://x.y/z) e. *F*, g. ![H](i). `I` j...'.sentences
['_A_ b *c* [d](http://x.y/z) e.', ' *F*, g.', ' ![H](i).', ' `I` j...']
```

* * *

See also: lines, paragraphs, words
