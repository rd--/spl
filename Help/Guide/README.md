# Help/Guide

Run documentation tests:

~~~spl
'Help/Guide'.splFilePath.terseReferenceSummary((verbose: false, pattern: '.*'))
~~~

Total => 1,006

Write image files:

~~~spl
system.helpFilesDo('Guide', '.*', true, writeImageFiles/1)
~~~

Update indices:

- Integer Sequence Index
- Integer Sequence Method List

Lint files:

~~~sh
$ (cd ~/sw/spl/Help/Guide; make lint)
~~~

Linting: 295 file(s)
