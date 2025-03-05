# htcp - HTML Template Copy-Paste (engine)

It's as the title suggests: a silly experiment and foray into Perl via the
creation of a dumb tool I actually needed. 

The goal of this script is to create a way to reuse html from elsewhere (e.g.
navbars, headers, footers) without manually copy-pasting. Ideally, I don't
manually copy-paste as a mean of reducing the amount of differences and errors
that are incurred in the long-term.

My main motive here is to avoid sophisticated static-site generators due to how
over-engineered they feel, compared to what I really need (i.e. copying
a html snippet in when I say so).

All it really does is:

1. examine contents of each .html file
2. add line contents to a result copy
3. replace `!template foo.html` lines w/ the snippets from the given file
4. ...
5. That's literally it. It's not very "advanced", nor does it need to be.
