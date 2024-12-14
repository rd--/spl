/* Requires: Tuning */

ScalaTuning : [Object, Tuning] { | contents |

	asCents { :self |
		let answer = self.pitches;
		answer.addFirst(0);
		answer
	}

	asRatios { :self |
		let answer = self.pitches;
		answer.allSatisfy(isFraction:/1).ifFalse {
			self.error('asRatios: non-ratio pitch')
		};
		answer.addFirst(1/1);
		answer
	}

	degree { :self |
		self.contents['degree']
	}

	description { :self |
		self.contents['description']
	}

	isRational { :self |
		self.contents.includesKey('limit')
	}

	limit { :self |
		self.contents['limit']
	}

	name { :self |
		self.contents['name']
	}

	octave { :self |
		let octave = self.contents['octave'];
		octave.isNumber.if {
			octave.centsToRatio
		} {
			octave.isList.if {
				let [numerator, denominator] = octave;
				Fraction(numerator, denominator)
			} {
				self.error('octave: invalid octave')
			}
		}
	}

	pitches { :self |
		self.contents['pitches'].collect { :each |
			each.isNumber.if {
				each
			} {
				each.isList.if {
					let [numerator, denominator] = each;
					Fraction(numerator, denominator)
				} {
					self.error('pitches: invalid pitch')
				}
			}
		}
	}

	primeLimit { :self |
		self.limit
	}

}

+Record {

	ScalaTuning { :self |
		newScalaTuning().initializeSlots(self)
	}

}

+System {

	categorizedTuningArchive { :self |
		self.requireLibraryItem('Music/Tuning/CategorizedTuningArchive')
	}

	scalaIntervalNames { :self |
		self.requireLibraryItem('Music/Tuning/ScalaIntervalNames')
	}

	scalaRationalTuningArchive { :self |
		self.cached('scalaRationalTuningArchive') {
			self.scalaTuningArchive.select { :each |
				each.isRational
			}.collect { :each |
				each.asRatioTuning
			}
		}
	}

	scalaScaleNames { :self |
		self.requireLibraryItem('Music/Scales/ScalaModeNames')
	}

	scalaTuningArchive { :self |
		self.requireLibraryItem('Music/Tuning/ScalaTuningArchive')
	}

}

+Fraction {

	intervalName { :self |
		system.scalaIntervalNames.atIfAbsent(
			self.printString
		) {
			'*unnamed interval*'
		}
	}

}

+String {

	namedInterval { :self |
		system.scalaIntervalNames.keyAtValueIfAbsent(self) {
			self.error('namedInterval: no such interval')
		}.parseFraction
	}

	namedTuning { :self |
		system.scalaTuningArchive.atIfAbsent(self) {
			self.error('namedTuning: no such tuning')
		}
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

LibraryItem(
	name: 'Music/Tuning/ScalaTuningArchive',
	url: 'https://rohandrape.net/sw/hmt/data/json/scala-db.json',
	mimeType: 'application/json',
	parser: { :libraryItem |
		libraryItem.collect(ScalaTuning:/1)
	}
)

LibraryItem(
	name: 'Music/Tuning/CategorizedTuningArchive',
	url: 'https://rohandrape.net/sw/hmt/data/json/scala-meta-au.json',
	mimeType: 'application/json',
	parser: identity:/1
)
