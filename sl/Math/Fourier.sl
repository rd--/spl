+List {

	basicRealFft { :self |
		<primitive: return sc.realFft(_self);>
	}

	fft { :self |
		(self.elementType = 'SmallFloat').if {
			let interleaved = self.basicRealFft;
			(1, 3 ..  self.size * 2 - 1).collect { :each |
				Complex(interleaved[each], interleaved[each + 1])
			}
		} {
			self.error('fft: not real')
		}
	}

}

