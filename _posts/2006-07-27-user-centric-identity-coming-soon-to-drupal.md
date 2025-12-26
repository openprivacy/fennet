---
layout: blog
title: User-Centric Identity coming soon to Drupal
date: 2006-07-27 12:51:08.000000000 -04:00
teaser: When you log into a community site, say LinkedIn or Tribe, you provide them
  with information about you which they now control.
categories:
- identity
---
When you log into a community site, say LinkedIn or Tribe, you provide them with information about you which they now control.  This is unfortunate because 1) if you want to log into another site, you have to enter similar information again (if you belong to more than one social networking site, you know what I mean!) and 2) if (say) your email address changes, you've got to go and change it at every place you gave it to, or else risk missing the messages that you signed up for (which is bad for both parties!).

<em>User-centric identity</em> enables you to be the master of your online digital identity.  Once you have that control, the tables turn and instead of giving other sites your data (which can rapidly become obsolete) you instead give them permission to access certain parts of your personally maintained data.  As long as you give them access to e.g. your email address, any time that you change it (in just one place) all the sites that have "subscribed" to your email address will get updated.  Further, as you build depth as (say) LinkedIn and later want to bring some of your "reputation" over to Tribe, it's as easy as giving them the right to view whatever portions of your "profile" you choose.  And in case you're wondering, there are some simple procedures, a developing set of "identity rights agreements" (similar in concept to the Creative Commons copyrights) and some fancy mathematical proofs that enable you to protect your privacy and security while doing all this - far better than it is protected now by all those sites storing it "for you".

But I said above "coming soon to Drupal" and what I really meant was "coming soon to a community near you," and Drupal just happens to be one of the more common community building tools.  A recent announcement from <a href="http://openid.net/">OpenID</a> caught my eye:

From <a href="http://iwantmyopenid.org/bounty">http://iwantmyopenid.org/bounty</a> (<a href="http://digg.com/software/OpenID_Code_Bounty">Digg it</a>):

<blockquote>
In an effort to raise the awareness and increase adoption of OpenID, we are proud to announce the OpenID Code Bounty.

$5,000 USD will be donated to the first ten software projects that meet the requirements of the bounty program. Currently the OpenID Code Bounty is being sponsored by VeriSign, JanRain, Cordance, ooTao, Four Kitchen Studios, Zooomr, claimID, NetMesh, Opinity, Six Apart, Sxip, Zp3, and the International Webmasters Association.
</blockquote>

OpenID already uses XRI for discovery; the next step is to get the input form to accept either an OpenID URL or an XRI-based i-name.  Turns out that <a href="http://openid.net/specs/openid-authentication-2_0-05.html#anchor47">appendix C-1</a> of <a href="http://openid.net/specs/openid-authentication-2_0-05.html">OpenID Authentication 2.0 - Draft 5</a> says that is will do exactly that, and the good folk at <a href="http://www.openidenabled.com/">JanRain</a> are already working on it.  Once there's an 2.0-enabled <a href="http://www.openidenabled.com/software/drupal">OpenID Drupal module</a> you can bet I'll be incorporating it into <a href="http://www.civicactions.com/">CivicActions</a> sites wherever possible.
