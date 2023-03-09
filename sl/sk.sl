loadSequence([
	'Graphics.sl',
	'Navigator/Dom.sl',
	'Navigator/Midi.sl',
	'SmallKansas.sl'
]).then { :unusedValue |
	workspace::smallKansas := SmallKansas();
	system.addLibraryItem(
		LibraryItem(
			'jiScala',
			'https://rohandrape.net/sw/hmt/data/json/scala-ji-tuning.json',
			'application/json',
			{ :answer | answer.collect(JiTuning:/1) }
		)
	);
	system.addLibraryItem(
		LibraryItem(
			'jiMeta',
			'https://rohandrape.net/sw/hmt/data/json/scala-meta-au.json',
			'application/json',
			{ :answer |
				answer.collect { :anArray |
					anArray.collect { :aName |
						workspace::jiScala.detectIfNone { :each |
							each.name = aName
						} {
							('jiMeta: undetected: ' ++ aName).postLine;
							nil
						}
					}.select(notNil:/1)
				}
			}
		)
	)
}
