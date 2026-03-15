# HelpProgram

A `Type` holding a program from the SPL help files.

Print the reference help programs where the commentary mentions the OEIS but the annotations do not:

~~~spl console
let oeisPrograms = [];
system.helpFilesDo(
	'Reference', '.*', false
) { :helpFile |
	helpFile
	.programs.do { :helpProgram |
		helpProgram
		.annotations
		.includesKey('oeis').ifTrue {
			oeisPrograms.add(helpProgram)
		}
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
		'![](sw/spl/Help/Image/%)'.format([helpProgram.imageFileName]),
		''
	].unlines.postLine
};
nil
~~~

* * *

See also: HelpFile
