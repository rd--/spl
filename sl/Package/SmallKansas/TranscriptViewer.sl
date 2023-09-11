TranscriptViewer : [Object, View] { | textEditor entryCount |

	initialize { :self |
		self.textEditor := TextEditor('', 'text/plain', '');
		self.entryCount := 0;
		self
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

+Void {

	TranscriptViewer {
		newTranscriptViewer().initialize
	}

}

+SmallKansas {

	TranscriptViewer { :self :event |
		|(
			transcriptViewer = TranscriptViewer(),
			frame = self.addFrameWithAnimator(transcriptViewer, event, 1) {
				transcriptViewer.update
			}
		)|
		frame
	}

}
