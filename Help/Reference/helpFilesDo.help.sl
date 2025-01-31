# helpFilesDo

- _helpFilesDo(aSystem, kind, aBlock:/1)_

Evaluate _aBlock_ at each `HelpFile` of _kind_.

Print the _reference_ help files with an empty categories field:

~~~spl program=Text
system.helpFilesDo('Reference') { :each |
	each.categories.isEmpty.ifTrue {
		each.name.postLine
	}
};
nil
~~~

* * *

See also: HelpFile, splDirectory, splFile
