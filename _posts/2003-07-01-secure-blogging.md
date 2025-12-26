---
layout: blog
title: Secure Blogging
date: 2003-07-01 04:53:10.000000000 -04:00
teaser: Given the sorts of "reputation" mechanisms (<a href="http://www.technorati.com/">Technorati</a>,
  etc.) that are springing up in the blogging community, it seems that it would be
  valuable to have the capability for blogs to be signed by a non-spoofable entity
  (person or pseudonym).  Does this capability already exist?  Does RSS have tags
  for (e.g.) a PGP signature guaranteeing content and authorship?
categories:
- identity
---
Given the sorts of "reputation" mechanisms (<a href="http://www.technorati.com/">Technorati</a>, etc.) that are springing up in the blogging community, it seems that it would be valuable to have the capability for blogs to be signed by a non-spoofable entity (person or pseudonym).  Does this capability already exist?  Does RSS have tags for (e.g.) a PGP signature guaranteeing content and authorship?  Even beyond, perhaps blog posts could be encrypted so only authorized entities could read them.

If these features are not available, are they perhaps being included in future developments, e.g. Sam Ruby's <a href="http://www.intertwingly.net/wiki/pie/FrontPage">Echo</a> proposal?  Or is there some reason I am not aware of that makes this useless in the blogging world?

As long as I'm at it (and given that I'm working on a light weight 'nym server for the <a href="http://identitycommons.net/">Identity Commons</a>)...

Another thing that will be of use in a fully open and secure blogging world might include the ability to attach a comment to a blog entry under a spawned pseudonym to protect one's identity (this might require a blog-nym server with a set of mixmaster-like mailing capabilities).  This new blog-nym could remain anonymous or itself gain reputation by making other comments and/or having comments attached to it.  If at some time the owner of this blog-nym wished to claim ownership of it, s/he would be able to.  (On the other hand, if s/he wished to disconnect from it, that would be possible, too, and the blog-nym would perhaps get reaped after a time of inactivity by an automatic process on the blog-nym server.)

<i>
<b>Update: 6/30/2003:</b> I floated my question to a mailing list I belong to, and received a negative response.
</i>

I am surprised.  As we move towards an Identity Commons, one's reputation will become the currency (ala "whuffie" in Cory's <a href="http://search.barnesandnoble.com/booksearch/isbnInquiry.asp?isbn=0765304368&amp;itm=1"> DAOITMK</a>).  PR people feel this today, because it affects their bottom line.  But as it is impossible to indefinitely trust anyone with your personal (profile) information, pseudonyms will become the common way to float pieces of information to determine their worth, as well as to build trusted readerships while maintaining anonymity (ala Publius, the author of the <a href="http://lcweb2.loc.gov/const/fed/abt_fedpapers.html">Federalist Papers</a>).

I would have thought that the bloggers would be all over this.  The security and privacy capabilities of <a href="http://www.oasis-open.org/committees/tc_home.php?wg_abbrev=security"> SAML</a>, available to individuals and their nyms (as opposed to simply between e.g. <a href="http://www.projectliberty.org/">Liberty</a> servers) is what the next step of communications and publishing protocols ought to provide.
