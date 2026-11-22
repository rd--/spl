+@Collection {

	ampDb { :self |
		self.collect(ampDb/1)
	}

	cpsMidi { :self |
		self.collect(cpsMidi/1)
	}

	dbAmp { :self |
		self.collect(dbAmp/1)
	}

	linLin { :self :inMin :inMax :outMin :outMax |
		self.collect { :each |
			each.linLin(inMin, inMax, outMin, outMax)
		}
	}

	midiCps { :self |
		self.collect(midiCps/1)
	}

}

+@Collection {

	atExtending { :self :index |
		self.error('atExtending: not a sequence')
	}

	extendTo { :self :size |
		self.error('extendTo: not a sequence')
	}

	powersetBitwise { :self |
		let k = 1L.bitShift(self.size) - 1L;
		0L.toCollect(k) { :each |
			let index = 0L;
			self.select { :elem |
				index := index + 1L;
				each.bitAt(index) = 1L
			}
		}
	}

	sizeForExtending { :self |
		self.error('sizeForExtending: not a sequence')
	}

}

+@Number {

	ampComp { :freq :root :exp |
		(root / freq) ^ exp
	}

	ampDb { :self |
		self.log10 * 20.0
	}

	[centsRatio, CentsRatio] { :self |
		(self / 100.0).midiRatio
	}

	cpsMidi { :self |
		(self / 440.0).log2 * 12.0 + 69.0
	}

	[cpsOct, CpsOct] { :self |
		(self / 440.0).log2 + 4.75
	}

	curveLin { :self :inMin :inMax :outMin :outMax :curve |
		(self <= inMin).if {
			outMin
		} {
			(self >= inMax).if {
				outMax
			} {
				(curve.abs < 0.001).if {
					(self - inMin) / (inMax - inMin) * (outMax - outMin) + outMin
				} {
					let grow = curve.exp;
					let a = inMax - inMin / (1.0 - grow);
					let b = inMin + a;
					((b - self) / a).log * (outMax - outMin) / curve + outMin
				}
			}
		}
	}

	dbAmp { :self |
		10.0 ^ (self * 0.05)
	}

	difSqr { :self :aNumber |
		(self * self) - (aNumber * aNumber)
	}

	distort { :self |
		self / (1.0 + self.abs)
	}

	expExp { :self :inMin :inMax :outMin :outMax |
		(self <= inMin).if {
			outMin
		} {
			(self >= inMax).if {
				outMax
			} {
				(outMax / outMin) ^ ((self / inMin).log / (inMax / inMin).log) * outMin
			}
		}
	}

	expLin { :self :inMin :inMax :outMin :outMax |
		(self <= inMin).if {
			outMin
		} {
			(self >= inMax).if {
				outMax
			} {
				(self / inMin).log / (inMax / inMin).log * (outMax - outMin) + outMin
			}
		}
	}

	fold { :self :lo :hi |
		(self >= lo & {
			self < hi
		}).if {
			self
		} {
			let x = self - lo;
			let range = hi - lo;
			let twiceRange = range + range;
			let c = x - (twiceRange * (x / twiceRange).floor);
			(c >= range).ifTrue {
				c := twiceRange - c
			};
			c + lo
		}
	}

	foldOnce { :self :lo :hi |
		(self >= hi).if {
			hi + hi - self
		} {
			(self < lo).if {
				lo + lo - self
			} {
				(self = hi).if {
					lo
				} {
					self
				}
			}
		}
	}

	hypotenuseApproximate { :self :aNumber |
		self.abs + aNumber.abs - ((2.0.sqrt - 1.0) * self.abs.min(aNumber.abs))
	}

	isExclusivelyBetween { :self :lo :hi |
		lo < self & {
			self < hi
		}
	}

	isInclusivelyBetween { :self :lo :hi |
		lo <= self & {
			self <= hi
		}
	}

	linCurve { :self :inMin :inMax :outMin :outMax :curve |
		(self <= inMin).if {
			outMin
		} {
			(self >= inMax).if {
				outMax
			} {
				(curve.abs < 0.001).if {
					(self - inMin) / (inMax - inMin) * (outMax - outMin) + outMin
				} {
					let grow = curve.exp;
					let a = outMax - outMin / (1.0 - grow);
					let b = outMin + a;
					let scaled = (self - inMin) / (inMax - inMin);
					b - (a * (grow ^ scaled))
				}
			}
		}
	}

	linExp { :self :inMin :inMax :outMin :outMax |
		(self <= inMin).if {
			outMin
		} {
			(self >= inMax).if {
				outMax
			} {
				(outMax / outMin) ^ ((self - inMin) / (inMax - inMin)) * outMin
			}
		}
	}

	linExpFromTo { :self :lo :hi |
		lo * ((hi / lo).log * self).exp
	}

	linLin { :self :inMin :inMax :outMin :outMax |
		(self <= inMin).if {
			outMin
		} {
			(self >= inMax).if {
				outMax
			} {
				(self - inMin) / (inMax - inMin) * (outMax - outMin) + outMin
			}
		}
	}

	midiCps { :self |
		440.0 * (2.0 ^ ((self - 69.0) / 12.0))
	}

	midiRatio { :self |
		2.0 ^ (self / 12.0)
	}

	nextPowerOf { :self :base |
		let exponent = self.log(base).ceiling;
		base ^ exponent
	}

	octCps { :self |
		440.0 * (2.0 ^ (self - 4.75))
	}

	previousPowerOf { :self :base |
		base ^ (self.log(base).ceiling - 1.0)
	}

	[ratioCents, RatioCents] { :self |
		self.ratioMidi * 100.0
	}

	ratioMidi { :self |
		12.0 * self.log2
	}

}

