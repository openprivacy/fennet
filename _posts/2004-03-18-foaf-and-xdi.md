---
layout: blog
title: FOAF and XDI
date: 2004-03-18 11:23:10.000000000 -05:00
categories:
- blog
permalink: "/blog/2004/03/18/foaf-and-xdi/"
excerpt: At the <a href="http://identitycommons.net/">Identity Commons</a> we're building
  a persistent global and/or local identity infrastructure using the OASIS standard
  for <a href="http://www.oasis-open.org/committees/tc_home.php?wg_abbrev=xri">Extensible
  Resource Identifiers (XRI)</a>.
---

At the <a href="http://identitycommons.net/">Identity Commons</a> we're building a persistent global and/or local identity infrastructure using the OASIS standard for <a href="http://www.oasis-open.org/committees/tc_home.php?wg_abbrev=xri">Extensible Resource Identifiers (XRI)</a>.  Coupled with <a href="http://www.oasis-open.org/committees/tc_home.php?wg_abbrev=xdi">XRI Data Interchange (XDI)</a> and the powerful <i>link contract</i> mechanism, we are building a system for personal profile control and interchange that rivals FOAF (though once again I have to make the disclaimer that I am no FOAF expert).

Given the tremendous popularity of FOAF, we'll have to "embrace and extend" FOAF with XDI.  The biggest problem with FOAF is that profile sharing is done on a FOAF-file level of granularity, so I'd actually have to have multiple FOAF files if I wanted to share different information with different entities.  Storing all the FOAF info in a database and dynamically creating a specialized (WRT the requester) FOAF file is one way to get around this limitation.  But even then, the requester now has a copy of the file unencumbered by (e.g.) XDI link contracts that could prevent him/her from passing it on or otherwise using it in manners originally unintended.

