# Cryptogram, a little example *game*

## Ruby on Rails and Reference version

This is just a little portfolio project and is in no way meant to be secure.

It is the bare possible minimum to have a stable service that maintains a simple identifier in a GET parameter. If the Cryptogram client does not send a GET parameter or if the parameter is invalid we will generate a new cryptogram and identifier in the response. It is the responsiblity of the client to save the identifier for future requests.

Obviously, to request an entirely new Cryptogram it is sufficient to make the request without an identifier.

The client itself is also a work in progress under this repository.
