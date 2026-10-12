Piecewise : [Object, Equal] {

	| pieces defaultValue |

	unaryBlock { :self |
		{ :x |
			valueWithReturn { :return/1 |
				self.pieces.do { :each |
					let f/1 = each.key;
					f(x).ifTrue {
						let g/1 = each.value;
						g(x).return
					}
				};
				let f/1 = self.defaultValue;
				f(x)
			}
		}
	}

}

+List {

	Piecewise { :pieces :defaultValue/1 |
		newPiecewise().initializeSlots(pieces, defaultValue/1)
	}

	Piecewise { :pieces |
		Piecewise(pieces, 0.constant)
	}

}
