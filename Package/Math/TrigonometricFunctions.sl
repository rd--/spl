+SmallFloat {

	arcCos { :self |
		self.isBetween(-1, 1).if {
			self.uncheckedArcCos
		} {
			Complex(self, 0).arcCos
		}
	}

	[arcCsc, arcCosecant] { :self |
		self.isZero.if {
			Infinity
		} {
			(1 / self).arcSin
		}
	}

	[arcSec, arcSecant] { :self |
		self.isZero.if {
			Infinity
		} {
			(1 / self).arcCos
		}
	}

	arcSin { :self |
		self.isBetween(-1, 1).if {
			self.uncheckedArcSin
		} {
			Complex(self, 0).arcSin
		}
	}

	arcTan { :self |
		<primitive: return Math.atan(_self)>
	}

	arcTan { :self :anObject |
		anObject.atan2(self)
	}

	atan2 { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return Math.atan2(_self, _anObject);
		}
		>
		anObject.adaptToNumberAndApply(self, atan2/2)
	}

	cos { :self |
		<primitive: return Math.cos(_self);>
	}

	cot { :self |
		1 / self.tan
	}

	[csc, cosecant] { :self |
		1 / self.sin
	}

	[sec, secant] { :self |
		1 / self.cos
	}

	sin { :self |
		<primitive: return Math.sin(_self)>
	}

	sincHistorical { :self |
		self.isZero.if {
			1
		} {
			self.sin / self
		}
	}

	sincNormalized { :self |
		self.pi.sincHistorical
	}

	tan { :self |
		<primitive: return Math.tan(_self)>
	}

	uncheckedArcCos { :self |
		<primitive: return Math.acos(_self)>
	}

	uncheckedArcSin { :self |
		<primitive: return Math.asin(_self)>
	}

}

+Complex {

	arcCos { :self |
		(self.imaginary = 0).if {
			(self.real.abs > 1).if {
				Complex(
					(self.real < 0).if {
						1.pi
					} {
						0
					},
					self.real.copySign(self.real.abs.arcCosh)
				)
			} {
				Complex(
					self.real.arcCos,
					0
				)
			}
		} {
			let tmp = self.absSquare - 1 / 2;
			let delta = tmp.square + self.imaginary.square;
			let sh2y = tmp + delta.sqrt;
			let shy = sh2y.sqrt;
			let ch2y = 1 + sh2y;
			let chy = ch2y.sqrt;
			Complex(
				(self.real / chy).arcCos,
				self.imaginary.copySign(shy.arcSinh.negate)
			)
		}
	}

	[arcCsc, arcCosecant] { :z |
		-1I * ((1 - (1 / z.square)).sqrt + (1I / z)).log
	}

	[arcSec, arcSecant] { :z |
		-1I * (((1 - z.square).sqrt + 1).log - z.log)
	}

	arcSin { :self |
		(self.imaginary = 0).if {
			(self.real.abs > 1).if {
				Complex(
					0.5.pi * self.real.sign,
					self.real.copySign(self.real.abs.arcCosh).negate
				)
			} {
				Complex(
					self.real.arcSin,
					0
				)
			}
		} {
			let tmp = self.absSquare - 1 / 2;
			let delta = tmp.square + self.imaginary.square;
			let sh2y = tmp + delta.sqrt;
			let shy = sh2y.sqrt;
			let ch2y = 1 + sh2y;
			let chy = ch2y.sqrt;
			Complex(
				(self.real / chy).arcSin,
				self.imaginary.copySign(shy.arcSinh)
			)
		}
	}

	arcTan { :self |
		let r2 = self.absSquare;
		Complex(
			(1 - r2).arcTan(self.real * 2) / 2,
			((r2 + (self.imaginary * 2) + 1) / (r2 - (self.imaginary * 2) + 1)).log / 4
		)
	}

	arcTan { :self :aNumber |
		self.isZero.if {
			aNumber.isZero.if {
				Complex(0, 0)
			} {
				Complex(1.pi / aNumber.real.copySign(2), 0)
			}
		} {
			let answer = (aNumber / self).arcTan;
			(self.real < 0).if {
				answer + 1.pi
			} {
				(answer.real > 1.pi).if {
					answer - 2.pi
				} {
					answer
				}
			}
		}
	}

	cos { :self |
		self.i.cosh
	}

	[csc, cosecant] { :self |
		1 / self.sin
	}

	[sec, secant] { :self |
		1 / self.cos
	}

	sin { :self |
		self.i.sinh.i.negate
	}

	tan { :self |
		self.sin / self.cos
	}

}

+[SmallFloat, Complex] {

	arcCot { :self |
		(1 / self).arcTan
	}

	[arcHarversine, inverseHaversine] { :self |
		2 * self.sqrt.arcSin
	}

	haversine { :self |
		0.5 * (1 - self.cos)
	}

}

+@Number {

	cosDegrees { :self |
		(90 - (180 + self % 360 - 180).abs).degreesToRadians.sin
	}

	sinDegrees { :self |
		(90 - self).cosDegrees
	}

	sobolevaModifiedTanh { :a :b :c :d |
		{ :x |
			((a * x).exp - (b.negate * x).exp) / ((c * x).exp + (d.negate * x).exp)
		}
	}

}

+@Collection {

	arcCos { :self |
		self.collect(arcCos/1)
	}

	arcCot { :self |
		self.collect(arcCot/1)
	}

	[arcCsc, arcCosecant] { :self |
		self.collect(arcCsc/1)
	}

	[arcSec, arcSecant] { :self |
		self.collect(arcSec/1)
	}

	arcSin { :self |
		self.collect(arcSin/1)
	}

	arcTan { :self |
		self.collect(arcTan/1)
	}

	cos { :self |
		self.collect(cos/1)
	}

	cosDegrees { :self |
		self.collect(cosDegrees/1)
	}

	cot { :self |
		self.collect(cot/1)
	}

	[csc, cosecant] { :self |
		self.collect(csc/1)
	}

	haversine { :self |
		self.collect(haversine/1)
	}

	inverseHaversine { :self |
		self.collect(inverseHaversine/1)
	}

	[sec, secant] { :self |
		self.collect(sec/1)
	}

	sin { :self |
		self.collect(sin/1)
	}

	sinDegrees { :self |
		self.collect(sinDegrees/1)
	}

	sincHistorical { :self |
		self.collect(sincHistorical/1)
	}

	sincNormalized { :self |
		self.collect(sincNormalized/1)
	}

}

+@Sequence {

	arcTan { :self :operand |
		operand.adaptToCollectionAndApply(self, arcTan/2)
	}

	atan2 { :self :operand |
		operand.adaptToCollectionAndApply(self, atan2/2)
	}

}

+@ImplicitFloat {

	arcCos { :self |
		SmallFloat(self).arcCos
	}

	arcSin { :self |
		SmallFloat(self).arcSin
	}

	cos { :self |
		SmallFloat(self).cos
	}

	sin { :self |
		SmallFloat(self).sin
	}

	tan { :self |
		SmallFloat(self).tan
	}

}

+@Integer {

	cosDerivative { :self |
		(self % 4).caseOf(
			[
				0 -> { cos/1 },
				1 -> { { :x | 0 - x.sin } },
				2 -> { { :x | 0 - x.cos } },
				3 -> { sin/1 }
			]
		)
	}

	sinDerivative { :self |
		(self % 4).caseOf(
			[
				0 -> { sin/1 },
				1 -> { cos/1 },
				2 -> { { :x | 0 - x.sin } },
				3 -> { { :x | 0 - x.cos } }
			]
		)
	}

}
