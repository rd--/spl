@SystemCache {

}

+String {

	asInteger { :self |
		self.parseInteger(10)
	}

	asNumber { :self |
		self.includes(':'.Character).if {
			self.parseFraction
		} {
			self.parseNumber
		}
	}

	parseInteger { :self :radix |
		<primitive: return Number.parseInt(_self, _radix);>
	}

	parseNumber { :self |
		<primitive: return Number.parseFloat(_self);>
	}

}

+Void {

	e {
		1.exp
	}

	epsilon {
		<primitive: return Number.EPSILON;>
	}

}

Constant.pi = 3.1415926535897932384626433
Constant.e = 2.71828182845904523536028747135266249775724709369995
Constant.epsilon = 0.000000000000001
