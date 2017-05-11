When we update lists served by shavar, we need to follow some guidelines,
so we don't break the internet for Firefox.

When reviewing pull requests to this repo, look out for:

* Large, unexpected, and/or obviously-wrong additions/deletions. E.g., if half
of the list gets deleted, google.com is added, etc.

* Obvious syntax mistakes. E.g., example..com/

* Domains missing a trailing '/'. E.g., example.com/ not example.com
