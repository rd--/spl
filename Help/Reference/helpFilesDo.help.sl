# helpFilesDo

- _helpFilesDo(system, k, r, verbose, f:/1)_

Evaluate the block _f_ at each `HelpFile`,
of kind _k_,
where the `pathBasename` matches the regular expression _r_.

Print the reference help files with an empty guides field:

~~~spl console
system.helpFilesDo('Reference', '.*', false) { :each |
	each.guides.isEmpty.ifTrue {
		each.name.postLine
	}
};
nil
~~~

* * *

See also: HelpFile, splDirectory, splFileName

Guides: Help Files, System Functions
