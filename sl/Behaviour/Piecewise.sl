Piecewise : [Object] { | pieces defaultValue |

	value { :self :x |
		valueWithReturn { :return:/1 |
			self.pieces.do { :each |
				each[2].value(x).ifTrue {
					each[1].value(x).return
				}
			};
			self.defaultValue.value(x)
		}
	}

}

+@Sequence {

	Piecewise { :pieces :defaultValue |
		newPiecewise().initializeSlots(pieces, defaultValue)
	}

	Piecewise { :pieces |
		Piecewise(pieces, 0.constant)
	}

}
