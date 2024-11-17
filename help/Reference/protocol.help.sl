# protocol

- _protocol(aUrl)_

Answer a `String` having the protocol, also called the _scheme_, of the `Url`.

```
>>> 'http://cern.ch/'.asUrl.protocol
'http:'
```

Mail, telephone and archive addresses:

```
>>> 'mailto:x@x.x'.asUrl.protocol
'mailto:'

>>> 'tel:+x-xxx-xxx-xxxx'.asUrl.protocol
'tel:'

>>> 'git://x.x/x.git'.asUrl.protocol
'git:'
```

* * *

See also: host, hostName, href, pathName, Location, Url

Categories: Network
