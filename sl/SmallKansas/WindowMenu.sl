{- Requires: SmallKansas -}

WindowMenu : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		let currentWindowTitles = {
			smallKansas.frameSet.asList.collect { :frame |
				MenuItem(frame.title, nil) { :unusedEvent |
					frame.bringToFront
				}
			}.sort
		};
		let menu = Menu(self.title, currentWindowTitles());
		smallKansas.addFrameWithAnimator(menu, event, 1) {
			menu.setEntries(currentWindowTitles())
		}
	}

	title { :self |
		'Window Menu'
	}

}
