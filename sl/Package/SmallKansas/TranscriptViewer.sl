TranscriptViewer : [Object, View, SmallKansan] { | textEditor entryCount |

	initialize { :self |
		self.textEditor = nil;
		self.entryCount := 0;
		self
	}

	openIn { :self :smallKansas :event |
		self.textEditor := smallKansas.TextEditor('', 'text/plain', '');
		smallKansas.addFrameWithAnimator(self, event, 1) {
			self.update
		}
	}

	outerElement { :self |
		self.textEditor.outerElement
	}

	update { :self |
		(self.entryCount ~= system.transcript.entries.size).ifTrue {
			self.entryCount := system.transcript.entries.size;
			self.textEditor.setEditorText(system.transcript.String)
		}
	}

}
