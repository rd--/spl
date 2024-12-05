AxonometricProjection : [Object] { | alpha beta x y z |

	asBlock { :self |
		let matrix = self.asMatrix;
		{ :aVector |
			let [x, y, _] = matrix.dot(aVector);
			[x, y]
		}
	}

	asMatrix { :self |
		[
			[self.x * self.beta.cos.negated, 0, self.z * self.alpha.cos],
			[self.x * self.beta.sin, self.y , self.z * self.alpha.sin],
			[0, 0, 0]
		]
	}

}

+Void {

	AxonometricProjection {
		newAxonometricProjection().initializeSlots(0, 0, 1, 1, 1)
	}

}

+String {

	AxonometricProjection { :self |
		let p = AxonometricProjection();
		self.caseOfOtherwise([
			'Chinese' -> { p.initializeSlots(pi / 6, 0, 1, 1, 1 / 2) },
			'Isometric' -> { p.initializeSlots(pi / 6, pi / 6, 1, 1, 1) }
		]) {
			self.error('AxonometricProjection')
		};
		p
	}

}
