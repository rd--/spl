# helpFilesDo

- _helpFilesDo(system, k, r, v=0, f/1)_

Evaluate the block _f_ at each `HelpFile`,
of kind _k_,
where the `pathBaseName` matches the regular expression _r_.
_v_ is the level of verboseness.
Answers `nil`.

Write image files for reference help files:

~~~spl console
system.helpFilesDo(
	'Reference',
	'.*',
	0,
	writeImageFiles/1
)
~~~

Write image files for guide help files:

~~~spl console
system.helpFilesDo(
	'Guide',
	'.*',
	0,
	writeImageFiles/1
)
~~~

Print the names of reference help files that have an invalid image sequence:

~~~spl console
system.helpFilesDo(
	'Reference', '.*', 0
) { :each |
	each.hasValidImageSequence.ifFalse {
		each.name.printLine
	}
}
~~~

Print the names of reference help files with an empty guides field:

~~~spl console
system.helpFilesDo(
	'Reference', '.*', 0
) { :each |
	each.guides.isEmpty.ifTrue {
		each.name.printLine
	}
}
~~~

Print the names of reference help files with code blocks,
with the an _spl_ attribute
(the documentation test code blocks ordinarily contain blank lines),
that contain one or more blank lines:

~~~spl console
system.helpFilesDo(
	'Reference', '.*', 0
) { :h |
	h.codeBlocksWithKey('spl').do { :c |
		c['contents']
		.includesSubstring('\n\n').ifTrue {
			[
				h.name,
				c['attributes']
			].printLine
		}
	}
}
~~~

Print the names of help files that have unspecified code blocks:

~~~spl console
system.helpFilesDo(
	'Reference', '.*', 0
) { :h |
	h.unspecifiedCodeBlocks.isEmpty.ifFalse {
		h.name.printLine
	}
}
~~~

* * *

See also: HelpFile, splDirectory, splFileName

Guides: Help Files, Help Functions, System Functions
