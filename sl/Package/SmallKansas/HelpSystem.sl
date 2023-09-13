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
			each[3] = name
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
			each[1] = area & {
				each[2] = kind
			}
		}.collect(third:/1).Set.Array.sorted
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

	parseHelpIndex { :self :aString |
		aString.lines.select(notEmpty:/1).collect { :each |
			| [kind, area, name] = each.replaceString('.help.sl', '').splitRegExp(RegExp('/')); |
			[area, kind, name]
		}
	}

	parseProgramIndex { :self :aString |
		aString.lines.select(notEmpty:/1).collect { :each |
			each.replaceString('.sl', '').splitRegExp(RegExp(' - |/'))
		}
	}

	programAuthors { :self :category |
		self.programIndex.select { :each |
			each[1] = category
		}.collect(second:/1).Set.Array.sorted
	}

	ProgramBrowser { :self :path |
		ColumnBrowser(
			'Program Browser',
			'text/plain',
			false,
			false,
			[1, 1, 3],
			nil,
			nil,
			{ :browser :path |
				path.size.caseOf([
					0 -> {
						self.programCategories
					},
					1 -> {
						self.programAuthors(path[1])
					},
					2 -> {
						self.programNames(path[1], path[2])
					},
					3 -> {
						self.programFetch(path[1], path[2], path[3])
					}
				])
			}
		).setPath(path)
	}

	ProgramBrowser { :self |
		self.ProgramBrowser([])
	}

	programCategories { :self |
		self.programIndex.collect(first:/1).Set.Array.sorted.reject { :each |
			each = 'collect'
		}
	}

	programFetch { :self :category :author :name |
		system.window.fetchString(self.programUrl(category, author, name), (cache: 'no-cache'))
	}

	programNames { :self :category :author |
		self.programIndex.select { :each |
			each[1] = category & {
				each[2] = author
			}
		}.collect(third:/1).sorted
	}

	ProgramOracle { :self |
		self.ProgramBrowser(self.programOracle.atRandom)
	}

	programUrl { :self :category :author :name |
		['./lib/stsc3/help/', category, '/', author, ' - ', name, '.sl'].join
	}

	requireLibraries { :self |
		[
			system.requireLibraryItem('helpIndex').then { :aString |
				self.helpIndex := self.parseHelpIndex(aString)
			},
			system.requireLibraryItem('programIndex').then { :aString |
				self.programIndex := self.parseProgramIndex(aString)
			},
			system.requireLibraryItem('programOracle').then { :aString |
				self.programOracle := self.parseProgramIndex(aString)
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

ProgramBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.getHelp { :help |
			smallKansas.addFrame(help.ProgramBrowser, event)
		}
	}

}

ProgramOracle : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.getHelp { :help |
			smallKansas.addFrame(help.ProgramOracle, event)
		}
	}

}
