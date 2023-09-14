HelpSystem : [Object] { | helpIndex programIndex programOracle |

	helpAreas { :self |
		['spl', 'sc', 'sk']
	}

	HelpBrowser { :self |
		ColumnBrowser(
			'Help Browser',
			'text/markdown',
			false,
			false,
			[1, 1, 3],
			nil,
			nil,
			{ :browser :path |
				path.size.caseOf([
					0 -> {
						self.helpAreas
					},
					1 -> {
						self.helpKind(path[1])
					},
					2 -> {
						self.helpNames(path[1], path[2])
					},
					3 -> {
						self.helpFetch(path)
					}
				])
			}
		)
	}

	helpFetch { :self :path |
		path.ifNotNil {
			| url = self.helpUrl(path[1], path[2], path[3]); |
			('HelpSystem>>helpFetch: ' ++ path.joinSeparatedBy('/')).postLine;
			system.window.fetchString(url, (cache: 'no-cache'))
		}
	}

	helpFetchFor { :self :subject |
		self.helpFetch(self.helpFind(subject))
	}

	helpFind { :self :name |
		self.helpIndex.detectIfNone { :each |
			each.third = name
		} {
			self.warning('helpFind: no help for: ' ++ name);
			nil
		}
	}

	helpKind { :self :area |
		['doc', 'help']
	}

	helpNames { :self :area :kind |
		self.helpIndex.select { :each |
			each.first = area & {
				each.second = kind
			}
		}.collect(third:/1).Set.Array.sort
	}

	helpProject { :self :area |
		area.caseOf([
			'sc' -> { 'stsc3' },
			'sk' -> { 'spl' },
			'spl' -> { 'spl' }
		])
	}

	helpUrl { :self :area :kind :name |
		['./lib/', self.helpProject(area), '/', kind, '/', area, '/', name, '.help.sl'].join
	}

	requireLibraries { :self |
		[
			system.requireLibraryItem('helpIndex').then { :answer |
				self.helpIndex := answer
			},
			system.requireLibraryItem('programIndex').then { :answer |
				self.programIndex := answer
			},
			system.requireLibraryItem('programOracle').then { :answer |
				self.programOracle := answer
			}
		].Promise.then { :unused |
			self
		}
	}

}

+Void {

	HelpSystem {
		newHelpSystem().requireLibraries
	}

}

+SmallKansas {

	getHelp { :self :helpProcedure:/1 |
		(*
			The HelpSystem requires resources that are acquired asynchronously.
			SmallKansas>>getHelp checks if the HelpSystem is acquired, else it acquires it.
			Eventually the helpProcedure is run with a valid HelpSystem.
		*)
		self.helpSystem.ifNil {
			HelpSystem().then { :helpSystem |
				self.helpSystem := helpSystem;
				helpProcedure(self.helpSystem)
			}
		} {
			helpProcedure(self.helpSystem)
		}
	}

	helpFor { :self :subject :event |
		self.getHelp { :help |
			help.helpFetchFor(subject).then { :aString |
				self.addFrame(
					TextEditor('HelpViewer', 'text/markdown', aString),
					event
				)
			}
		}
	}

}

HelpBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.getHelp { :help |
			smallKansas.addFrame(help.HelpBrowser, event)
		}
	}

}
