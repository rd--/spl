SuperColliderProgramOracle : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		system.superColliderProgramIndex.then { :superColliderProgramIndex |
			system.superColliderProgramOracle.then { :superColliderProgramOracle |
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
