# helpFilesDo

- _helpFilesDo(aSystem, kind, pattern, aBlock:/1)_

Evaluate _aBlock_ at each `HelpFile` of _kind_ where the `pathBasename` matches _pattern_.

Print the _reference_ help files with an empty categories field:

~~~spl console
system.helpFilesDo('Reference', '.*') { :each |
	each.categories.isEmpty.ifTrue {
		each.name.postLine
	}
};
nil
~~~

* * *

See also: HelpFile, splDirectory, splFileName
