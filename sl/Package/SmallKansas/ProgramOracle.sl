+HelpSystem {

	ProgramOracle { :self |
		self.ProgramBrowser(self.programOracle.atRandom)
	}

}

ProgramOracle : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.getHelp { :help |
			smallKansas.addFrame(help.ProgramOracle, event)
		}
	}

}
