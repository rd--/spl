/* Requires: Float List */

ComplexInterval : [Object, Store, Equal] {

	| lowerLeft upperRight |

	atRandom { :self |
		system.randomComplex([self.lowerLeft, self.upperRight], [])
	}

	between { :self |
		{ :z |
			z.isBetweenUsing(
				self.lowerLeft,
				self.upperRight,
				precedesOrEqual/2
			)
		}
	}

	[center, midpoint] { :self |
		let [a, b] = self.lowerLeft.realImaginary;
		let [c, d] = self.upperRight.realImaginary;
		Complex(
			(a + c) / 2.0,
			(b + d) / 2.0
		)
	}

	checkComplexInterval { :self |
		self.lowerLeft.precedesOrEqual(
			self.upperRight
		).ifFalse {
			self.error('checkComplexInterval')
		};
		self
	}

	concisePrintString { :self |
		self.literalPrintStringUsing(concisePrintString/1)
	}

	discretize { :self :size :aBlock/1 |
		self.discretize(size).collect { :each |
			each.collect(aBlock/1)
		}
	}

	discretize { :self :size |
		let [a, b] = self.lowerLeft.realImaginary;
		let [c, d] = self.upperRight.realImaginary;
		let [y, x] = size;
		(b -- d).discretize(y).collect { :p |
			(a -- c).discretize(x).collect { :q |
				Complex(q, p)
			}
		}
	}

	endPoints { :self |
		[self.lowerLeft, self.upperRight]
	}

	includes { :self :operand |
		operand.isBetweenUsing(self.lowerLeft, self.upperRight, precedesOrEqual/2)
	}

	isEqualBy { :self :operand :aBlock/2 |
		operand.isComplexInterval & {
			aBlock(self.lowerLeft, operand.lowerLeft) & {
				aBlock(self.upperRight, operand.upperRight)
			}
		}
	}

	isIntersecting { :self :operand |
		self.upperRight > operand.lowerLeft | {
			operand.upperRight > self.lowerLeft
		}
	}

	literalPrintStringUsing { :self :aBlock/1 |
		'(% -- %)'.format(
			[
				aBlock(self.lowerLeft),
				aBlock(self.upperRight)
			]
		)
	}

	[lowerBound, infimum] { :self |
		self.lowerLeft
	}

	printString { :self |
		self.literalPrintStringUsing(printString/1)
	}

	subdivide { :self :n |
		self.discretize(n + 1L)
	}

	[upperBound, supremum] { :self |
		self.upperLeft
	}

}

+Complex {

	[ComplexInterval, --] { :a :b |
		b.isComplex.if {
			uncheckedComplexInterval(a, b).checkComplexInterval
		} {
			b.adaptToComplexAndApply(a, ComplexInterval/2)
		}
	}

	adaptToComplexIntervalAndApply { :self :operand :aBlock/2 |
		aBlock(operand, ComplexInterval(self, self))
	}

	centeredComplexInterval { :center :range |
		ComplexInterval(center - range, center + range)
	}

	uncheckedComplexInterval { :self :operand |
		newComplexInterval().initializeSlots(self, operand)
	}

}

+List {

	ComplexInterval { :self :operand |
		operand.adaptToCollectionAndApply(self, ComplexInterval/2)
	}

	centeredComplexInterval { :center :range |
		range.adaptToCollectionAndApply(center, centeredComplexInterval/2)
	}

}
