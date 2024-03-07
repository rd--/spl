[

	{- Navigator -}
	'Dom'
	'Midi'
	'Svg'

	{- SmallKansas -}
	'UserEventTarget'
	'View'
	'SmallKansas'
	'ColumnBrowser'
	'Frame'
	'ListChooser'
	'Menu'
	'TextEditor'
	'TextElement'

	{- SmallKansans -}
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
	'Notebook'
	'PackageBrowser'
	'PackageIndexBrowser'
	'PngViewer'
	'ScProgramBrowser'
	'ScProgramOracle'
	'ScSynthStatusMonitor'
	'ScalaJiMetaBrowser'
	'ScalaJiTuningBrowser'
	'ScalaScaleBrowser'
	'SvgViewer'
	'SystemBrowser'
	'TableViewer'
	'TraitBrowser'
	'TranscriptViewer'
	'TypeBrowser'
	'WindowMenu'
	'Workspace'
	'WorldMenu'
].primitiveLoadPackageSequence.then { :unused |
	system.smallKansas
}
