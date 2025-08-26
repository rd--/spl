+SmallFloat{

	arcCos { :self |
		<primitive: return Math.acos(_self)>
	}

	arcSin { :self |
		<primitive: return Math.asin(_self)>
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
		anObject.adaptToNumberAndApply(self, atan2:/2)
	}

	cos { :self |
		<primitive: return Math.cos(_self);>
	}

	cot { :self |
		1 / self.tan
	}

	csc { :self |
		1 / self.sin
	}

	sec { :self |
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

}

+Complex {

	arcCos { :self |
		(self.imaginary = 0).if {
			(self.real.abs > 1).if {
				(self.real < 0).if {
					pi
				} {
					0
				}.j(
					self.real.copySignTo(self.real.abs.arcCosh)
				)
			} {
				self.real.arcCos.j(0)
			}
		} {
			let tmp = self.squaredNorm - 1 / 2;
			let delta = tmp.squared + self.imaginary.squared;
			let sh2y = tmp + delta.sqrt;
			let shy = sh2y.sqrt;
			let ch2y = 1 + sh2y;
			let chy = ch2y.sqrt;
			(self.real / chy).arcCos.j(
				self.imaginary.copySignTo(shy.arcSinh.negate)
			)
		}
	}

	arcSin { :self |
		(self.imaginary = 0).if {
			(self.real.abs > 1).if {
				(0.5.pi * self.real.sign).j(
					self.real.copySignTo(self.real.abs.arcCosh).negate
				)
			} {
				self.real.arcSin.j(0)
			}
		} {
			let tmp = self.squaredNorm - 1 / 2;
			let delta = tmp.squared + self.imaginary.squared;
			let sh2y = tmp + delta.sqrt;
			let shy = sh2y.sqrt;
			let ch2y = 1 + sh2y;
			let chy = ch2y.sqrt;
			(self.real / chy).arcSin.j(
				self.imaginary.copySignTo(shy.arcSinh)
			)
		}
	}

	arcTan { :self |
		let r2 = self.squaredNorm;
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
				Complex(1.pi / aNumber.real.copySignTo(2), 0)
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

	csc { :self |
		1 / self.sin
	}

	sec { :self |
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

	haversine { :self |
		0.5 * (1 - self.cos)
	}

	inverseHaversine { :self |
		2 * self.sqrt.arcSin
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

+[SmallFloat, Complex] {

	cosecant { :self |
		1.csc
	}

	secant { :self |
		1.sec
	}

}

+@Collection {

	arcCos { :self |
		self.collect(arcCos:/1)
	}

	arcCot { :self |
		self.collect(arcCot:/1)
	}

	arcSin { :self |
		self.collect(arcSin:/1)
	}

	arcTan { :self |
		self.collect(arcTan:/1)
	}

	cos { :self |
		self.collect(cos:/1)
	}

	cosDegrees { :self |
		self.collect(cosDegrees:/1)
	}

	cot { :self |
		self.collect(cot:/1)
	}

	csc { :self |
		self.collect(csc:/1)
	}

	haversine { :self |
		self.collect(haversine:/1)
	}

	inverseHaversine { :self |
		self.collect(inverseHaversine:/1)
	}

	sec { :self |
		self.collect(sec:/1)
	}

	sin { :self |
		self.collect(sin:/1)
	}

	sinDegrees { :self |
		self.collect(sinDegrees:/1)
	}

	sincHistorical { :self |
		self.collect(sincHistorical:/1)
	}

	sincNormalized { :self |
		self.collect(sincNormalized:/1)
	}

}
