---
layout: blog
title: Don't forget Reputation
date: 2007-02-21 14:02:59.000000000 -05:00
categories:
- blog
permalink: "/blog/2007/02/21/don-t-forget-reputation/"
excerpt: 'Many of us celebrated when it was announced that <a href="http://yro.slashdot.org/article.pl?sid=07/02/18/2033235">AOL
  has embraced OpenID</a>.  Does that bring us any closer to the goal of secure, privacy
  protected user-centric digital identity that empowers users, leveling the playing
  field between them and service providers to the great benefit of both?  (OK, that''s
  my goal, but maybe some of you may share it.)  I say: no.'
---

Many of us celebrated when it was announced that <a href="http://yro.slashdot.org/article.pl?sid=07/02/18/2033235">AOL has embraced OpenID</a>.  Does that bring us any closer to the goal of secure, privacy protected user-centric digital identity that empowers users, leveling the playing field between them and service providers to the great benefit of both?  (OK, that's my goal, but maybe some of you may share it.)  I say: no.  In fact, it can and may have just the opposite effect, providing false security and tarnishing the concept of single sign-on (SSO) throughout the, uh, blogosphere.

What's missing is the key element that the <a href="http://wiki.idcommons.net/">Identity Commons</a> was originally created to foster: <i>community</i>.  If I may get metaphysical for a moment, trust starts by knowing yourself, and then extends tenuously outwards from the mind/heart/spirit to those around us that we feel we <i>know</i> and <i>connect</i> with at some level, in some set context.  Let me ask you: does adding 30 million people into your community make you feel all warm and fuzzy?

With the introduction of OpenID/i-name authentication into more community networks/web sites, reputation (and the associated themes of trust, accountability and privacy) is quickly being seen as an important factor in any healthy online ecosystem.  It is especially critical when people can join a community anonymously (note that a working email address alone does not provide any useful measure of accountability - see e.g.  <a href="http://en.wikipedia.org/wiki/Mailinator">Mailinator</a>).  A network devoid of accountability is of limited - if any - usefulness, for when spammers and trolls can share equal footing with responsible netizens, trust and the all-important feeling of safety and security that a healthy community provides is lost.  Further, as the value of reputation grows, people will find it important to protect and grow their reputation, as it will become increasingly common to ignore comments by people with little or no reputation - after all, they could be spam-bots.

So how do you begin to trust people you may never meet?  This is a much researched and fairly well understood property of <a href="http://en.wikipedia.org/wiki/Social_network"><i>social networks</i></a> - that you can grow to <i>trust</i> the wisdom posted by Bob simply by the history of his (assuming Bob is a "he") postings in a particular forum.  Thus, Bob earns a certain respect, or <i>reputation</i>, within the community.  As the community grows, reputation can diffuse; but too small a community can appear as a conspiracy and also not be trusted.  But if one has a <i>normal</i> amount of reputation and is also to be found in multiple communities, this is another way reputation can grow.

With the introduction of OpenID, small communities (such as those I work with at <a href="http://www.civicactions.com/">CivicActions</a>) will be able to provide a basic (perhaps "default" may be more accurate) reputation (or rating) service enforced by their society contracts.  In our case, we can additionally provide a strong foundation for inter-community reputation growth and management since we foster the growth of several communities a month and have intimate knowledge of how the community sites are constructed (we build 'em!).

<b>Some Technical Details</b>

To support inter-community SSO, we will create and maintain a centralized, secure repository of user information (a "profile store") that contains e.g. user names and email addresses.  (This is separate from the authenticating I-Broker (or OpenID Provider) that can authorize access to the profile information under user control.  And while the <a href="http://en.wikipedia.org/wiki/XRI">XRI</a> technology underlying i-names supports distributed identity and data-brokers with encrypted data stores, these won't exist in the initial release.)  The profile store will also manage data contracts (or "<a href="http://www.windley.com/essays/2006/identity_rights_agreements">Identity Rights Agreements</a>" (IRA)) that client sites (AKA "Service Providers") will electronically sign in exchange for profile data (such as an email address).  A simple IRA for access to a user's email address might include clauses like:

<blockquote>
We agree to:
<ol>
  <li>never sell, rent, trade or otherwise make available your email address to other parties that you have not explicitly agreed to;</li>
  <li>refresh our cached copy of your email address from the profile store before use, thus ensuring that we always contact you at your current and correct address;</li>
  <li>remove your email address from our servers should you request this (perhaps as part of leaving our community);</li>
  <li>...</li>
</ol>
</blockquote>

Since the profile manager (and community I-Broker) are both maintained by CivicActions, and since we will be hard-coding the IRAs and profile sharing protocols, we will be a de facto reputation server as well.  Over time, we will implement identity and data portability as permitted by the XRI protocol standards.  We'll do this not only because we are committed to zero lock-in and want to enable our clients and their constituents to move freely, but also because it makes sound business sense to allow the free flow of people and their ideas in - and out - of any space, thus empowering each and everyone to find their spot where they can shine.

<b>Back to Reputation</b>

As peer-to-peer OpenID authentication will enable Single Sign-on (SSO), there will be a much lower barrier to entry (and exit) to (from) our client sites.  This will enhance the vitality of each community by enabling members to more easily find where they feel most connected and useful while not being concerned about (re-)joining, who has access to their email address, etc.  Yet the use of a single identity across multiple communities will enhance each user's ability to gain reputation and trust in others that have gained reputation.

The value of CivicActions reputation will have additional use/importance as we start to provide/consume reputation metrics to/from outside communities that we develop peering (trust) relationships with.  Note that no centralized or globally defined namespaces are needed - that can all be done the same way we've always done it - personal and group-mediated introductions at the grassroots.  By providing a sound basis for building trust and accountability, our reputation service can empower a global community that shares our values and helps (us and our clients) move the world forward.

