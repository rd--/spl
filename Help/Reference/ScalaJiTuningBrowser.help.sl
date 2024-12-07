# ScalaRationalTuningBrowser

Tuning browser.

A `ColumnBrowser` on the just-intonation tunings subset of the _Scala_ scale database.

The browser is organised by degree and limit.

~~~
let url = 'https://rohandrape.net/sw/hmt/data/json/scala-ji-tuning.json';
url.fetchJson.then { :answer |
	let sk = system.smallKansas;
	let ji = answer.collect(asRatioTuning:/1);
	sk.addFrame(ScalaRationalTuningBrowser(sk, ji), nil)
}
~~~

* * *

See also: asRatioTuning, RatioTuning, SmallKansas

Categories: Kansas

References:
_Scala_
[1](https://www.huygens-fokker.org/scala/),
_Xenharmonic_
[1](https://en.xen.wiki/w/Scala)
