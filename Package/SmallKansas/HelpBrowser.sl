/* Requires: ColumnBrowser SmallKansas TextEditor */

+SmallKansas {

	HelpBrowser { :self :helpIndex |
		self.ColumnBrowser(
			'Help Browser',
			'text/markdown',
			false,
			false,
			[1, 3],
			nil,
			nil,
			{ :browser :path |
				path.size.caseOf([
					0 -> {
						helpIndex.kind
					},
					1 -> {
						helpIndex.names(path[1])
					},
					2 -> {
						helpIndex.fetch(path)
					}
				])
			}
		)
	}

}

HelpBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		system.requestLibraryItem(
			'HelpIndex'
		).then { :helpIndex |
			smallKansas.addFrame(
				smallKansas.HelpBrowser(helpIndex),
				event
			)
		}
	}

}

AboutSmallKansas : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.helpFor('Small Kansas', event)
	}

}
