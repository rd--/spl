+[Integer, @SmallInteger] {

	oeisA001317 { :n |
		{ :x |
			x.bitXor(x.bitShiftLeft(1L))
		}.iterate(1L, n)
	}

	oeisA003961 { :n |
		(n = 1L).if {
			1L
		} {
			n.isPrime.if {
				(n.primePi + 1L).prime
			} {
				n.factorInteger.product { :x |
					oeisA003961(x[1L]) ^ x[2L]
				}
			}
		}
	}

	oeisA004718 { :n |
		let b = n.binaryExpansion.reverse;
		let z = 0L;
		let [p, q] = [0L, 0L];
		b.do { :i |
			(i = 0L).if {
				z := z + 1L
			} {
				z.isEven.if {
					p := p + 1L
				} {
					q := q + 1L
				}
			}
		};
		p - q
	}

	oeisA005940 { :n |
		(n - 1L).doudnaSequenceFunction
	}

	oeisA007814 { :n |
		n.integerExponent(2L)
	}

	oeisA007949 { :n |
		n.integerExponent(3L)
	}

	oeisA014486 { :n |
		n.catalanUnrank
	}

	oeisA020652 { :n |
		let c = 1L;
		let j = 1L;
		let k = 2L;
		{
			c < n
		}.whileTrue {
			k := k + 1L;
			c := c + k.eulerPhi
		};
		c := c - k.eulerPhi;
		{
			c < n
		}.whileTrue {
			(j.gcd(k) = 1L).ifTrue {
				c := c + 1L
			};
			j := j + 1L
		};
		j - 1L
	}

	oeisA020653 { :n |
		let c = 0L;
		let k = 2L;
		let j = 1L;
		{
			c < n
		}.whileTrue {
			c := c + k.eulerPhi;
			k := k + 1L
		};
		c := c - (k - 1L).eulerPhi;
		{
			c < n
		}.whileTrue {
			(j.gcd(k - 1L) = 1L).ifTrue {
				c := c + 1L
			};
			j := j + 1L
		};
		k - j
	}

	oeisA036044 { :n |
		(1L - n.binaryExpansion)
		.reverse
		.fromDigits(2L)
	}

	oeisA038567 { :n |
		let k = 0L;
		{
			1L.to(k).eulerPhi.sum <= n
		}.whileTrue {
			k := k + 1L
		};
		k
	}

	oeisA038568 { :n |
		let c = 1L;
		let k = 2L;
		let j = 1L;
		{
			c < n
		}.whileTrue {
			c := c + (2L * k.eulerPhi);
			k := k + 1L
		};
		c := c - (2L * (k - 1L).eulerPhi);
		{
			c < n
		}.whileTrue {
			(j.gcd(k - 1L) = 1L).ifTrue {
				c := c + 2L
			};
			j := j + 1L
		};
		(c > n).if {
			j - 1L
		} {
			k - 1L
		}
	}

	oeisA038569 { :n |
		let c = 1L;
		let k = 2L;
		let j = 1L;
		{
			c <= n
		}.whileTrue {
			c := c + (2L * k.eulerPhi);
			k := k + 1L
		};
		c := c - (2L * (k - 1L).eulerPhi);
		{
			c <= n
		}.whileTrue {
			(j.gcd(k - 1L) = 1L).ifTrue {
				c := c + 2L
			};
			j := j + 1L
		};
		(c > (n + 1L)).if {
			k - 1L
		} {
			j - 1L
		}
	}

	oeisA071156 { :n |
		n.oeisA014486.oeisA085198
	}

	oeisA080300 { :n |
		n.isDyckWord.if {
			n.catalanRank
		} {
			0L
		}
	}

	oeisA085198 { :n |
		let s = 0L;
		let h = 1L;
		let i = 2L;
		let fi = 1L;
		{
			n != 0L
		}.whileTrue {
			n.isOdd.if {
				n := (n - 1L) // 2L;
				h := h - 1L
			} {
				n := n // 2L;
				s := s + (h * fi);
				h := h + 1L;
				fi := fi * i;
				i := i + 1L
			}
		};
		s
	}

	oeisA101369 { :n |
		let m = 2.0.sqrt;
		n.isEven.if {
			n + (n / m - (1.0 / m)).floor
		} {
			1L + (n / m).floor
		}
	}

	oeisA122111 { :n |
		let p = n.factorInteger.collect { :f |
			List(f[2], f[1].primePi)
		}.catenate;
		let m = p.max;
		1L.to(m).product { :i |
			p.sum { :j |
				(j >= i).boole
			}.prime
		}
	}

	oeisA343029 { :n |
		let b = n.binaryExpansion.reverse;
		let z = 0L;
		let p = 0L;
		b.do { :i |
			(iL = 0).if {
				z := z + 1L
			} {
				z.isEven.ifTrue {
					p := p + 1L
				}
			}
		};
		p
	}

	oeisA343030 { :n |
		let b = n.binaryExpansion.reverse;
		let z = 0L;
		let q = 0L;
		b.do { :i |
			(i = 0L).if {
				z := z + 1L
			} {
				z.isOdd.ifTrue {
					q := q + 1L
				}
			}
		};
		q
	}

}

