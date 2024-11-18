# Network Functions

_Accessing_:

- `fileName`: file name of the path component of a Url
- `fragment`: fragment, or hash, component of a Url
- `host`: host subcomponent of a Url
- `hostName`: name of host component of a Url
- `href`: string of entire Url
- `pathName`: name of path component of a Url
- `port`: port of host component of a Url
- `protocol`: procotol, or scheme, component of a Url
- `query`: query, or search, component of a Url
- `queryParameters`: query component as UrlQueryParameters value
- `userName`: user name of the authority component of a Url

_Converting_:

- `asUrl`: construct a Url
- `asUrlQueryParameters`: construct a UrlQueryParameters

_Encoding & Decoding_:

- `decodeUri`: the Uri decoded form of a string
- `encodeUri`: the Uri encoded form of a string

_Fetching_:

- `fetch`: fetch a resource from the network
- `fetchText`: fetch a text resource from the network
- `fetchJson`: fetch a Json resource from the network
- `fetchByteArray`: fetch a binary resource from the network

_Types & Traits_:

- `Location`: the location of an object
- `Request`: a resource request
- `Response`: the promised answer of a fetch
- `Url`: a uniform resource locator
- `UrlQueryParameters`: url query parameters

* * *

Guides: File Functions, System Functions
