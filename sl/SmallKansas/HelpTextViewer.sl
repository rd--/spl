/* Requires: SmallKansas TextEditor */

+SmallKansas {

	helpTextFor { :self :topic :event |
		self.helpIndex.then { :helpIndex |
			helpIndex.fetchFor(topic).then { :aString |
				aString.ifNotNil {
					self.helpTextViewer(event).subject.setEditorText(aString)
				}
			}
		}
	}

	helpTextViewer { :self :event |
		self.frameSet.detectIfNone { :each |
			each.title = 'Help Text Viewer'
		} {
			let editor = self.TextEditor('Help Text Viewer', 'text/markdown', '');
			self.addFrame(editor, event)
		}
	}

}
