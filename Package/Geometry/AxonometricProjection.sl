AxonometricProjection : [Object] { | xRadius xTheta yRadius yTheta zRadius zTheta |

	asTransformationMatrix { :self |
		[
			[
				self.xRadius * self.xTheta.cos,
				self.yRadius * self.yTheta.cos,
				self.zRadius * self.zTheta.cos
			],
			[
				self.xRadius * self.xTheta.sin,
				self.yRadius * self.yTheta.sin,
				self.zRadius * self.zTheta.sin
			],
			[
				0,
				0,
				0
			]
		]
	}

	asUnaryBlock { :self |
		let matrix = self.asTransformationMatrix;
		{ :aVector |
			let [x, y, _] = matrix.dot(aVector);
			[x, y]
		}
	}

	polarCoordinates { :self |
		[
			self.xRadius self.xTheta;
			self.yRadius self.yTheta;
			self.zRadius self.zTheta
		]
	}

}

+SmallFloat {

	AxonometricProjection { :gamma :beta :alpha :z :y :x |
		newAxonometricProjection()
		.initializeSlots(
			x, pi - alpha,
			y, 0.5.pi + beta,
			z, gamma
		)
	}

}

+List {

	asAxonometricProjection { :self |
		let [x, y, z] = self;
		newAxonometricProjection()
		.initializeSlots(
			x[1], x[2],
			y[1], y[2],
			z[1], z[2]
		)
	}

}

+String {

	namedAxonometricProjection { :self :alpha |
		self.caseOfOtherwise([
			'CabinetOblique' -> { AxonometricProjection(alpha, 0, 0, 1 / 2, 1, 1) }
		]) {
			self.error('namedAxonometricProjection: alpha')
		}
	}

	namedAxonometricProjection { :self |
		self.caseOfOtherwise([
			'CavalierOblique' -> { AxonometricProjection(pi / 4, 0, 0, 1, 1, 1) },
			'Isometric' -> { AxonometricProjection(pi / 6, 0, pi / 6, 1, 1, 1) },
			'Planometric' -> { AxonometricProjection(pi / 4, 0, pi / 4, 1, 1, 1) }
		]) {
			self.error('namedAxonometricProjection')
		}
	}

}
