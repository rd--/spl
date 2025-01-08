SuperColliderProgramOracle : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		system.requestLibraryItem(
			'SuperColliderProgramIndex'
		).then { :superColliderProgramIndex |
			system.requestLibraryItem(
				'SuperColliderProgramOracle'
			).then { :superColliderProgramOracle |
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
