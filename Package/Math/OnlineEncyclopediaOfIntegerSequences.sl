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
		.collect(parseDecimalInteger:/1)
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
				n.parseDecimalInteger
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

	oeisSplFunctionReferenceTable { :self |
		self.cached('oeisSplFunctionReferenceTable') {
			(
				accumulate: [000124],
				additivePersistence: [031286],
				aliquotSequence: [008892 044050 072890],
				aliquotSum: [001065],
				antidiagonalArray: [049581 114327],
				antiDivisors: [058838 066272 066518 066519 130799],
				aperysConstant: [002117],
				arithmeticGeometricMean: [068521 084895 084896 084897],
				arithmeticProgression: [000027 001477 005408 005843 008585 008586 299174],
				arshonsSequence: [099054],
				artinsConstant: [005596],
				balancedCayleyTree: [003945 003946 003947 025192 083329 136412],
				baumSweetSequence: [086747],
				beattySequence: [000201 001950 001951 001952 022838 022843 022844 054347 054385 054386 054406],
				bellB: [106800],
				bellNumber: [000110 011971],
				bernoulliNumber: [000367 001067 002445 006953 007703],
				bernoulliSequence: [027641 027642],
				bernoulliTriangle: [008949],
				betaExpansion: [058840 058841],
				binaryExpansion: [007088],
				binomial: [000125 000127 000262 000332 000984 001405 002260 004736 006004 006542 007318 027907 052509 053121 053202 059678 059797 060693 105278 108838 109449 166556 182309],
				binomialTransform: [000079 000110 001519 001906 004211 004212 006004 052467 121497],
				bitAnd: [053381 080080 246028 261892 279125],
				bitLength: [003817 029837],
				bitOr: [086099],
				bitReversalPermutation: [030109 049773],
				bitShiftLeft: [001317 062383 280995],
				bitShiftRight: [001511],
				bitXor: [003188 003987 038554 048720 145768 193231 193232],
				boustrophedonTransform: [000111 000667 000744 000747 062162 230952 230954 230955 230960],
				boustrophedonTriangle: [008281],
				braceletCount: [000029 027671 032275 081720],
				brunsConstant: [065421],
				calabisConstant: [046095 046096],
				calkinWilfSequence: [002487],
				cantorNumbers: [005823],
				cantorStaircase: [095844 095845],
				carmichaelLambda: [002322 002997],
				cartesianIndexToDiagonalIndex: [000124 000217],
				catalanExpansion: [014418],
				catalanIndex: [081288 081290],
				catalanNumber: [000108 002420 014137 014138 072643 081290 244160],
				catalanRank: [215406],
				catalanRestrictedGrowthString: [239903],
				catalansConstant: [006752],
				catalanTriangle: [000096 005586 005587 009766],
				catalanUnrank: [014486 057514 080300],
				ceiling: [001057 005041 006590],
				centeredHexagonalNumber: [003215],
				centeredPolygonalNumber: [001844 003215 005448 005891 069099 069131],
				champernowneSequence: [007376 030190 030303 054634 054635],
				chebyshevT: [008310 053120],
				chebyshevU: [008312 053117],
				chordDiagramCount: [007769],
				circumflexAccent: [000272],
				collatzSequence: [006577 006877 008884 033478 057216 057446 057522 057534 057614 057684 057685 057686 057687 057688 057691 070165 127824 210468],
				collect: [057145],
				conjugatePartition: [000700],
				connellSequence: [001614],
				continuedFraction: [003417 028356 072728 072729 141821 141822],
				convergents: [001040 001053],
				convolve: [001629],
				conwaysConstant: [014715],
				copelandErdosSequence: [033308],
				cos: [268038],
				cot: [069855],
				coth: [085984],
				count: [066272],
				cyclotomic: [051417],
				cyclotomicGraph: [137827],
				deBruijnSequenceCount: [016031],
				Decimal: [028356],
				decimalPeriod: [001913 002329 002371 051626],
				decimalSelvageNumber: [071789 071790 071791 071792 071793 071873],
				delannoyNumber: [001850 008288],
				delannoySequence: [008288],
				denominator: [061036],
				derangements: [000166],
				differences: [049296 051712 053230],
				digitalRoot: [010878 010888],
				digitCount: [000069 000120 000788 001969 005811 005823 006046 011754 023416 046645 048883 059015],
				digitSum: [000120 007953 053735 053737 053824 053827 053828 053829 053830],
				discriminant: [007878],
				dispersionArray: [035506 035507 035513 114537 191426 191455],
				distinctPrimeFactors: [008472],
				divisible: [019554 137921],
				divisors: [001227 008307 023890 030057 033676 051764 161908 167408],
				divisorSigma: [000005 000203 001158 001600 003601 005114 005238 006218 007956 020487 024916 038548 047983 051444 053238 056757 058197 064491 078923],
				divisorSum: [001055 002129],
				divisorSummatoryFunction: [006218],
				doubleFactorial: [000165 001147 076668],
				doudnaSequence: [005940],
				dualZeckendorfRepresentation: [003754 104325 104326 112309 112310 328212 331191],
				dysonCrank: [064391],
				e: [000062 001113 003417],
				ehrenfeuchtMycielskiSequence: [038219 201881 253060 308173],
				ekgSequence: [064413 064664],
				elementaryCellularAutomaton: [070950 070952],
				ellipticPi: [138498],
				engelExpansion: [000027 006784 028254],
				entringerTriangle: [008281],
				equispacedTriples: [002620],
				erdosSelfridgeFunction: [003458],
				euclidNumber: [006862],
				eulerGamma: [002852 001620 002852 094640],
				eulerGradusSuavitatis: [275314],
				eulerianNumber: [008292],
				eulerianNumberSecondOrder: [008517],
				eulerNumber: [000111 000364 028296 122045],
				eulerPhi: [000010 002088 003401 003434 005728 007694 010554 018804 025475 046644 049108 076512 115114 118778 167766 185670 234642],
				eulerPhiInverse: [007366 007617 014197 032447 058812],
				eulerTransform: [000041 000219 000335 001970 023871 034691 034899 061255 061256 166861],
				eulerUpDownNumber: [000111],
				evenPart: [006519],
				fabiusFunction: [272755 272757],
				factorial: [000142 000435 002034 002866 003319 003422 005130 049984 055151 092495 188914],
				factorialExpansion: [034968],
				factorialNumberSystemEncode: [007623 071156 071158 085198],
				factorialPower: [068424],
				factorInteger: [003415 003961 006881 008475 051282 066990 124859 321029],
				fareySequence: [005728 006842 006843],
				feigenbaumConstant: [006890],
				fibonacci: [000045 000071 000119 000129 001060 001076 001177 001595 001605 002708 003893 006190 010048 047930 052918 058071 105870 155114 180662],
				fibonacciEntryPoint: [001177],
				fibonacciFactorial: [003266],
				fibonacciFactorialConstant: [062073],
				fibonacciNumber: [000045 002708],
				fibonacciPolynomial: [049310 162515],
				fibonacciSequence: [000045 001605 002708 005478 007660 082115],
				fibonacciWord: [003849 005614],
				findTransientRepeat: [048997],
				finesSequence: [000957],
				finiteAbelianGroupCount: [000688 060689],
				finiteGroupCount: [000001],
				fixedPoint: [039634],
				floor: [007891 010766 055086 058840],
				foldList: [000124],
				fortunateNumber: [005235 046066],
				freimansConstant: [118472],
				fromContinuedFraction: [039662 071585],
				fromDigits: [007088 019518 030101 123895],
				fussCatalanNumber: [000108 000245 001764 002057 002293 007318],
				gamma: [094640 094641],
				gaussFactorial: [001783 055634],
				gausssConstant: [014549 053002 053003],
				gcd: [003989 008364 020652 020653 051696 147848],
				gelfondsConstant: [018938 039661 060295],
				generalisedCatalanNumber: [004149],
				generalisedPentagonalNumbers: [001318],
				gijswijtsSequence: [090822],
				glaisher: [074962],
				goebelsSequence: [003504 108394],
				goldenRatio: [001622 005206 022342 038150 084531 104457],
				golombsSequence: [001462 001463],
				gompertzConstant: [073003],
				gouldsNumber: [001316],
				gouldsSequence: [000120 001316 006046],
				gradedReflectedColexicographicSort: [036038],
				grahlSequence: [229037 309890],
				graphPlot: [228853],
				grayDecode: [006068 010060 020985],
				grayEncode: [003188 014550 055975 098488 105530 280995],
				greatestPrimeFactor: [005528 006530],
				hadamardMatrix: [240908 240909],
				haltonSequence: [030101 030102],
				hammingWeight: [000120 010060 014311 036555 093659 188064 262881 287639 292849 294648],
				harmonicNumber: [001008 002805],
				harmoniousNumber: [001622 060006 060007 160155 230159 230160],
				heinzNumber: [316413],
				hexagonalNumber: [000384],
				hofstadterQSequence: [005185 086267],
				hookLengthFormula: [060240 117506],
				hookLengths: [263003 263004],
				hypergeometric2F1: [010683],
				integerConcatenation: [007908],
				integerDigits: [000422 005811 007376 007931 007954 010060 014311 029931 030101 033664 033865 033953 036991 046017 048793 052004 059943 062756 063543 066099 101211 117966 160855 167489 191780 227736 265326 322182 364024],
				integerExponent: [000120 001511 005187 007814 025480 027868 037227 055938 110963 116882 116883 122840 279340 295664 336937 366601 371094],
				integerLength: [061384 070939],
				integerPartitions: [027187 027193 036036 036037 080576 080577 193073 334301],
				integerPartitionsDimensions: [003870 060240 117506],
				integerPartitionUnrank: [112798 129594 215366 227739],
				integerReverse: [004086 004170 007500 055483 071786 161594],
				integerSquareRoot: [000196],
				interprime: [024675],
				inventorySequence: [342585],
				involutionNumber: [000085],
				iota: [002260 004736],
				isAbundantNumber: [005101],
				isAlmostPrime: [000040 001358 046308 069272],
				isAmicablePair: [259180],
				isBalancedPrime: [006562],
				isCarmichaelNumber: [002997],
				isChenPrime: [109611],
				isColossallyAbundantNumber: [004490],
				isComposite: [002808 051169],
				isCoprime: [020652 053672],
				isCubeFree: [004709 046099],
				isCubicResidue: [046530],
				isDeficientNumber: [005100],
				isDyckWord: [014486 063171 080116],
				isEven: [005843 030067 059707 104895],
				isFullReptendPrime: [001122 001913],
				isGaussianPrime: [002145],
				isHarmonicDivisorNumber: [001599],
				isHarshadNumber: [005349],
				isHeronian: [046128 046129 046130 046131 055592 055593 055594],
				isHighlyAbundantNumber: [005101],
				isHighlyCompositeNumber: [002182 002183],
				isIntegerSquare: [000290],
				isKaprekarNumber: [006886],
				isLesserCousinPrime: [023200 046132],
				isLesserTwinPrime: [001359 006512 014574],
				isLukasiewiczWord: [071153],
				isNarcissisticNumber: [005188 010344 010346 010348 010350 010353 010354],
				isOdd: [005408 059717 065620],
				isPalindrome: [002113 002385 006072 006995],
				isPerfectNumber: [000396],
				isPerfectPower: [001597 301573],
				isPerfectSquare: [000290],
				isPoliteNumber: [138591],
				isPowerfulNumber: [001694 060355 118896],
				isPracticalNumber: [005153],
				isPrime: [000353 002374 005384 005385 005846 006285 010051 038699 055265 114897 239968],
				isPrimePower: [000015 025473 246547 246655],
				isPrimitiveAbundantNumber: [071395],
				isPronicNumber: [002378],
				isProperPrime: [073761],
				isPseudoperfectNumber: [005835],
				isPythagoreanPrime: [002144],
				isRefactorableNumber: [033950],
				isRegularNumber: [051037],
				isRegularPrime: [000928 007703],
				isRepeatingDecimal: [085837],
				isRoughNumber: [007775 008364 049296],
				isSemiprime: [001358 006881],
				isSinglyEven: [016825],
				isSmoothNumber: [000079 002473 003586 051037 051038 080197 080681 080682 080683],
				isSphenicNumber: [007304 165936],
				isSquare: [000122 000290],
				isSquareFree: [005117 013929],
				isSquareFreeWord: [337005],
				isSternPrime: [042978],
				isStrongPrime: [051634],
				isStrongPseudoprime: [001262 020229 020230 020231 020232 020233 020234 020235],
				isSumOfTwoSquares: [001481],
				isSumProductNumber: [038369],
				isSuperabundantNumber: [004394],
				isSuperiorHighlyCompositeNumber: [002201],
				isSuperpermutation: [332089],
				isUnitFraction: [003592],
				isWeakPrime: [051635],
				isWeirdNumber: [006037],
				iterate: [007001 014707 079559 118006 164349 283681],
				j: [046109],
				jacobiSymbol: [047713 063988],
				jacobsthalNumber: [001045],
				josephusProblem: [006257 032434 054995 321298],
				josephusSequence: [209258],
				jugglerSequence: [007320 094683 094716 389383],
				kaprekarSequence: [099009 099010],
				keplerBouwkampConstant: [085365],
				keplerTree: [020651 294442],
				khinchinsConstant: [002210 002211],
				kolakoskiSequence: [000002],
				kroneckerSymbol: [004016 010815 010816],
				landauConstant: [081760],
				landauRamanujanConstant: [081760],
				lassalleNumber: [180874],
				leastPrimeFactor: [020639],
				leastPrimeFactorList: [020639],
				legendreP: [008316],
				leibnizHarmonicTriangle: [003506],
				lemniscateConstant: [062539],
				levysConstant: [002210 086702 086703],
				lexicographicallyLeastSquareFreeWord: [007814 356677 356678 356679 356680 356681 356682],
				LinearCongruential: [385459],
				linearRecurrence: [000045 000078 000124 000127 000129 000204 000225 000285 000295 000930 000931 000975 001045 001076 001108 001333 001519 001590 001608 001653 001687 001840 002203 002943 003269 003520 005578 006356 008647 008672 008763 017817 017827 039834 051049 051794 052920 056530 065171 079398 084519 103372 103373 131577 134816],
				liouvilleLambda: [007421 008836],
				lobbNumber: [039599],
				log: [130233],
				log2: [049039],
				logarithmicIntegral: [069284 070769],
				lookAndSay: [045918 047842 056815],
				lookAndSaySequence: [005150 005341 045918],
				lowerChristoffelWord: [144595 144596 144608],
				lucasNumber: [000032 000204 000285 001606],
				lucasSequence: [000032 000045 000129 001045 001477 002203 005479 014551],
				luckyNumbers: [000959],
				lyndonWords: [001037],
				madelungConstant: [085469],
				magicSquare: [033812 127907],
				magicSquareSummary: [033812 126649 126650 126651 127907],
				mahonianNumber: [008302],
				majorIndex: [008302],
				mallowsSequence: [005229],
				mangoldtLambda: [014963],
				markovNumberTree: [002559],
				matrixPower: [035506 052534],
				matulaGoebelTree: [109129 358552],
				meisselMertensConstant: [077761],
				memoize: [002083 004001],
				mersenneNumber: [000225],
				mersennePrimeExponent: [000043],
				mertensFunction: [002321],
				metallicMean: [001622 014176 098316 098317 098318],
				minkowskiQuestionMark: [048819],
				mod: [000224 002516 028897 048152 051126 088705 125717 187824],
				moebiusMu: [002321 006575 007427 008683 037227 046692 318583],
				moserDeBruijnSequence: [000695],
				motzkinNumber: [001006],
				motzkinSequence: [001006],
				multiplicativeDigitalRoot: [031347],
				multiplicativeOrder: [001122 001913 002139 006556 006559 006694 007732 019334 019335 019336 019337 019338 019339 084680],
				namedConstant: [002162 016730],
				narayanaNumber: [001263],
				narayanaSequence: [000930],
				nearestPrime: [051697],
				necklaceCount: [000031 054631 087854],
				nestList: [012257 385459],
				nestWhile: [003602],
				nestWhileList: [063574],
				nextPrime: [007491 053000 062251 151800],
				noergaardInfinityNumber: [004718],
				noergaardInfinitySequence: [004718 083866 256184 256185],
				noergaardRhythmicInfinitySystem: [073334],
				nonPrime: [018252],
				numberOfCompositions: [007318],
				numberOfCompositionsWeak: [178300],
				occurrencesOf: [333867 342585],
				oddPart: [000265],
				OeisEntry: [000001 059471 254410 380317],
				oloid: [215447],
				omegaConstant: [030178 030797],
				optimalGolombRulers: [003022],
				orderedBellNumber: [000670],
				padLeft: [051340 132440],
				padovanSequence: [000931 001608 182097],
				padRight: [000007 144112],
				paleyGraph: [085759],
				paperFoldingConstant: [143347],
				partition: [135472],
				partitionFunctionP: [000041 008284 026820],
				partitionFunctionQ: [000009 008289 030699],
				partitionsP: [000041],
				partitionsQ: [000009 095941],
				pascalTriangle: [001316 006046 007318 047999],
				pellLucasSequence: [002203],
				pellSequence: [000129 086383 096650],
				pentagonalNumber: [000326],
				perfectDigitalInvariantSequence: [046197 193995],
				perfectNumber: [000396],
				periodDoublingSequence: [096268],
				permutationOrder: [066646],
				perrinFunction: [001608 112881],
				perrinSequence: [001608],
				pi: [000796 001203 002485 002486 100044],
				pisanoPeriod: [001175 066853],
				plasticRatio: [060006],
				pochhammer: [008279],
				politeness: [069283],
				polygonalNumber: [000027 000124 000217 000290 000326 000384 000566 000567 001106 001107 051682 051864 051865 051866 051867 051868 051869 051870 051871 051872 051873 051874 051875 051876 139610],
				Polynomial: [003263],
				power: [000051 000215 000272 000312 002416 002488 002489 006002 058481 074704],
				powerMod: [001567 002371 007535 029898 039951 096008 153130 195637],
				previousPrime: [007917 064924],
				prime: [000040 001348 006094 006450 006509 007504 008347 036467 038698 045985 046929 046930 060038 065305 065306 112632 243353],
				primeDistance: [051699],
				primeDivisors: [003592],
				primeExponents: [025487 124832],
				primeFactors: [001414 002586 020639 027746 083025 238689 268868],
				primeGap: [001223 053695 082885],
				primeNu: [001221 005236 034444 049073 089266],
				primeOmega: [001222 014612 028260 058933],
				primePi: [000720 002815 003963 014085 049084 056239 062537 064489 112798 121053 135141 156552 212210 214567 219055],
				primeSignature: [025487 036035 046523 064839 101296 118914 181819],
				primesList: [000040],
				primitiveRootList: [001122 001913 033948 046144 046147],
				primorial: [002110 278159],
				pyramidalNumber: [000292 000330 002411 002412 002413],
				pythagorasConstant: [002193],
				qBinomial: [034851],
				quadraticNonresidues: [028736 028786 053760],
				quadraticResidues: [010385 010434 046071 047210 048152 096008 096103 105612],
				quotient: [000601 003988 059095],
				quotientRemainder: [118006],
				rabbitConstant: [014565],
				radical: [007947],
				ramanujanTau: [000594],
				Range: [115020],
				recamanSequence: [005132 064289 064389 160357],
				reciprocalFibonacciConstant: [079586],
				regularPaperfoldingSequence: [014577 034947 343173],
				repeat: [000012 000035 003056],
				replicate: [002024],
				repunit: [000225 002275 002450 002452 003462 003463 003464 016123 016125 023000 023001],
				reversalPermutation: [049773],
				riffle: [001057 142150],
				rotateLeft: [038556],
				rudinShapiro: [020985],
				rulerFunction: [001511],
				runLengthsOf: [245562],
				runLengthTransform: [246028 278159],
				scatterPlot: [086088],
				schroderNumber: [006318 033877],
				schroderSequence: [006318],
				secondFeigenbaumConstant: [006891],
				secondOrderEulerianTriangle: [008517],
				seidelTriangle: [008280],
				selfCountingNumber: [002024],
				selfCountingSequence: [002024],
				sequenceCount: [003714 003754 104326],
				sierpinskiConstant: [062089 241017],
				sieveOfAtkin: [000040],
				sieveOfEratosthenes: [000040],
				sieveOfPritchard: [000040],
				sieveOfSundaram: [000040],
				signatureSequence: [007337 084531 084532 118276],
				silverConstant: [116425],
				silverRatio: [014176],
				sin: [000494 174344],
				sobolSequence: [062383 280995],
				soldnersConstant: [070769 091723],
				solidus: [061037],
				somosSequence: [006720 006721 006722 006723],
				sortingNumber: [001855],
				split: [005150 037014 306211 306215],
				sqrt: [000037 007336],
				square: [000290],
				squarePyramidalNumber: [000330],
				squareSpiral: [174344 268038],
				squaresR: [000118 001481 004018 010054],
				stanleySequence: [005487 005836 185256 187843 188052 188053 188054 188055 188056 188057],
				sternBrocotNumber: [002487],
				sternBrocotSequence: [002487],
				stirlingS1: [008275 008276 008309],
				stirlingS2: [000392 000453 001296 008277 064856],
				stolarskyArray: [035506],
				stolarskyHarborthConstant: [006046 077464],
				stolarskyIndex: [098861 098862],
				subfactorial: [000166],
				subsets: [008967],
				substitutionSystem: [003849 010060 014577 020985 035263 079559 096268],
				sum: [281488],
				superCatalanNumber: [001003 006318 144944],
				supergoldenRatio: [092526 369346 381124 381125],
				supersilverRatio: [008998 332647 356035],
				sylvesterExpansion: [050205],
				sylvestersSequence: [000058],
				szekeresSequence: [003278],
				tetrahedralNumber: [000292],
				tetranacciConstant: [058265 086088],
				thueMorse: [104894],
				thueMorseSequence: [010060 029883],
				toothpickSequence: [139250],
				totientSummatoryFunction: [002088],
				triangularArray: [002260 002262 003989 003991 004736 007318 025581 046902 048601 051678 060016 065602 075363 075364 077028 090850 094587 096470 141419 166556 213568],
				triangularNumber: [000217 008302 104382],
				tribonacciConstant: [058265],
				tribonacciNumber: [000073 000213 001590 001644 100683],
				tribonacciWord: [092782],
				unitaryDivisors: [063937 077610],
				unitaryDivisorSigma: [034444 034676 068068],
				unitaryPhi: [047994],
				vanDerCorputNumber: [030101 030102 030109 062383],
				vanDerCorputsConstant: [143305],
				vanDerLaanSequence: [182097],
				vanEckSequence: [181391],
				vedicSquare: [125959 180592 180593 180594],
				wedderburnEtheringtonNumbers: [001190],
				wheelSieve: [000040],
				whileTrue: [322522],
				wythoffArray: [003622 035513],
				wythoffIndex: [019586 035612 035614],
				wythoffLower: [000201],
				wythoffPair: [000201 001950],
				wythoffUpper: [001950],
				xorTriangle: [334556 334769],
				yellowstonePermutation: [098550],
				zeckendorfRepresentation: [003714 007895 014417 035517 035614 087172 094202 102364 104324 328208],
				zero: [000004],
				zeta: [013631]
			)
		}
	}

	oeisSplFunctionListing { :self |
		self
		.oeisSplFunctionReferenceTable
		.keysAndValuesDo { :k :v |
			'- `%`: %'.format(
				[
					k,
					v.isEmpty.if {
						'...'
					} {
						v.sort.collect(
							oeisIdentifier:/1
						).unwords
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
