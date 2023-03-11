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
			{ :item |
				item.collect(JiTuning:/1)
			}
		)
	);
	system.addLibraryItem(
		LibraryItem(
			'jiMeta',
			'https://rohandrape.net/sw/hmt/data/json/scala-meta-au.json',
			'application/json',
			{ :item |
				system.requireLibraryItem('jiScala') { :jiScala |
					item.collect { :anArray |
						anArray.collect { :aName |
							jiScala[aName]
						}.select(notNil:/1)
					}
				}
			}
		)
	);
	system.addLibraryItem(
		LibraryItem(
			'helpIndex',
			'https://rohandrape.net/sw/jssc3/text/smallhours-help.text',
			'text/plain',
			identity:/1
		)
	);
	system.addLibraryItem(
		LibraryItem(
			'programIndex',
			'https://rohandrape.net/sw/jssc3/text/smallhours-programs.text',
			'text/plain',
			identity:/1
		)
	);
	system.addLibraryItem(
		LibraryItem(
			'programOracle',
			'https://rohandrape.net/sw/jssc3/text/smallhours-oracle.text',
			'text/plain',
			identity:/1
		)
	)
}
