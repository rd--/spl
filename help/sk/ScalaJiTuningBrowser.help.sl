# ScalaJiTuningBrowser -- tuning browser

A _ColumnBrowser_ on the just-intonation tunings subset of the _Scala_ scale database.

The browser is organised by degree and limit.

```
system.window.fetchJson(
	'https://rohandrape.net/sw/hmt/data/json/scala-ji-tuning.json',
	()
).then { :answer |
	ji := answer.collect(JiTuning:/1);
	system.smallKansas.addFrame(ji.ScalaJiTuningBrowser, nil)
}
```
