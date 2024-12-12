+System {

	jiMeta { :self |
		self.jiScala.then { :jiScala |
			self.requestLibraryItem(
				'Music/Tuning/Scala/JustIntonation/Authors'
			).then { :jiMeta |
				jiMeta.collect { :each |
					each.collect { :aName |
						jiScala[aName]
					}.select(notNil:/1)
				}
			}
		}
	}

	jiScala { :self |
		system.requestLibraryItem('Music/Tuning/Scala/JustIntonation')
	}

	scalaModenam { :self |
		self.requestLibraryItem('Music/Scales/ScalaModeNames')
	}

	scalaIntnam { :self |
		self.requestLibraryItem('Music/Scales/ScalaIntervalNames')
	}

}

+Fraction {

	intervalName { :self |
		let dataBase = system.requireLibraryItem('Music/Tuning/ScalaIntervalNames');
		dataBase.atIfAbsent(self.printString) {
			'*unnamed interval*'
		}
	}

}

+String {

	namedInterval { :self |
		let dataBase = system.requireLibraryItem('Music/Tuning/ScalaIntervalNames');
		let key = dataBase.keyAtValueIfAbsent(self) {
			self.error('namedInterval: no such interval')
		};
		key.parseFraction
	}

}

LibraryItem(
	name: 'Music/Tuning/Scala/JustIntonation',
	url: 'https://rohandrape.net/sw/hmt/data/json/scala-ji-tuning.json',
	mimeType: 'application/json',
	parser: { :libraryItem |
		libraryItem.collect { :each |
			each.includesKey('octave').if {
				let [numerator, denominator] = each['octave'];
				each['octave'] := Fraction(numerator, denominator)
			} {
				each['octave'] := 2/1
			};
			each.asRatioTuning
		}
	}
)

LibraryItem(
	name: 'Music/Tuning/Scala/JustIntonation/Authors',
	url: 'https://rohandrape.net/sw/hmt/data/json/scala-meta-au.json',
	mimeType: 'application/json',
	parser: identity:/1
)

LibraryItem(
	name: 'Music/Scales/ScalaModeNames',
	url: 'https://rohandrape.net/sw/hmt/data/json/scala-modenam.json',
	mimeType: 'application/json',
	parser: { :libraryItem |
		libraryItem.collect { :each |
			let [zeroIndexedStartIndex, intervals, description] = each;
			Scale(zeroIndexedStartIndex + 1, intervals, description)
		}
	}
)

LibraryItem(
	name: 'Music/Tuning/ScalaIntervalNames',
	url: 'https://rohandrape.net/sw/hmt/data/json/scala-intnam.json',
	mimeType: 'application/json',
	parser: { :libraryItem |
		let answer = ();
		libraryItem.keysAndValuesDo { :key :value |
			let [n, d] = value;
			answer.add(Fraction(n, d).printString -> key)
		};
		answer
	}
)
