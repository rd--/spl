AxonometricProjection : [Object] { | alpha beta x y z |

	asMatrix { :self |
		[
			[
				self.x * self.beta.cos.negated,
				0,
				self.z * self.alpha.cos
			],
			[
				self.x * self.beta.sin,
				self.y,
				self.z * self.alpha.sin
			],
			[
				0,
				0,
				0
			]
		]
	}

	asUnaryBlock { :self |
		let matrix = self.asMatrix;
		{ :aVector |
			let [x, y, _] = matrix.dot(aVector);
			[x, y]
		}
	}

}

+Void {

	AxonometricProjection {
		AxonometricProjection(0, 0, 1, 1, 1)
	}

}

+SmallFloat {

	AxonometricProjection { :alpha :beta :x :y :z |
		newAxonometricProjection().initializeSlots(alpha, beta, x, y, z)
	}

}

+String {

	AxonometricProjection { :self :alpha |
		self.caseOfOtherwise([
			'CabinetOblique' -> { AxonometricProjection(alpha, 0, 1, 1, 1 / 2) }
		]) {
			self.error('AxonometricProjection: alpha')
		}
	}

	AxonometricProjection { :self |
		self.caseOfOtherwise([
			'CavalierOblique' -> { AxonometricProjection(pi / 4, 0, 1, 1, 1) },
			'Chinese' -> { AxonometricProjection(pi / 6, 0, 1, 1, 1 / 2) },
			'Isometric' -> { AxonometricProjection(pi / 6, pi / 6, 1, 1, 1) },
			'Planometric' -> { AxonometricProjection(pi / 4, pi / 4, 1, 1, 1) }
		]) {
			self.error('AxonometricProjection')
		}
	}

}
