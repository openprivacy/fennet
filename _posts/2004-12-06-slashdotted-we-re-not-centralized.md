---
layout: blog
title: Slashdotted (We're not centralized!)
date: 2004-12-06 20:03:11.000000000 -05:00
teaser: |-
  Wow - we just got <a href="http://slashdot.org/article.pl?sid=04/12/01/1442236">Slashdotted</a>!  (And our servers seem to have withstood a sustained load over six times what their previous peak had been - whew!)  Anyway, it seems clear that our messaging around how we work has got some holes in it...

  First, it appears many people think that this is a centralized system.  Actually, i-brokers, which are based on the open OASIS XRI, XDI and SAML standards, are not centralized.
categories:
- identity
---
Wow - we just got <a href="http://slashdot.org/article.pl?sid=04/12/01/1442236">Slashdotted</a>!  (And our servers seem to have withstood a sustained load over six times what their previous peak had been - whew!)  Anyway, it seems clear that our messaging around how we work has got some holes in it...

First, it appears many people think that this is a centralized system.  Actually, i-brokers, which are based on the open OASIS XRI, XDI and SAML standards, are not centralized.  Well, they are <i>now</i> only because there is just one of them, but we have a project underway to package our code for release - under the dual GPL/BSD license - by the end of the year.  At that point in time <i>anyone</i> can be an i-broker.  As our <a href="http://blog.fen.net/archives/000029.html">business model</a> is based on us being trustable (as people can easily move to any other i-broker if ours loses favor) it'll simply have to be so - and provide an excellent set of services that cause people to stay with us.

Also, the fact that there is only one global i-broker may lead to some misunderstandings.  While it is true that there are only two (primary) global namespaces - rooted in the '=' (personal) and '@' (organizational) <i>global context symbols</i> - there are two other types of namespaces that open the system wide open.  Community i-names, usually rooted with an organizational '@-name', allow each community to create its own local namespace.  For example, I'm "broadcatch" in the <i>Slashdot</i> namespace.  Every community can create as many local namespaces as it wants to - for free!

The other primary global namespace, which opens things even wider, is the concept of rooting a namespace on an XRI <i>cross reference</i>.  This will allow roots based on cryptographic public keys, among other things, and will be ideal in peer-to-peer systems as a vehicle for creating truly decentralized i-names.

Finally, besides the fact that i-name users have <i>i-name portability</i> that enables easy movement between i-brokers, the data that the i-broker manages for them can reside <i>anywhere</i> - including on their personal systems.  There is no requirement that the data be stored at the i-broker - in fact, a basic i-broker has no mechanism for such data storage!

More later...
