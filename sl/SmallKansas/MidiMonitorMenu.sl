+MIDIAccess {

	midiPortListEntries { :self :onSelect:/2 |
		(self.inputs.ports ++ self.outputs.ports).collect { :each |
			MenuItem(each.type ++ '/' ++ each.name, nil) { :event |
				onSelect(each, event)
			}
		}
	}

}

+SmallKansas {

	midiMonitorOn { :self :midiPort :event |
		|(
			textEditor = self.TextEditor(
				'Midi Monitor On ' ++ midiPort.name,
				'text/plain',
				''),
			messages = [],
			onMidiMessage = { :midiMessageEvent |
				messages.add(midiMessageEvent);
				textEditor.setEditorText(messages.last(25.min(messages.size)).collect { :midi |
					midi.data.asString
				}.unlines)
			},
			frame = self.addFrame(textEditor, event)
		)|
		textEditor.editable := false;
		midiPort.addEventListener('midimessage', onMidiMessage);
		frame.addEventListener('close') { :unusedEvent |
			midiPort.removeEventListener('midimessage', onMidiMessage)
		};
		frame
	}

}

MidiMonitorMenu : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.midiAccess.then { :midiAccess |
			|(
				onSelect = { :midiPort :event |
					smallKansas.midiMonitorOn(midiPort, event)
				},
				menu = Menu('Midi Monitor Menu', midiAccess.midiPortListEntries(onSelect:/2))
			)|
			menu.isTransient := true;
			smallKansas.addFrameWithAnimator(menu, event, 1) {
				menu.setEntries(midiAccess.midiPortListEntries(onSelect:/2))
			}
		}
	}

}

