[

	(* Navigator *)
	'Dom'
	'Midi'

	(* SmallKansas *)
	'UserEventTarget'
	'View'
	'SmallKansas'
	'Frame'
	'Menu'
	'TextElement'

	(* SmallKansans *)
	'AnalogueClock'
	'CategoryBrowser'
	'ColourChooser'
	'ColumnBrowser'
	'CrystalLatticeStructureBrowser'
	'CrystalLatticeStructureOracle'
	'DigitalClock'
	'HelpBrowser'
	'Inspector'
	'ListChooser'
	'MethodBrowser'
	'MethodSignatureBrowser'
	'MidiMonitorMenu'
	'MidiPortBrowser'
	'PackageBrowser'
	'PackageIndexBrowser'
	'PngViewer'
	'ProgramBrowser'
	'ProgramOracle'
	'ScalaJiMetaBrowser'
	'ScalaJiTuningBrowser'
	'ScSynthStatus'
	'SvgViewer'
	'SystemBrowser'
	'TableViewer'
	'TextEditor'
	'TraitBrowser'
	'TranscriptViewer'
	'TypeBrowser'
	'WindowMenu'
	'Workspace'

].loadPackageSequence.then {
	system.smallKansas
}
