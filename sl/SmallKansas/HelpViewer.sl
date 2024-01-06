(* Requires: SmallKansas TextEditor *)

+SmallKansas {

	helpFor { :self :topic :event |
		self.helpIndex.then { :helpIndex |
			helpIndex.fetchFor(topic).then { :aString |
				aString.ifNotNil {
					self.helpViewer(event).subject.setEditorText(aString)
				}
			}
		}
	}

	helpViewer { :self :event |
		self.frameSet.detectIfNone { :each |
			each.title = 'Help Viewer'
		} {
			let editor = self.TextEditor('Help Viewer', 'text/markdown', '');
			self.addFrame(editor, event)
		}
	}

}
