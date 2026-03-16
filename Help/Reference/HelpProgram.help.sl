# HelpProgram

A `Type` holding a program from the SPL help files.

Print the `Integer Sequence Image Index`:

~~~spl console
let oeisPrograms = [];
system.helpProgramsDo { :helpProgram |
	helpProgram
	.annotations
	.includesKey('oeis').ifTrue {
		oeisPrograms.add(helpProgram)
	}
};
oeisPrograms.sortOn { :helpProgram |
	helpProgram.annotations.at('oeis')
};
oeisPrograms.do { :helpProgram |
	let annotations = helpProgram.annotations;
	[
		helpProgram.commentary,
		'',
		helpProgram.fencedCodeBlock,
		'',
		'![](sw/spl/Help/Image/%)'.format(
			[
				helpProgram.imageFileName
			]
		),
		''
	].unlines.postLine
};
nil
~~~

* * *

See also: HelpFile
