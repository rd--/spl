[

(*
	'Collection-Map'
	'Collection-Set'
	'Geometry-Point'
	'Geometry-Rectangle'
	'System-Blob'
	'System-Method'
	'System-Type'
	'System-Window'
*)

	'Navigator-Dom'
	'Navigator-Midi'

	'SmallKansas-UserEventTarget'
	'SmallKansas-View'
	'SmallKansas-SmallKansas'
	'SmallKansas-Frame'
	'SmallKansas-Menu'
	'SmallKansas-Text'

	'SmallKansas-AnalogueClock'
	'SmallKansas-CategoryBrowser'
	'SmallKansas-ColourChooser'
	'SmallKansas-ColumnBrowser'
	'SmallKansas-CrystalLatticeStructureBrowser'
	'SmallKansas-CrystalLatticeStructureOracle'
	'SmallKansas-DigitalClock'
	'SmallKansas-HelpBrowser'
	'SmallKansas-Inspector'
	'SmallKansas-ListChooser'
	'SmallKansas-MethodBrowser'
	'SmallKansas-MethodSignatureBrowser'
	'SmallKansas-MidiMonitorMenu'
	'SmallKansas-MidiPortBrowser'
	'SmallKansas-PackageBrowser'
	'SmallKansas-PngViewer'
	'SmallKansas-ProgramBrowser'
	'SmallKansas-ProgramOracle'
	'SmallKansas-ScalaJiMetaBrowser'
	'SmallKansas-ScalaJiTuningBrowser'
	'SmallKansas-ScSynthStatus'
	'SmallKansas-SvgViewer'
	'SmallKansas-SystemBrowser'
	'SmallKansas-TableViewer'
	'SmallKansas-TextEditor'
	'SmallKansas-TraitBrowser'
	'SmallKansas-TranscriptViewer'
	'SmallKansas-TypeBrowser'
	'SmallKansas-WindowMenu'
	'SmallKansas-Workspace'

].collect(Package:/1).loadPackages.then {
	system.smallKansas
}
