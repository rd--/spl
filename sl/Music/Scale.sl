Scale : [Object] { | startIndex intervals description |

	degreeToKey { :self :degree |
		degree.isCollection.if {
			degree.collect { :each |
				self.fractionalDegreeToKey(each)
			}
		} {
			self.fractionalDegreeToKey(degree)
		}
	}

	fractionalDegreeToKey { :self :scaleDegree |
		let accidental = (scaleDegree.fractionPart * 10).rounded;
		(accidental > 5).ifTrue {
			accidental := (10 - accidental).negated
		};
		self.integerDegreeToKey(scaleDegree.rounded, accidental)
	}

	integerDegreeToKey { :self :scaleDegree :accidental |
		let stepsPerOctave = self.tuningSize;
		let tuningIndices = self.tuningIndices;
		let baseKey = (stepsPerOctave * (scaleDegree // (self.size + 1))) + tuningIndices.atWrap(scaleDegree);
		(accidental = 0).if {
			baseKey
		} {
			baseKey + (accidental * (12 / stepsPerOctave))
		}
	}

	intervalsBy { :self :anInteger |
		anInteger.betweenAnd(1, self.size).if {
			let intervals = self.intervals;
			let k = anInteger - 1;
			(1 .. self.size).collect { :i |
				(i .. i + k).collect { :j |
					intervals.atWrap(j)
				}.sum
			}
		} {
			self.error('intervalsBy: invalid step size')
		}
	}

	intervalClass { :self :anInteger |
		self.intervalsBy(anInteger).nub.sort
	}

	intervalClasses { :self |
		1.to(self.size).collect { :each |
			self.intervalClass(each)
		}
	}

	isBinary { :self |
		self.stepArity = 2
	}

	isImproper { :self |
		self.isProper.not
	}

	isMomentOfSymmetry { :self |
		1.to(self.size - 1).collect { :each |
			self.intervalClass(each)
		}.allSatisfy { :each |
			each.size = 2
		}
	}

	isProper { :self |
		self.intervalClasses.isSortedBy { :p :q |
			p.allSatisfy { :i |
				q.allSatisfy { :j |
					i <= j
				}
			}
		}
	}

	isStrictlyProper { :self |
		self.intervalClasses.isSortedBy { :p :q |
			p.allSatisfy { :i |
				q.allSatisfy { :j |
					i < j
				}
			}
		}
	}

	isTernary { :self |
		self.stepArity = 3
	}

	lineDrawing { :self |
		let i = [0] ++ self.intervals.prefixSum * 3;
		[
			i.collect { :x |
				Line([x -1; x 1])
			},
			Line([[i.min, 0], [i.max, 0]])
		].LineDrawing(
			height: 50
		)
	}

	nameList { :self |
		self.description.splitBy(', ')
	}

	size { :self |
		self.intervals.size
	}

	stepArity { :self |
		self.intervals.nub.size
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	textDrawing { :self |
		let opening = '├';
		let separator = '┼';
		let closing = '┤';
		let dash = '─';
		[
			opening,
			self.intervals.collect { :each |
				dash # (each - 1)
			}.intersperse(separator),
			closing
		].stringJoin
	}

	tuningIndices { :self |
		let sum = self.startIndex;
		let answer = [sum];
		let tuningSize = self.tuningSize;
		self.intervals.allButLastDo { :each |
			sum := ((sum - 1 + each) % tuningSize) + 1; /* one-indexed modulo */
			answer.add(sum)
		};
		answer
	}

	tuningSize { :self |
		self.intervals.sum
	}

}

+@Integer {

	Scale { :startIndex :intervals :description |
		newScale().initializeSlots(startIndex, intervals, description)
	}

}

+List {

	asScale { :self |
		Scale(1, self, '*undescribed scale*')
	}

}

+String {

	namedScale { :self |
		let answers = self.namedScales;
		(answers.size ~= 1).ifTrue {
			self.error('namedScale: no such singular scale')
		};
		answers[1]
	}

	namedScales { :self |
		let answer = system.scalaScaleArchive.select { :each |
			each.nameList.includes(self)
		};
		answer.isEmpty.ifTrue {
			self.error('namedScales: no such scale')
		};
		answer
	}

}

+SmallFloat {

	momentOfSymmetry { :generator :period :maxDepth |
		let i = generator;
		let j = period - generator;
		let nextPair = { :pair |
			let [i, j] = pair;
			(i < j).if { [i, j - i] } { [i - j, j] }
		};
		let depth = 1;
		let answer = [[i, j]];
		{
			let previousLevel = answer.last;
			let k = i.max(j);
			let [p, q] = [i, j].nextPair;
			let nextLevel = previousLevel.copyReplaceAllWith([k], [p, q]);
			[i, j] := [p, q];
			depth := depth + 1;
			( i ~ j | { i ~ 0 } | { j ~ 0 } | { depth > maxDepth } ).if {
				false
			} {
				answer.add(nextLevel);
				true
			}
		}.whileTrue;
		answer
	}

	momentOfSymmetry { :generator :period |
		momentOfSymmetry(generator, period, 24)
	}

}

+List {

	horogramDrawing { :self :radius |
		let circleCount = self.size + 1;
		let outerRadius = circleCount * radius;
		let period = self[1].sum;
		let innerCircle = [period];
		let pitches = [
			[innerCircle],
			self
		].concatenation.collect(prefixSum:/1).nubCumulatively;
		let angles = pitches.collect { :p |
			p.collect { :q |
				((q / period).negated * 2.pi + 0.5.pi) % 2.pi
			}
		};
		let circles = (1 .. circleCount).collect { :each |
			Circle([0 0], each * radius)
		};
		let lines = (1 .. circleCount).collect { :each |
			let innerRadius = each - 1 * radius;
			angles[each].collect { :theta |
				[innerRadius theta; outerRadius theta]
				.fromPolarCoordinates
				.Line
			}
		};
		[circles, lines].LineDrawing
	}

	horogramDrawing { :self |
		self.horogramDrawing(1)
	}

}
