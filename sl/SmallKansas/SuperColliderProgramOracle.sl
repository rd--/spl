SuperColliderProgramOracle : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		system.requestLibraryItem(
			'Music/SuperCollider/ProgramIndex'
		).then { :superColliderProgramIndex |
			system.requestLibraryItem(
				'Music/SuperCollider/ProgramOracle'
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