+System {

	oeisFunctionDictionary { :self |
		self.cached('oeisFunctionDictionary') {
			(
				'A001317': { :n | n.oeisA001317 },
				'A003961': { :n | n.oeisA003961 },
				'A005940': { :n | n.oeisA005940 },
				'A007814': { :n | n.oeisA007814 },
				'A007949': { :n | n.oeisA007949 },
				'A014486': { :n | n.oeisA014486 },
				'A020652': { :n | n.oeisA020652 },
				'A020653': { :n | n.oeisA020653 },
				'A036044': { :n | n.oeisA036044 },
				'A038567': { :n | n.oeisA038567 },
				'A038568': { :n | n.oeisA038568 },
				'A038569': { :n | n.oeisA038569 },
				'A071156': { :n | n.oeisA071156 },
				'A080300': { :n | n.oeisA080300 },
				'A085198': { :n | n.oeisA085198 },
				'A101369': { :n | n.oeisA101369 },
				'A122111': { :n | n.oeisA122111 },
				'A343029': { :n | n.oeisA343029 },
				'A343030': { :n | n.oeisA343030 }
			)
		}
	}

}

+String {

	oeisFunction { :self |
		system.oeisFunctionDictionary.at(self)
	}

}

+[Integer, @SmallInteger] {

	oeisA004001Terms { :k |
		let a = Map { :n |
			(n <= 2L).if {
				1L
			} {
				a[a[n - 1L]] + a[n - a[n - 1L]]
			}
		};
		a[1L .. kL]
	}

	oeisA051135Terms { :k |
		let m = (k + 2L) * 2L;
		let a = m.oeisA004001Terms;
		(k + 1L > a.max).if {
			k.error('oeisA051135Terms')
		} {
			let b = List(a.max, 0L);
			a.do { :i |
				b[i] := b[i] + 1L
			};
			b.first(k)
		}
	}

	oeisA306246Terms { :m |
		let o = List(m, 0L);
		let p = nil;
		let q = nil;
		1L.toCollect(m) { :n |
			let v = (n <= 2L).if {
				n
			} {
				q + p
			};
			q := p;
			p := o[1L + v] := o[1L + v] + 1L;
			v
		}
	}

}

+String {

	oeisTerms { :self :k |
		self.caseOf(
			[
				'A004001' -> { k.oeisA004001Terms },
				'A306246' -> { k.oeisA306246Terms },
				'A051135' -> { k.oeisA051135Terms }
			]
		)
	}

}

@OeisSequence {

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
		self.dataText
		.splitOn(',')
		.collect { :x |
			x.parseInteger.normalInteger
		}
	}

	isChanged { :self |
		self.keywords.includes('changed')
	}

	isComplete { :self |
		self.keywords.includes('full')
	}

	isConstant { :self |
		self.keywords.includes('cons')
	}

	isCore { :self |
		self.keywords.includes('core')
	}

	isEasy { :self |
		self.keywords.includes('easy')
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

	offset { :self |
		self.offsetText
		.splitOn(',')
		.collect(parseDecimalInteger/1)
	}

	readSequenceFile { :self :directoryName |
		system.readTextFile(
			self.sequenceFileName(directoryName)
		)
	}

	sequenceFileName { :self :directoryName |
		let k = self.identifier;
		let j = k.first(4);
		'%/seq/%/%.seq'.format([directoryName, j, k])
	}

	stableKeywords { :self |
		self.keywords.withoutUnstableOeisKeywords
	}

	subscriptOfFirstTerm { :self |
		self.offset.at(1)
	}

}

