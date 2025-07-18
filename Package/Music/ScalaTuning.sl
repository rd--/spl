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
		self.contents['limit']
	}

}

+Record {

	ScalaTuning { :self |
		newScalaTuning().initializeSlots(self)
	}

}

+System {

	scalaIntervalArchive { :self |
		self.requireLibraryItem('ScalaIntervalArchive')
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

	scalaScaleArchive { :self |
		self.requireLibraryItem('ScalaScaleArchive')
	}

	scalaTuningArchive { :self |
		self.requireLibraryItem('ScalaTuningArchive')
	}

	scalaTuningMetaArchive { :self |
		self.requireLibraryItem('ScalaTuningMetaArchive')
	}

}

+Fraction {

	intervalName { :self |
		system.scalaIntervalArchive.atIfAbsent(
			self.printString
		) {
			'*unnamed interval*'
		}
	}

	intervalNameList { :self |
		self.intervalName.splitBy(', ')
	}

}

+String {

	namedInterval { :self |
		system.scalaIntervalArchive.keyAtValueIfAbsent(self) {
			self.error('namedInterval: no such interval')
		}.parseFraction
	}

	namedTuning { :self |
		system.scalaTuningArchive.atIfAbsent(self) {
			self.error('namedTuning: no such tuning')
		}
	}

}

+List {

	intervalName { :self |
		self.collect(intervalName:/1)
	}

	tuningName { :self |
		self.isVector.if {
			system.scalaRationalTuningArchive.detectIfFoundIfNone { :each |
				each.asRatios ~ self
			} { :each |
				each.name
			} {
				'*unnamed tuning*'
			}
		} {
			self.collect(tuningName:/1)
		}
	}

}

LibraryItem(
	name: 'ScalaScaleArchive',
	category: 'Music/Tuning',
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
	name: 'ScalaIntervalArchive',
	category: 'Music/Tuning',
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
	name: 'ScalaTuningArchive',
	category: 'Music/Tuning',
	url: 'https://rohandrape.net/sw/hmt/data/json/scala-db.json',
	mimeType: 'application/json',
	parser: { :libraryItem |
		libraryItem.collect(ScalaTuning:/1)
	}
)

LibraryItem(
	name: 'ScalaTuningMetaArchive',
	category: 'Music/Tuning',
	url: 'https://rohandrape.net/sw/hmt/data/json/scala-meta-au.json',
	mimeType: 'application/json',
	parser: identity:/1
)
