# protocol

- _protocol(u)_

Answer a `String` having the protocol,
also called the scheme,
of the `Url` _u_.

```
>>> Url'http://cern.ch/'.protocol
'http:'
```

Mail, telephone and archive addresses:

```
>>> Url'mailto:x@x.x'.protocol
'mailto:'

>>> Url'tel:+x-xxx-xxx-xxxx'.protocol
'tel:'

>>> Url'git://x.x/x.git'.protocol
'git:'
```

* * *

See also: host, hostName, href, pathName, Location, Url

Guides: Network Functions

Categories: Network
