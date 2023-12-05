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
				| byteArray = midiMessageEvent.data; |
				messages.add(midiMessageEvent);
				(* Temporary: write Cc data to Sc known buses *)
				(
					byteArray.size = 3 & {
						byteArray[1] = 176
					}
				).ifTrue {
					system.scSynth.setControl(11000 + byteArray[2], byteArray[3] / 127)
				};
				textEditor.setEditorText(messages.last(25.min(messages.size)).collect { :midi |
					midi.data.asString
				}.unlines)
			},
			frame = self.addFrame(textEditor, event)
		)|
		textEditor.editable := false;
		midiPort.addEventListener('midimessage', onMidiMessage:/1);
		frame.addEventListener('close') { :unusedEvent |
			midiPort.removeEventListener('midimessage', onMidiMessage:/1)
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

