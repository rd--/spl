[

	(* Navigator *)
	'Dom'
	'Midi'

	(* SmallKansas *)
	'UserEventTarget'
	'View'
	'SmallKansas'
	'ColumnBrowser'
	'Frame'
	'ListChooser'
	'Menu'
	'TextEditor'
	'TextElement'

	(* SmallKansans *)
	'AnalogueClock'
	'CategoryBrowser'
	'ColourChooser'
	'CrystalLatticeStructureBrowser'
	'CrystalLatticeStructureOracle'
	'DigitalClock'
	'HelpBrowser'
	'HelpViewer'
	'Inspector'
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
	'TraitBrowser'
	'TranscriptViewer'
	'TypeBrowser'
	'WindowMenu'
	'Workspace'

].primitiveLoadPackageSequence.then {
	system.smallKansas
}
