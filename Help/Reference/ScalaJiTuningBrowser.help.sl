# ScalaRationalTuningBrowser

Tuning browser.

A `ColumnBrowser` on the just-intonation tunings subset of the _Scala_ scale database.

The browser is organised by degree and limit.

~~~spl kansas
system.requestLibraryItem(
	'ScalaTuningArchive'
).then { :answer |
	let smallKansas = system.smallKansas;
	smallKansas.addFrame(
		ScalaRationalTuningBrowser(
			smallKansas,
			answer
		),
		nil
	)
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
