# ragisma

- _ragisma(n)_

Answer the ragisma,
an unnoticeable 7-limit comma,
raised to the power of _n_.

```
>>> 1.ragisma
4375/4374

>>> 1.ragisma.isSuperparticular
true
```

It has a size of about 0.396¢:

```
>>> 1.ragisma.ratioToCents
0.39576
```

It is the difference between the septimal minor third (7:6) and two Bohlen–Pierce small semitones (27:25):

```
>>> 7/6 / (27/25 ^ 2)
4375/4374
```

It is also the difference between a stack of four classical whole tones (10/9) and 32/21:

```
>>> (10/9 ^ 4) / 32/21
4375/4374
```

It is also the difference between a stack of four classical minor thirds (6/5) octave-reduced and 28/27:

```
>>> 28/27 / (6/5 ^ 4).octaveReduce
4375/4374
```

It is also the difference between minor Bohlen–Pierce diesis (245:243) and septimal semicomma (126:125):

```
>>> 245/243 / 126/125
4375/4374
```

It is also the difference between the septimal third tone (28:27) and the greater diesis (648:625):

```
>>> 28/27 / 648/625
4375/4374
```

* * *

See also: isSuperparticular, schisma

Guides: Xenharmonic Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Ragisma),
_Xenharmonic_
[1](https://en.xen.wiki/w/4375/4374)

Categories: Math, Contant, Tuning
