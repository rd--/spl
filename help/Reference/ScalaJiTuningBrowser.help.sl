# ScalaJiTuningBrowser

Tuning browser.

A _ColumnBrowser_ on the just-intonation tunings subset of the _Scala_ scale database.

The browser is organised by degree and limit.

	'https://rohandrape.net/sw/hmt/data/json/scala-ji-tuning.json'.fetchJson.then { :answer |
		let sk = system.smallKansas;
		let ji = answer.collect(JiTuning:/1);
		sk.addFrame(ScalaJiTuningBrowser(sk, ji), nil)
	}
