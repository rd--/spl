loadSequence([
	'Document/Document.sl',
	'Document/Html.sl',
	'Document/Midi.sl',
	'Document/Navigator.sl',
	'Document/ui.sl',
	'Document/Frame.sl', (* @View *)
	'Document/ColumnBrowser.sl',
	'Document/Menu.sl',
	'Document/SmallHours.sl',
	'Document/SmallKansas.sl',
	'Document/TextEditor.sl'
]).then { :unusedValue |
	workspace::smallKansas := SmallKansas();
	workspace::smallHours := SmallHours();
	workspace::smallHours.loadHelpIndex;
	workspace::smallHours.loadProgramIndex
}
