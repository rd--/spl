Piecewise : [Object, Equatable] { | pieces defaultValue |

	value { :self :x |
		valueWithReturn { :return:/1 |
			self.pieces.do { :each |
				each.key.value(x).ifTrue {
					each.value.value(x).return
				}
			};
			self.defaultValue.value(x)
		}
	}

}

+List {

	Piecewise { :pieces :defaultValue:/1 |
		newPiecewise().initializeSlots(pieces, defaultValue:/1)
	}

	Piecewise { :pieces |
		Piecewise(pieces, 0.constant)
	}

}
