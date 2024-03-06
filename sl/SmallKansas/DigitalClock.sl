{- Requires: SmallKansas -}

DigitalClock : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		let getTime = {
			system.now.asDate.localeTimeString('en-US')
		};
		let textEditor = smallKansas.TextEditor(
			'Digital Clock',
			'text/plain',
			getTime()
		);
		let frame = smallKansas.addFrameWithAnimator(textEditor, event, 1) {
			textEditor.setEditorText(getTime())
		};
		textEditor.editable := false;
		frame.outerElement.style.setProperties((height: '1em', width: '18em'));
		frame
	}

}

+Void {

	DigitalClock {
		newDigitalClock()
	}

}
