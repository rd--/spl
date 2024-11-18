# terseGuideSummary

- _terseGuideSummary(aUrl | aString)_

At `Url`,
fetch the terse guide at _aUrl_,
run all of the terse examples,
and print a summary of each section and of the guide altogether.

~~~
let url = 'https://rohandrape.net/sw/spl/help/Terse/Terse Guide.help.sl'.asUrl;
url.terseGuideSummary
~~~

At `String`,
run all of the terse examples in _aString_,
and print a summary of each section and of the guide altogether.

~~~
let text = '/home/rohan/sw/spl/help/Terse/Terse Guide.help.sl'.readTextFile;
text.terseGuideSummary
~~~

* * *

See also: HelpFile, terseReferenceSummary

Guides: Terse Guides

Categories: Help
