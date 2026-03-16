# helpFragmentPreprocessor

- _helpFragmentPreprocessor(s)_

Run the help fragment pre-processor on the string _s_.

```
>> '<<<baumSweetSequence,svg,B'
>> .helpFragmentPreprocessor
The Baum–Sweet sequence,
OEIS [A086747](https://oeis.org/A086747):

~~~
115.baumSweetSequence.discretePlot
~~~

![](sw/spl/Help/Image/baumSweetSequence-B.svg)
```

The method `helpFilePreprocessor` reads a help file specified by a topic,
with a '.help.pre' suffix,
and applies the help fragment pre-processor to write the answer,
to a file with the usual '.help.sl' suffix.

* * *

See also: splHelpFragment

Guides: Help Functions
