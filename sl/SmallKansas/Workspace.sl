{- Requires: SmallKansas TextEditor -}

Workspace : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.addFrame(
			smallKansas.TextEditor('Workspace', 'text/plain', ''),
			event
		)
	}

}
