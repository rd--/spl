+SmallFloat {

	oeisA014486 { :n |
		n.catalanUnrank
	}

	oeisA071156 { :n |
		n.oeisA014486.oeisA085198
	}

	oeisA085198 { :n |
		let s = 0;
		let h = 1;
		let i = 2;
		let fi = 1;
		{ n != 0 }.whileTrue {
			n.isOdd.if {
				n := (n - 1) / 2;
				h := h - 1
			} {
				n := n / 2;
				s := s + (h * fi);
				h := h + 1;
				fi := fi * i;
				i := i + 1
			}
		};
		s
	}

}

OeisEntry : [Object, Storeable, Equatable] { | identifier:<String> contents bFile |

	bFileData { :self |
		self.bFile.ifNil {
			self.error('bFileData: not fetched')
		} { :bFile |
			bFile.column(2)
		}
	}

	bFileUrl { :self |
		Url(
			'https://oeis.org/%/b%.txt'.format(
				[
					self.identifier,
					self.identifier.allButFirst
				]
			)
		)
	}

	data { :self |
		self.lookupField('data')
		.splitBy(',')
		.collect { :x |
			x.parseLargeInteger.normal
		}
	}

	equalBy { :self :operand :aBlock:/2 |
		aBlock(self.identifier, operand.identifier)
	}

	fetch { :self |
		[
			self.fetchContents,
			self.fetchBFile
		].allFulfilled.then { :unused |
			self
		}
	}

	fetchContents { :self |
		self.contents.ifNil {
			self.jsonUrl.fetchMimeType(
				'application/json'
			).then { :data |
				let [entry] = data;
				self.contents := entry
			}
		} { :contents |
			contents.resolvedPromise
		}
	}

	fetchBFile { :self |
		self.bFileUrl.cachedFetchMimeType(
			'OnlineEncyclopediaOfIntegerSequences',
			'text/plain'
		).then { :data |
			self.bFile := data.oeisParseBFile;
			self
		}
	}

	isChanged { :self |
		self.keywords.includes('changed')
	}

	isConstant { :self |
		self.keywords.includes('cons')
	}

	isCore { :self |
		self.keywords.includes('core')
	}

	isEigensequence { :self |
		self.keywords.includes('eigen')
	}

	isFinite { :self |
		self.keywords.includes('fini')
	}

	isHard { :self |
		self.keywords.includes('hard')
	}

	isIrregularTable { :self |
		self.keywords.includes('tabf')
	}

	isMultiplicative { :self |
		self.keywords.includes('mult')
	}

	isNice { :self |
		self.keywords.includes('nice')
	}

	isNonNegative { :self |
		self.keywords.includes('nonn')
	}

	isTable { :self |
		self.keywords.includes('tabl')
	}

	isValid { :self |
		self.identifier.isOeisIdentifier
	}

	isWalk { :self |
		self.keywords.includes('walk')
	}

	jsonUrl { :self |
		Url(
			'https://oeis.org/search?q=id:%&fmt=json'.format(
				[
					self.identifier
				]
			)
		)
	}

	keywords { :self |
		self.lookupField('keyword').splitBy(',')
	}

	lookupField { :self :key |
		self.contents.ifNil {
			self.fetchContents;
			self.error('lookupField: contents not fetched')
		} { :contents |
			contents.at(key)
		}
	}

	name { :self |
		self.lookupField('name')
	}

	number { :self |
		self.lookupField('number')
	}

	offset { :self |
		self.lookupField('offset')
		.splitBy(',')
		.at(1)
		.parseDecimalInteger
	}

	stableKeywords { :self |
		let unstable = ['changed', 'new'];
		self.keywords.reject { :each |
			unstable.includes(each)
		}
	}

	storeString { :self |
		'OeisEntry(%)'.format([self.identifier.storeString])
	}

	then { :self :aBlock:/1 |
		self.fetch.then(aBlock:/1)
	}

}

+String {

	OeisEntry { :self |
		system.oeisEntries.atIfAbsentPut(self) {
			newOeisEntry().initializeSlots(self, nil, nil)
		}
	}

}

+String {

	isOeisIdentifier { :self |
		let c = self.characters;
		c.size = 7 & {
			c[1] = 'A' & {
				2:7.allSatisfy { :i |
					c[i].isDigit
				}
			}
		}
	}

	oeisParseBFile { :self |
		self.lines.reject { :s |
			s.isEmpty | {
				s.beginsWith('#')
			}
		}.collect { :s |
			s.splitBy(' ').collect { :n |
				n.parseLargeInteger.normal
			}
		}
	}

	oeisNumber { :self |
		self.allButFirst.parseDecimalInteger
	}

}

+@Integer {

	OeisEntry { :self |
		OeisEntry(self.oeisIdentifier)
	}

	oeisIdentifier { :self |
		'A' ++ self.asString.padLeft([6], '0')
	}

}

+System {

	splOeisReferences { :self |
		self.cached('splOeisReferences') {
			self.helpIndex.names('Reference').collect { :n |
				let r = self.readHelpFile(n).oeisReferences;
				r.ifEmpty {
					nil
				} {
					n -> r
				}
			}.deleteMissing.asRecord
		}
	}

	splOeisEntryListing { :self |
		let r = self.splOeisReferences;
		let e = r.values.catenate.nub.sort;
		e.do { :k |
			let v = r.select { :x |
				x.includes(k)
			}.keys;
			'- %: %'.format(
				[
					k,
					v.collect { :x |
						'`%`'.format([x])
					}.stringIntercalate(', ')
				]
			).postLine
		}
	}

	splOeisMethodListing { :self |
		self.splOeisReferences.keysAndValuesDo { :k :v |
			'- `%`: %'.format(
				[
					k,
					v.isEmpty.if {
						'...'
					} {
						v.unwords
					}
				]
			).postLine
		}
	}

}

+System {

	oeisEntries { :self |
		self.cached('oeisEntries') {
			Map()
		}
	}

	oeisSequenceData { :self |
		self.requireLibraryItem('OeisSequenceData')
	}

}

LibraryItem(
	name: 'OeisSequenceData',
	category: 'Math/IntegerSequences',
	url: 'https://rohandrape.net/sw/hsc3-data/data/oeis/oeis.json',
	mimeType: 'application/json',
	parser: identity:/1
)