+[Integer, @SmallInteger] {

	binaryDigits { :self :numDigits |
		let answer = [];
		0L.toDo(numDigits - 1L) { :i |
			answer.addFirst!(self.bitShiftRight(i).bitAnd(1L))
		};
		answer
	}

}

+Function {

	!* { :self :anInteger |
		(self ! anInteger).product
	}

	!+ { :self :anInteger |
		(self ! anInteger).optimisedSum
	}

}

+@Object {

	atExtending { :self :index |
		self
	}

	extendTo { :self :size |
		List(size, self)
	}

	obtain { :self :index :default |
		(index = 1L).if {
			self
		} {
			default
		}
	}

	sizeForExtending { :self |
		1L
	}

}

+List {

	atAllBlend { :self :indices |
		indices.collect { :each |
			self.atBlend(each)
		}
	}

	atBlend { :self :index |
		let indexMin = index.roundUp - 1L;
		self.atPin(indexMin).blend(
			self.atPin(indexMin + 1L),
			(index - indexMin).abs
		)
	}

	atExtending { :self :index |
		self.atWrap(index)
	}

	clump { :self :groupSize |
		let answer = [];
		let segment = [];
		self.do { :each |
			segment.add!(each);
			(segment.size >= groupSize).ifTrue {
				answer.add!(segment);
				segment := []
			}
		};
		(segment.size > 0L).ifTrue {
			answer.add!(segment)
		};
		answer
	}

	difSqr { :self :aNumber |
		aNumber.adaptToCollectionAndApply(self, difSqr/2)
	}

	differentiate { :self |
		([0L] ++ self).differences
	}

	extendTo { :self :size |
		1L.toAsCollect(size, self) { :index |
			self.atWrap(index)
		}
	}

	extendToBeOfEqualSize { :self |
		let size = self.collect(sizeForExtending/1).max;
		self.collect { :each |
			each.extendTo(size)
		}
	}

	flop { :self |
		self.multiChannelExpand
	}

	indexOfInBetween { :self :aNumber |
		self.isEmpty.if {
			nil
		} {
			let i = self.binaryDetectIndex { :each |
				each > aNumber
			};
			(i > self.size).if {
				self.size
			} {
				(i = 1L).if {
					i
				} {
					let a = self[i - 1L];
					let b = self[i];
					let c = b - a;
					(c = 0L).if {
						i
					} {
						((aNumber - a) / c) + i - 1L
					}
				}
			}
		}
	}

	instill { :self :index :item :default |
		self.copy.instill!(index, item, default)
	}

	instill! { :self :index :item :default |
		(index - self.size).timesRepeat {
			self.add!(default)
		};
		self[index] := item;
		self
	}

	integrate { :self |
		let answer = [];
		let sum = 0L;
		self.do { :each |
			sum := sum + each;
			answer.add!(sum)
		};
		answer
	}

	keep { :self :n |
		self.first(n)
	}

	keepAtMost { :self :n |
		(n > self.size).if {
			self
		} {
			self.keep(n)
		}
	}

	keepLast { :self :n |
		let size = self.size;
		self.copyFromTo(size - n, size)
	}

	linExp { :self :inMin :inMax :outMin :outMax |
		self.withWithWithWithCollect(
			inMin.nest, inMax.nest, outMin.nest, outMax.nest, linExp/5
		)
	}

	linLin { :self :inMin :inMax :outMin :outMax |
		self.withWithWithWithCollect(
			inMin.nest, inMax.nest, outMin.nest, outMax.nest, linLin/5
		)
	}

	midiCps { :self |
		self.collect(midiCps/1)
	}

	midiRatio { :self |
		self.collect(midiRatio/1)
	}

	multiChannelExpand { :self |
		let k = self.collect(sizeForExtending/1).max;
		1L.toCollect(k) { :index |
			self.collect { :each |
				each.atExtending(index)
			}
		}
	}

	obtain { :self :index :default |
		(index > self.size).if {
			default
		} {
			self[index]
		}
	}

	pyramid { :self :patternType |
		let answer = [];
		let lastIndex = self.size;
		patternType.caseOf(
			[
				1L -> {
					1L.toDo(lastIndex) { :i |
						answer.addAll!(self.copyFromTo(1L, i))
					}
				},
				2L -> {
					lastIndex.downToDo(1L) { :i |
						answer.addAll!(self.copyFromTo(i, lastIndex))
					}
				},
				3L -> {
					lastIndex.downToDo(1L) { :i |
						answer.addAll!(self.copyFromTo(1L, i))
					}
				},
				4L -> {
					1L.toDo(lastIndex) { :i |
						answer.addAll!(self.copyFromTo(i, lastIndex))
					}
				},
				5L -> {
					1L.toDo(lastIndex) { :i |
						answer.addAll!(self.copyFromTo(1L, i))
					};
					(lastIndex - 1L).toByDo(1L, -1L) { :i |
						answer.addAll!(self.copyFromTo(1L, i))
					}
				},
				6L -> {
					lastIndex.toByDo(1L, -1L) { :i |
						answer.addAll!(self.copyFromTo(i, lastIndex))
					};
					2L.toDo(lastIndex) { :i |
						answer.addAll!(self.copyFromTo(i, lastIndex))
					}
				},
				7L -> {
					lastIndex.toByDo(1L, -1L) { :i |
						answer.addAll!(self.copyFromTo(1L, i))
					};
					2L.toDo(lastIndex) { :i |
						answer.addAll!(self.copyFromTo(1L, i))
					}
				}
			]
		);
		answer
	}

	randomTable { :self :size |
		let a = (size = self.size).if {
			self
		} {
			self.resample(size)
		};
		let b = a.integrate.normalizeRange([1L, size]);
		1L.toCollect(size) { :index |
			b.indexOfInBetween(index) - 1L / size
		}
	}

	randomTable { :self |
		self.randomTable(self.size)
	}

	scramble { :self |
		self.shuffle
	}

	separate { :self :aFunction/2 |
		let answer = [];
		let segment = [];
		self.adjacentPairsDo { :a :b |
			segment.add!(a);
			aFunction(a, b).ifTrue {
				answer.add!(segment);
				segment := []
			}
		};
		self.isNotEmpty.ifTrue {
			segment.add!(self.last)
		};
		answer.add!(segment);
		answer
	}

	shift { :self :count :item |
		let fill = List(count.abs, item);
		let remain = self.drop(count.negate);
		count.isNegative.if {
			remain ++ fill
		} {
			fill ++ remain
		}
	}

	similarity { :self :other |
		self.similarity(other, isEqual/2)
	}

	similarity { :self :other :equalityFunction/2 |
		let maxDistance = self.size.max(other.size);
		(maxDistance > 0).if {
			1 - (self.levenshteinDistance(other, equalityFunction/2) / maxDistance)
		} {
			1
		}
	}

	sizeForExtending { :self |
		self.size
	}

	slide { :self :windowSize :stepSize |
		self.partition(windowSize, stepSize).catenate
	}

	stutter { :self :repeatCount |
		self.replicate(repeatCount)
	}

	tableRand { :self :r |
		self.atBlend(
			r.randomReal(
				[1, self.size],
				[]
			)
		)
	}

	waveFill { :self :aFunction/3 :start :end |
		(self.size > 0).ifTrue {
			let index = 1;
			let parameter = start;
			let size = self.size;
			let step = (end - start) / size;
			{
				i <= size
			}.whileTrue {
				self[index] := aFunction(parameter, self[index], index);
				parameter := parameter + step;
				index := index + 1
			}
		}
	}

	wavetableFormat { :self |
		let size = self.size * 2;
		let answer = self.newOfSize(size);
		let index = 1;
		1.toDo(self.size) { :each |
			let e1 = self[each];
			let e2 = (each = self.size).if {
				0
			} {
				self[each + 1]
			};
			answer[index] := 2 * e1 - e2;
			answer[index + 1] := e2 - e1;
			index := index + 2
		};
		answer
	}

	wrapExtend { :self :size |
		let answer = [];
		1.toDo(size) { :index |
			answer.add!(self.atWrap(index))
		};
		answer
	}

}

+Record {

	kr { :self |
		self.collect(kr/1)
	}

	multiChannelExpand { :self |
		let keys = self.keys;
		let values = self.values;
		let size = values.collect(sizeForExtending/1).max;
		let places = values.multiChannelExpand.collect { :each |
			each.withIndexCollect { :item :index |
				keys[index] -> item
			}
		};
		places.collect(Record/1)
	}

}

+List {

	clump { :self :groupSize |
		<primitive:
		return sc.clump(_self, sl.toFloat(_groupSize));
		>
	}

}

+Function {

	<> { :self/1 :aFunction/1 |
		{ :x |
			self(aFunction(x))
		}
	}

}

+String {

	++? { :self :anObject |
		anObject.ifNil {
			self
		} {
			self ++ anObject
		}
	}

	+/+ { :self :aString |
		self ++ '/' ++ aString
	}

	ascii { :self |
		self.asciiByteArray.List
	}

}

+@RandomNumberGenerator {

	coin { :self :p |
		self.nextRandomFloat < p
	}

	expRand { :self :a :b |
		let u = self.nextRandomFloat;
		a * ((b / a).log * u).exp
	}

}
