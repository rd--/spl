Span : [Object, Iterable, Collection, Indexable, Sequenceable, ArithmeticProgression] { | start stop step |

	= { :self :operand |
		self.hasEqualSlots(operand)
	}

	asRange { :self |
		self.isRelative.if {
			self.error('asRange: relative span')
		} {
			Range(self.start, self.stop, self.step)
		}
	}

	asRange { :self :extent |
		self.isRelative.if {
			let start = self.start;
			let stop = self.stop;
			(start < 1).ifTrue {
				start := extent - start.abs + 1
			};
			(stop < 1).ifTrue {
				stop := extent - stop.abs + 1
			};
			Range(start, stop, self.step)
		} {
			Range(self.start, self.stop, self.step)
		}
	}

	asSpan { :self |
		self
	}

	isRelative { :self |
		self.start < 0 | {
			self.stop < 0
		}
	}

	size { :self |
		self.isRelative.if {
			self.error('size: relative span')
		} {
			self.asRange.size
		}
	}

	species { :self |
		List:/1
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+SmallFloat {

	Span { :start :stop :step |
		[start, stop, step].anySatisfy { :each |
			each.isInteger.not | {
				each.isZero
			}
		}.if {
			start.error('SmallFloat>>Span: zero parameter?')
		} {
			newSpan().initializeSlots(start, stop, step)
		}
	}

}