OeisEntry : [Object, Store, Equal, OeisSequence] {

	| identifier entryRecord bFileCache | <String>

	bFileData { :self |
		let bFileData = self.bFileCache;
		bFileData.ifNil {
			self.error('bFileData: not fetched')
		}
	}

	bFileIsValid { :self |
		let data = self.bFileData;
		let k = data.size;
		let indices = data.column(1L);
		let i = self.subscriptOfFirstTerm;
		indices = [i .. i + k - 1L]
	}

	bFileSequence { :self |
		self.bFileData.column(2L)
	}

	dataText { :self |
		self.lookupField('data')
	}

	fetch { :self |
		[
			self.fetchEntryRecord,
			self.fetchBFile
		].allFulfilled.then { :unused |
			self
		}
	}

	fetchBFile { :self |
		self.bFileUrl.cachedFetchMimeType(
			'OnlineEncyclopediaOfIntegerSequences',
			'text/plain'
		).then { :data |
			self.bFileCache := data.oeisParseBFile;
			self
		}
	}

	fetchEntryRecord { :self |
		let r = self.entryRecord;
		r.ifNil {
			self.jsonUrl.fetchMimeType(
				'application/json'
			).then { :data |
				let [entryRecord] = data;
				self.entryRecord := entryRecord;
				self
			}
		} {
			r.resolvedPromise
		}
	}

	isEqualBy { :self :operand :aFunction/2 |
		aFunction(self.identifier, operand.identifier)
	}

	keywords { :self |
		self.lookupField('keyword').splitOn(',')
	}

	lookupField { :self :key |
		let r = self.entryRecord;
		r.ifNil {
			self.fetchEntryRecord;
			self.error('lookupField: entry record not fetched')
		} {
			r.at(key)
		}
	}

	name { :self |
		self.lookupField('name')
	}

	number { :self |
		self.lookupField('number')
	}

	offsetText { :self |
		self.lookupField('offset')
	}

	storeString { :self |
		'OeisEntry(%)'.format([self.identifier.storeString])
	}

	then { :self :aFunction/1 |
		self.fetch.then(aFunction/1)
	}

	withData { :self :aFunction/1 |
		self.fetchEntryRecord.then { :e |
			aFunction(e.data)
		}
	}

}

+String {

	OeisEntry { :self |
		system.oeisEntries.atIfAbsentPut!(self) {
			uncheckedOeisEntry(self, nil, nil)
		}
	}

}

OeisSequenceFile : [Object, Equal, OeisSequence] {

	| identifier sequenceFileLines | <String>

	author { :self |
		self.uniqueField('%A')
	}

	dataText { :self |
		let s = self.uniqueField('%S');
		let t = self.uniqueFieldOrNil('%T');
		let u = self.uniqueFieldOrNil('%U');
		[s, t, u].deleteMissing.stringCatenate
	}

	field { :self :code |
		let prefix = '% % '.format([code, self.identifier]);
		self.sequenceFileLines.select { :each |
			each.beginsWith(prefix)
		}.collect { :each |
			each.drop(11L)
		}
	}

	keywords { :self |
		self.uniqueField('%K').splitOn(',')
	}

	name { :self |
		self.uniqueField('%N')
	}

	number { :self |
		self.identifier.allButFirst.parseDecimalInteger
	}

	offsetText { :self |
		self.uniqueField('%O')
	}

	uniqueField { :self :code |
		let [e] = self.field(code);
		e
	}

	uniqueFieldOrNil { :self :code |
		let e = self.field(code);
		e.size.caseOf(
			[
				0L -> { nil },
				1L -> { e[1L] }
			]
		) {
			self.error('uniqueFieldOrNil')
		}
	}

}

+String {

	OeisSequenceFile { :self :directoryName |
		uncheckedOeisSequenceFile(
			self,
			OeisEntry(self).readSequenceFile(directoryName).lines
		)
	}

	OeisSequenceFile { :self |
		OeisSequenceFile(
			self,
			system.environmentVariable('OEIS_DATA')
		)
	}

}

+String {

	isOeisIdentifier { :self |
		let c = self.characters;
		c.size = 7L & {
			c[1L] = 'A' & {
				2L.to(7L).allSatisfy { :i |
					c[i].isDigit
				}
			}
		}
	}

	oeisNumber { :self |
		self.allButFirst.parseDecimalInteger
	}

	oeisParseBFile { :self |
		self.lines.reject { :s |
			s.isEmpty | {
				s.beginsWith('#')
			}
		}.collect { :s |
			s.splitOn(' ').collect { :n |
				n.parseInteger.normalInteger
			}
		}
	}

}

+[Integer, @SmallInteger] {

	OeisEntry { :self |
		OeisEntry(self.oeisIdentifier)
	}

	oeisIdentifier { :self |
		'A' ++ self.integerString.padLeft([6L], '0')
	}

}

+System {

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
			).printLine
		};
		nil
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
			).printLine
		}
	}

	splOeisReferences { :self |
		self.cached('splOeisReferences') {
			self.helpIndex.names('Reference').collect { :n |
				let r = self.readHelpFile(n).oeisReferences;
				r.ifEmpty {
					nil
				} {
					n -> r
				}
			}.deleteMissing.Record
		}
	}

}

+System {

	oeisBFileData { :self |
		self.requireLibraryItem('OeisBFileData')
	}

	oeisEntries { :self |
		self.cached('oeisEntries') {
			Map()
		}
	}

}

LibraryItem(
	name: 'OeisBFileData',
	category: 'Math/IntegerSequences',
	url: 'https://rohandrape.net/sw/hsc3-data/data/oeis/OeisBFileData.json',
	mimeType: 'application/json',
	parser: identity/1
)

+List {

	oeisFunction { :self |
		self.collect(oeisFunction/1)
	}

	withoutUnstableOeisKeywords { :self |
		let unstable = ['changed', 'new'];
		self.reject { :each |
			unstable.includes(each)
		}
	}

}
