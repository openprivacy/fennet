---
layout: blog
title: FOAF meets XRI
date: 2004-07-23 09:28:18.000000000 -04:00
categories:
- blog
permalink: "/blog/2004/07/23/foaf-meets-xri/"
excerpt: "FOAF uses the mbox field as a primary key.  Here's a super-simple FOAF record:\r\n\r\n</p>"
---

FOAF uses the mbox field as a primary key.  Here's a super-simple FOAF record:

</p>
<pre>
&lt;foaf:Person&gt;
  &lt;foaf:name&gt;Fen Labalme&lt;/foaf:name&gt;
  &lt;foaf:mbox rdf:resource="mailto:fen@idcommons.net" /&gt;
  &lt;foaf:nick &gt;fen&lt;/foaf:nick&gt;
  &lt;foaf:workplacehomepage rdf:resource="http://fen.net/" /&gt;
  &lt;foaf:depiction
    rdf:resource="http://www.fen.net/images/fen_200306_114x160.jpg" /&gt;
  &lt;foaf:knows&gt;
    &lt;foaf:Person&gt;
      &lt;foaf:mbox rdf:resource="mailto:owen@idcommons.net" /&gt;
      &lt;foaf:name&gt;Owen Davis&lt;/foaf:name&gt;
    &lt;/foaf:Person&gt;
  &lt;/foaf:knows&gt;
&lt;/foaf:Person&gt;
</pre>

Note that one thing being done to increase security is to us the SHA1 hash of the email address instead of the actual email address, so that connections can still be made without giving away a person's actual email address.  But this is only one level of indirection, as anyone who has a large address book (I have over 1000 mostly technology folk in my Solstice/Equinox list - I'm sure Marc Canter and Joi Ito have many more!) can easily map the SHA1 hashes to actual email addresses.

Other keys can be used by various aggregators and bots, but imagine if instead of putting all this data out publicly, the "mailto:" schema in the mbox field was replaced with "xri:" and pointed to an i-name, access to which was governed by a personal i-broker.  This requires ZERO modification to the FOAF protocol while immediately offering the full capabilities of XRI/XDI, <a href="http://wiki.idcommons.net/moin.cgi/DataBroker">DataBrokers</a> and Link Contracts (which, admittedly, doesn't really exist except in theory, yet).

But it's a compelling story! 

