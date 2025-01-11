AxonometricProjection : [Object] { | alpha beta gamma x y z |

	asMatrix { :self |
		[
			[
				self.x * self.gamma.cos.-,
				self.y * self.beta.cos,
				self.z * self.alpha.cos
			],
			[
				self.x * self.gamma.sin,
				self.y * self.beta.sin,
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
		AxonometricProjection(0, pi / 2, 0, 1, 1, 1)
	}

}

+SmallFloat {

	AxonometricProjection { :alpha :beta :gamma :x :y :z |
		newAxonometricProjection().initializeSlots(alpha, beta, gamma, x, y, z)
	}

}

+String {

	AxonometricProjection { :self :alpha |
		self.caseOfOtherwise([
			'CabinetOblique' -> { AxonometricProjection(alpha, pi / 2, 0, 1, 1, 1 / 2) }
		]) {
			self.error('AxonometricProjection: alpha')
		}
	}

	AxonometricProjection { :self |
		self.caseOfOtherwise([
			'CavalierOblique' -> { AxonometricProjection(pi / 4, pi / 2, 0, 1, 1, 1) },
			'Chinese' -> { AxonometricProjection(pi / 6, pi / 2, 0, 1, 1, 1 / 2) },
			'Isometric' -> { AxonometricProjection(pi / 6, pi / 2, pi / 6, 1, 1, 1) },
			'Planometric' -> { AxonometricProjection(pi / 4, pi / 2, pi / 4, 1, 1, 1) }
		]) {
			self.error('AxonometricProjection')
		}
	}

}
