# helpProgramsDo

- _helpPrograms(system, f:/1)_

Iterate over all of the `HelpProgram` values in the system.

Print the help programs where the commentary mentions the OEIS,
but the annotations do not:

~~~spl console
system.helpProgramsDo { :p |
	p.commentary.includesSubstring(
		'oeis.org'
	).ifTrue {
		p.annotations.includesKey(
			'oeis'
		).ifFalse {
			[
				p.topic,
				p.annotations
			].postLine
		}
	}
};
nil
~~~

Print the help programs where the annotations mentions the OEIS,
and the commentary begins with 'Plot':

~~~spl console
system.helpProgramsDo { :p |
	p.annotations.includesKey(
		'oeis'
	).ifTrue {
		p.commentary.beginsWith(
			'Plot'
		).ifTrue {
			[
				p.topic,
				p.annotations
			].postLine
		}
	}
};
nil
~~~

Print the help programs where commentary does not end with a colon:

~~~spl console
system.helpProgramsDo { :p |
	p.commentary.endsWith(
		':'
	).ifFalse {
		[
			p.topic,
			p.annotations
		].postLine
	}
};
nil
~~~

* * *

See also: helpFilesDo, HelpProgram

Guides: Help Files, Help Functions, System Functions
