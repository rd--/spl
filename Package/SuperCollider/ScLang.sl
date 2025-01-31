+@Collection {

	AmpDb { :self |
		self.collect(AmpDb:/1)
	}

	atExtending { :self :index |
		self.error('atExtending: not a sequence')
	}

	DbAmp { :self |
		self.collect(DbAmp:/1)
	}

	extendTo { :self :size |
		self.error('extendTo: not a sequence')
	}

	linLin { :self :inMin :inMax :outMin :outMax |
		self.collect { :each |
			each.linLin(inMin, inMax, outMin, outMax)
		}
	}

	MidiCps { :self |
		self.collect(MidiCps:/1)
	}

	powersetBitwise { :self |
		let k = 1.bitShift(self.size) - 1;
		0:k.collect { :each |
			let index = 0;
			self.select { :elem |
				index := index + 1;
				each.bitAt(index) = 1
			}
		}
	}

	sizeForExtending { :self |
		self.error('sizeForExtending: not a sequence')
	}

}

+@Magnitude {

	exclusivelyBetweenAnd { :self :lo :hi |
		lo < self & {
			self < hi
		}
	}

	inclusivelyBetweenAnd { :self :lo :hi |
		lo <= self & {
			self <= hi
		}
	}

}

+@Number {

	ampComp { :freq :root :exp |
		(root / freq) ^ exp
	}

	AmpDb { :self |
		self.log10 * 20
	}

	coin { :self |
		system.nextRandomFloat < self
	}

	CentsRatio { :self |
		(self / 100).MidiRatio
	}

	CpsMidi { :self |
		(self * (1 / 440)).log2 * 12 + 69
	}

	CpsOct { :self |
		(self * (1 / 440)).log2 + 4.75
	}

	Cubed { :self |
		self * self * self
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

	DbAmp { :self |
		10 ^ (self * 0.05)
	}

	DifSqr { :self :aNumber |
		(self * self) - (aNumber * aNumber)
	}

	Distort { :self |
		self / (1 + self.abs)
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

	expRand { :self :upperBound |
		system.randomReal(1, self.linExpFromTo(upperBound), [])
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

	Hypotenuse { :self :aNumber |
		((self * self) + (aNumber * aNumber)).sqrt
	}

	HypotenuseApproximate { :self :aNumber |
		self.abs + aNumber.abs - ((2.sqrt - 1) * self.abs.min(aNumber.abs))
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

	MidiCps { :self |
		440 * (2 ^ ((self - 69) * (1 / 12)))
	}

	MidiRatio { :self |
		2.0 ^ (self * (1 / 12))
	}

	Minus { :self |
		0 - self
	}

	MulAdd { :self :mul :add |
		self * mul + add
	}

	nextPowerOfTwo { :self |
		self.nextPowerOf(2)
	}

	nextPowerOf { :self :base |
		let exponent = self.log(base).ceiling;
		base ^ exponent
	}

	OctCps { :self |
		440 * (2 ^ (self - 4.75))
	}

	previousPowerOf { :self :base |
		base ^ (self.log(base).ceiling - 1)
	}

	RatioCents { :self |
		self.RatioMidi * 100
	}

	RatioMidi { :self |
		12 * self.log2
	}

	Reciprocal { :self |
		1 / self
	}

	Squared { :self |
		self * self
	}

}

+@Integer {

	asBinaryDigits { :self :numDigits |
		let answer = [];
		0.toDo(numDigits - 1) { :i |
			answer.addFirst(self.bitShiftRight(i).bitAnd(1))
		};
		answer
	}

}

+Block {

	!+ { :self :anInteger |
		(self ! anInteger).Sum
	}

	!* { :self :anInteger |
		(self ! anInteger).product
	}

}

+@Object {

	atExtending { :self :index |
		self
	}

	extendTo { :self :size |
		List(size, self)
	}

	instill { :self :index :item :default |
		(index = 1).if {
			item
		} {
			self.asCollection.instill(index, item, default)
		}
	}

	obtain { :self :index :default |
		(index = 1).if {
			self
		} {
			default
		}
	}

	sizeForExtending { :self |
		1
	}

}

+@Sequence {

	asRandomTable { :self :size |
		let a = (size = self.size).if {
			self
		} {
			self.resample(size)
		};
		a := a.integrate.normalizeRange(1, size);
		1:size.collect { :index |
			a.indexOfInBetween(index) - 1 / size
		}
	}

	asRandomTable { :self |
		self.asRandomTable(self.size)
	}

	asWavetable { :self |
		let size = self.size * 2;
		let answer = self.species.ofSize(size);
		let index = 1;
		(1 .. self.size).do { :each |
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

	atExtending { :self :index |
		self.atWrap(index)
	}

	atBlend { :self :index |
		let indexMin = index.roundUpTo(1) - 1;
		self.atPin(indexMin).blend(
			self.atPin(indexMin + 1),
			(index - indexMin).abs
		)
	}

	atAllBlend { :self :indices |
		indices.collect { :each |
			self.atBlend(each)
		}
	}

	clump { :self :groupSize |
		let answer = [];
		let segment = [];
		self.do { :each |
			segment.add(each);
			(segment.size >= groupSize).ifTrue {
				answer.add(segment);
				segment := []
			}
		};
		(segment.size > 0).ifTrue {
			answer.add(segment)
		};
		answer
	}

	degreeToKey { :self :scale :stepsPerOctave |
		self.collect { :scaleDegree |
			scaleDegree.degreeToKey(scale, stepsPerOctave)
		}
	}

	differentiate { :self |
		let prev = 0;
		let index = 1;
		let answer = self.species.new(self.size);
		self.do { :each |
			answer[index] := each - prev;
			prev := each;
			index := index + 1
		};
		answer
	}

	extendTo { :self :size |
		1.toAsCollect(size, self.species) { :index |
			self.atWrap(index)
		}
	}

	extendToBeOfEqualSize { :self |
		let size = self.collect(sizeForExtending:/1).max;
		self.collect { :each |
			each.extendTo(size)
		}
	}

	flop { :self |
		self.multiChannelExpand
	}

	indexOfGreaterThan { :self :aMagnitude |
		self.detectIndex { :each |
			each > aMagnitude
		}
	}

	indexOfInBetween { :self :aNumber |
		self.isEmpty.if {
			nil
		} {
			let i = self.indexOfGreaterThan(aNumber);
			i.ifNil {
				self.size
			} {
				(i = 1).if {
					i
				} {
					let a = self[i - 1];
					let b = self[i];
					let div = b - a;
					(div = 0).if {
						i
					} {
						((aNumber - a) / div) + i - 1
					}
				}
			}
		}
	}

	instill { :self :index :item :default |
		let answer = self.copy;
		(index - self.size).timesRepeat {
			answer.add(default)
		};
		answer[index] := item;
		answer
	}

	integrate { :self |
		let answer = [];
		let sum = 0;
		self.do { :each |
			sum := sum + each;
			answer.add(sum)
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

	multiChannelExpand { :self |
		let k = self.collect(sizeForExtending:/1).max;
		1:k.collect { :index |
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
		(patternType = 1).ifTrue {
			1.toDo(lastIndex) { :i |
				answer.addAll(self.copyFromTo(1, i))
			}
		};
		(patternType = 2).ifTrue {
			lastIndex.downToDo(1) { :i |
				answer.addAll(self.copyFromTo(i, lastIndex))
			}
		};
		(patternType = 3).ifTrue {
			lastIndex.downToDo(1) { :i |
				answer.addAll(self.copyFromTo(1, i))
			}
		};
		(patternType = 4).ifTrue {
			1.toDo(lastIndex) { :i |
				answer.addAll(self.copyFromTo(i, lastIndex))
			}
		};
		(patternType = 5).ifTrue {
			1.toDo(lastIndex) { :i |
				answer.addAll(self.copyFromTo(1, i))
			};
			(lastIndex - 1).toByDo(1, -1) { :i |
				answer.addAll(self.copyFromTo(1, i))
			}
		};
		(patternType = 6).ifTrue {
			lastIndex.toByDo(1, -1) { :i |
				answer.addAll(self.copyFromTo(i, lastIndex))
			};
			2.toDo(lastIndex) { :i |
				answer.addAll(self.copyFromTo(i, lastIndex))
			}
		};
		(patternType = 7).ifTrue {
			lastIndex.toByDo(1, -1) { :i |
				answer.addAll(self.copyFromTo(1, i))
			};
			2.toDo(lastIndex) { :i |
				answer.addAll(self.copyFromTo(1, i))
			}
		};
		self.species.newFrom(answer)
	}

	scramble { :self |
		self.shuffled
	}

	separate { :self :aBlock:/2 |
		let answer = [];
		let segment = [];
		self.adjacentPairsDo { :a :b |
			segment.add(a);
			aBlock(a, b).ifTrue {
				answer.add(segment);
				segment := []
			}
		};
		self.notEmpty.ifTrue {
			segment.add(self.last)
		};
		answer.add(segment);
		answer
	}

	shift { :self :count :item |
		let fill = List(count.abs, item);
		let remain = self.drop(count.negated);
		count.isNegative.if {
			remain ++ fill
		} {
			fill ++ remain
		}
	}

	similarity { :self :other |
		self.similarity(other, =)
	}

	similarity { :self :other :equalityBlock:/2 |
		let maxDistance = self.size.max(other.size);
		(maxDistance > 0).if {
			1 - (self.levenshteinDistance(other, equalityBlock:/2) / maxDistance)
		} {
			1
		}
	}

	sizeForExtending { :self |
		self.size
	}

	slide { :self :windowSize :stepSize |
		self.partition(windowSize, stepSize).concatenation
	}

	stutter { :self :repeatCount |
		self.duplicateEach(repeatCount)
	}

	tableRand { :self |
		self.atBlend(system.randomReal(1, self.size, []))
	}

	waveFill { :self :aBlock:/3 :start :end |
		(self.size > 0).ifTrue {
			let index = 1;
			let next = start;
			let size = self.size;
			let step = (end - start) / size;
			{
				i <= size
			}.whileTrue {
				self[index] := aBlock(next, self[index], index);
				next := next + step;
				index := index + 1
			}
		}
	}

	wrapExtend { :self :size |
		let answer = [];
		1.toDo(size) { :index |
			answer.add(self.atWrap(index))
		};
		answer
	}

}

+@Dictionary {

	kr { :self |
		self.collect(kr:/1)
	}

	multiChannelExpand { :self |
		let keys = self.keys;
		let values = self.values;
		let size = values.collect(sizeForExtending:/1).max;
		let places = values.multiChannelExpand.collect { :each |
			each.withIndexCollect { :item :index |
				keys[index] -> item
			}
		};
		places.collect(asRecord:/1)
	}

}

+List {

	clump { :self :groupSize |
		<primitive: return sc.clump(_self, _groupSize);>
	}

}

+Range {

	MulAdd { :self :mul :add |
		self * mul + add
	}

}

+SmallFloat {

	degreeToKey { :self :scale :stepsPerOctave |
		let scaleDegree = self.rounded;
		let accidental = (self - scaleDegree) * 10;
		let baseKey = (stepsPerOctave * (scaleDegree.quotientBy(scale.size, floor:/1))) + scale.atWrap(scaleDegree + 1);
		(accidental = 0).if {
			baseKey
		} {
			baseKey + (accidental * (stepsPerOctave / 12.0))
		}
	}

	geom { :self :start :grow |
		self.geometricSeries(start, grow)
	}

	SoftClip { :self |
		(self.abs <= 0.5).if {
			self
		} {
			(self.abs - 0.25) / self
		}
	}

}

+Block {

	<> { :self:/1 :aBlock:/1 |
		{ :x |
			self(aBlock(x))
		}
	}

	block { :self:/1 |
		valueWithReturn { :return:/1 |
			self(return:/1)
		}
	}

}

+String {

	++? { :self :anObject |
		anObject.ifNil {
			self
		} {
			self ++ anObject.value
		}
	}

	+/+ { :self :aString |
		self ++ '/' ++ aString
	}

	ascii { :self |
		self.asciiByteArray.asList
	}

}
