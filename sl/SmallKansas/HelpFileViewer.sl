{- Requires: DocumentTest HelpFile SmallKansas SmallProgram TextEditor -}

HelpFileViewer : [Object, UserEventTarget, View] { | smallKansas outerElement eventListeners |

	initialize { :self :smallKansas |
		self.smallKansas := smallKansas;
		self.outerElement := 'div'.createElement(
			class: 'helpFileViewerPane'
		);
		self.eventListeners := Record();
		self
	}

	title { :self |
		'Help File Viewer'
	}

}

+SmallKansas {

	helpFor { :self :topic :event |
		self.helpIndex.then { :helpIndex |
			helpIndex.fetchFor(topic).then { :aString |
				aString.ifNotNil {
					let subject = self.helpFileViewer(event).subject;
					let pane = subject.outerElement;
					let helpFile = HelpFile(topic, aString);
					let lines = helpFile.lines;
					let codeRanges = helpFile.fencedCodeBlockLineRanges;
					let nonCodeRanges = (1 .. lines.size).differenceAll(codeRanges).asRangeList;
					let allRanges = (codeRanges ++ nonCodeRanges).sortBy { :p :q | p.start < q.start };
					let fragments = allRanges.collect { :each | lines @* each };
					let place = { :item | pane.appendChild(item.outerElement) };
					pane.removeAllChildren;
					fragments.do { :each |
						each.first.isCodeFence.if {
							each.allButFirstAndLast.splitBy(['']).do { :codeBlock |
								codeBlock.first.beginsWith('>>> ').if {
									codeBlock.asDocumentTest.asSmallProgram(self).place
								} {
									SmallProgram(self, '', codeBlock.unlines, '').place
								}
							}
						} {
							TextEditor(self, 'Help File Fragment', 'text/markdown', each.unlines).place
						}
					}
				}
			}
		}
	}

	helpFileViewer { :self :event |
		self.frameSet.detectIfNone { :each |
			each.title = 'Help File Viewer'
		} {
			let viewer = newHelpFileViewer().initialize(self);
			self.addFrame(viewer, event)
		}
	}

}
