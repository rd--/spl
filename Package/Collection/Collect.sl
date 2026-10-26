@Collect {

	adaptToIntegerAndApply { :self :anInteger :aBlock/2 |
		self.collect { :each |
			aBlock(anInteger, each)
		}
	}

	adaptToNumberAndApply { :self :aNumber :aBlock/2 |
		self.collect { :each |
			aBlock(aNumber, each)
		}
	}

	clip { :self :min :max |
		self.withWithCollect(min.nest, max.nest, clip/3)
	}

	clip { :self :minMax |
		self.collect { :each |
			each.clip(minMax)
		}
	}

	clip { :self |
		self.clip(-1, 1)
	}

	copyWithout { :self :oldElement |
		self.reject { :each |
			each = oldElement
		}
	}

	copyWithoutAll { :self :aCollection |
		self.reject { :each |
			aCollection.includes(each)
		}
	}

	copyWithoutIdenticalElements { :self |
		let seen = IdentitySet();
		self.select { :each |
			seen.includes(each).if {
				false
			} {
				seen.uncheckedInclude!(each);
				true
			}
		}
	}

	[divide, /] { :self :anObject |
		self.collect(/.bindRight(anObject))
	}

	[mod, %] { :self :anObject |
		self.collect(%.bindRight(anObject))
	}

	[plus, +] { :self :anObject |
		self.collect(+.bindRight(anObject))
	}

	[power, ^] { :self :anObject |
		self.collect(^.bindRight(anObject))
	}

	replaceNaN { :self :anObject |
		self.collect { :each |
			each.isNaN.if {
				anObject
			} {
				each
			}
		}
	}

	rescale { :self :a :b |
		self.collect(rescaleBlock(a, b))
	}

	rescale { :self :a |
		self.rescale(a, [0, 1])
	}

	[subtract, -] { :self :anObject |
		self.collect(-.bindRight(anObject))
	}

	[times, *] { :self :anObject |
		self.collect(*.bindRight(anObject))
	}

}
