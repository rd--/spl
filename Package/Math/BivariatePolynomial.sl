BivariatePolynomial : [Object, Copy, Store, Equal] {

	| coefficientMatrix |

	binaryFunction { :self |
		let m = self.coefficientMatrix;
		{ :x :y |
			m.evaluateBivariatePolynomial(x, y)
		}
	}

	degree { :self |
		self.coefficientMatrix.shape - 1L
	}

	evaluate { :self :x :y |
		self.coefficientMatrix.evaluateBivariatePolynomial(x, y)
	}

	isEqualBy { :self :operand :aFunction/2 |
		operand.isBivariatePolynomial & {
			aFunction(self.coefficientMatrix, operand.coefficientMatrix)
		}
	}

	isZero { :self |
		self.coefficientMatrix.isEmpty
	}

	postCopy { :self |
		self.coefficientMatrix := self.coefficientMatrix.deepCopy
	}

}

+List {

	BivariatePolynomial { :self |
		newBivariatePolynomial().initializeSlots(self)
	}

	evaluateBivariatePolynomial { :coefficientMatrix :x :y |
		coefficientMatrix.ifEmpty {
			0L
		} {
			let [m, n] = coefficientMatrix.shape;
			let answer = nil;
			1L.toDo(m) { :i |
				let r = coefficientMatrix[i];
				1L.toDo(n) { :j |
					let a = r[j];
					a.isZero.ifFalse {
						let p = i - 1L;
						let q = j - 1L;
						let r = [
							{ p = 0L & { q = 0L } } -> { a },
							{ p = 0L } -> { a * (y ^ q) },
							{ q = 0L } -> { a * (x ^ p) },
							{ true } -> { a * (x ^ p) * (y ^ q) }
						].which;
						answer := answer.ifNil { r } { answer + r }
					}
				}
			};
			answer
		}
	}

}
