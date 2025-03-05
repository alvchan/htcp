# htcp - HTML Template Copy-Paste (engine)

It's as the title suggests: a silly experiment and foray into Perl via the
creation of a dumb tool I actually needed. 

The goal of this script is to create a way to reuse html from elsewhere (e.g.
navbars, headers, footers) without manually copy-pasting. I fear that manual
copying may lead to the common html snippets to diverge across pages, which
would be catastrophic in the long-term. Ideally, I don't manually copy-paste;
we can automate after all!

My main motive here is to avoid sophisticated static-site generators due to how
over-engineered they feel, compared to what I really need (i.e. copying
a html snippet in when I say so).

All it really does is:

1. examine contents of each .html file
2. add line contents to a result copy
3. replace `!template foo.html` lines w/ the snippets from the given file
4. ...
5. That's literally it. It's not very "advanced", nor does it need to be.
