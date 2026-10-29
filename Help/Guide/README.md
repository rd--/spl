# Help/Guide

Run documentation tests:

~~~spl
{ 'Help/Guide'.splFilePath.terseReferenceSummary((verboseLevel: 0, pattern: '.*')) }.timing
~~~

Total => 1,006 (6 seconds)

Write image files:

~~~spl
{ system.helpFilesDo('Guide', '.*', 1, writeImageFiles/1) }.timing
~~~

Update indices:

- Integer Sequence Index
- Integer Sequence Method List

Lint files:

~~~sh
$ (cd ~/sw/spl/Help/Guide; make lint)
~~~

Linting: 298 file(s)
