+SmallKansas {

	ScSynthStatus { :self :event |
		|(
			textEditor = TextEditor('ScSynth Status', 'text/html', '---'),
			frame = self.addFrameWithAnimator(textEditor, event, 1) {
				textEditor.setEditorText(
					system.defaultScSynth.isAlive.if {
						system.defaultScSynth.status.asHtmlTable(asString:/1).outerHTML
					} {
						'---'
					}
				)
			}
		)|
		textEditor.editable := false;
		frame.outerElement.style.setProperties((height: '14em', width: '18em'));
		frame
	}

}
