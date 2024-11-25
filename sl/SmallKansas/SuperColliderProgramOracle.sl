+@Cache {

	superColliderProgramOracle { :self |
		self.useLibraryItem(
			LibraryItem(
				'superColliderProgramOracle',
				'https://rohandrape.net/sw/jssc3/text/SmallHoursOracle.text',
				'text/plain',
				SuperColliderProgramIndex:/1
			)
		)
	}

}

SuperColliderProgramOracle : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.superColliderProgramIndex.then { :superColliderProgramIndex |
			smallKansas.superColliderProgramOracle.then { :superColliderProgramOracle |
				smallKansas.addFrame(
					smallKansas.SuperColliderProgramBrowser(
						superColliderProgramIndex,
						superColliderProgramOracle.atRandom
					),
					event
				)
			}
		}
	}

}
