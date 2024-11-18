# terseGuideSummary

- _terseGuideSummary(aUrl | aString)_

Fetch the terse guide at _aUrl_,
run all of the terse examples,
and print a summary of each section and of the guide altogether.

~~~
let url = 'https://rohandrape.net/sw/spl/help/Terse/Terse Guide.help.sl'.asUrl;
url.terseGuideSummary
~~~


~~~
let text = '/home/rohan/sw/spl/help/Terse/Terse Guide.help.sl'.readTextFile;
text.terseGuideSummary
~~~


* * *

See also: HelpFile, terseReferenceSummary

Guides: Terse Guides

Categories: Help
