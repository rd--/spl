# terseGuideSummary

- _terseGuideSummary(x)_

At `Url`,
fetch the terse guide at _x_,
run all of the terse examples,
and print a summary of each section and of the guide altogether.

~~~spl console
system
.splFileName('Help/Terse/Terse Guide.help.sl')
.asFileUrl
.terseGuideSummary
~~~

At `String`,
run all of the terse examples in _x_,
and print a summary of each section and of the guide altogether.

~~~spl console
system
.splFileName('Help/Terse/Terse Guide to SuperCollider.help.sl')
.readTextFile
.terseGuideSummary
~~~

* * *

See also: HelpFile, terseReferenceSummary

Guides: Help Functions

Categories: Help
