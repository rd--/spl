loadSequence([
	'Document/Document.sl',
	'Document/Html.sl',
	'Document/Midi.sl',
	'Document/Navigator.sl',
	'Document/ui.sl',
	'Document/ColumnBrowser.sl',
	'Document/Frame.sl',
	'Document/Menu.sl',
	'Document/SmallHours.sl',
	'Document/SmallKansas.sl'
]).then { :unusedValue |
	workspace::smallKansas := SmallKansas();
	workspace::smallHours := SmallHours();
	workspace::smallHours.loadHelp;
	workspace::smallHours.loadPrograms
}
