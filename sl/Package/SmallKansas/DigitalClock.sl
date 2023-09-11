+SmallKansas {

	DigitalClock { :self :event |
		|(
			getTime = {
				system.Date.localeTimeString('en-US')
			},
			textEditor = TextEditor('Digital Clock', 'text/plain', getTime()),
			frame = self.addFrameWithAnimator(textEditor, event, 1) {
				textEditor.setEditorText(getTime())
			}
		)|
		textEditor.editable := false;
		frame.outerElement.style.setProperties((height: '1em', width: '18em'));
		frame
	}

}
