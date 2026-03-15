# helpFilesDo

- _helpFilesDo(system, k, r, verbose, f:/1)_

Evaluate the block _f_ at each `HelpFile`,
of kind _k_,
where the `pathBasename` matches the regular expression _r_.

Print the reference help files with an empty guides field:

~~~spl console
system.helpFilesDo(
	'Reference', '.*', false
) { :each |
	each.guides.isEmpty.ifTrue {
		each.name.postLine
	}
};
nil
~~~

Print the reference help programs where the commentary mentions the OEIS but the annotations do not:

~~~spl console
system.helpFilesDo(
	'Reference', '.*', false
) { :helpFile |
	helpFile
	.programs.do { :helpProgram |
		helpProgram
		.commentary
		.includesSubstring('oeis.org').ifTrue {
			helpProgram
			.annotations
			.includesKey('oeis').ifFalse {
				[
					helpProgram.topic,
					helpProgram.annotations
				].postLine
			}
		}
	}
};
nil
~~~

Print the reference help programs where the annotations mentions the OEIS and the commentary begins with 'Plot':

~~~spl console
system.helpFilesDo(
	'Reference', '.*', false
) { :helpFile |
	helpFile
	.programs.do { :helpProgram |
		helpProgram
		.annotations
		.includesKey('oeis').ifTrue {
			helpProgram
			.commentary
			.beginsWith('Plot').ifTrue {
				[
					helpProgram.topic,
					helpProgram.annotations
				].postLine
			}
		}
	}
};
nil
~~~

* * *

See also: HelpFile, splDirectory, splFileName

Guides: Help Files, Help Functions, System Functions
