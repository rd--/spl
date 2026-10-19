# terseGuideSummary

- _terseGuideSummary(x)_

At `Url`,
fetch the terse guide at _x_,
run all of the terse examples,
and print a summary of each section and of the guide altogether.

Run terse guide:

~~~spl console
system
.splFileName('Help/Terse/Terse Guide.help.sl')
.fileUrl
.terseGuideSummary
~~~

Run terse guide to sound:

~~~spl console
system
.splFileName('Help/Terse/Terse Guide to Sound.help.sl')
.fileUrl
.terseGuideSummary
~~~

At `String`,
run all of the terse examples in _x_,
and print a summary of each section and of the guide altogether.

Run terse guide to SuperCollider:

~~~spl console
'Help/Terse/Terse Guide to SuperCollider.help.sl'
.splFilePath
.readTextFile
.terseGuideSummary
~~~

* * *

See also: HelpFile, terseReferenceSummary

Guides: Help Functions

Categories: Help
