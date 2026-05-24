---
layout: blog
title: Vocabulary
date: 2003-06-13 06:55:12.000000000 -04:00
teaser: <p>Tasked with designing a simple identity framework for the <a href="http://asn.planetwork.net/">Augmented
  Social Network</a>, a good place to start is a shared basic vocabulary.</p>
categories:
- identity
permalink: "/blog/2003/06/13/vocabulary/"
drupal_nid: 3
---
<p>Tasked with designing a simple identity framework for the <a href="http://asn.planetwork.net/">Augmented Social Network</a>, a good place to start is a shared basic vocabulary.</p><ul><li>(optionally signed) information about an identity (tech speak: <tt>P&nbsp;:=&nbsp;[[Abstract_URI,&nbsp;Key,&nbsp;Value]&nbsp;Sig]</tt>) <i>note that Key and Value can be defined within a (community) namespace</i></li><li>profile objects are entities and can be named (tech speak: profile objects are first class objects)</li><li>profile objects can have access rights attached to them</li></ul><dl><dt>ENTITY</dt><dd>any object (person, thing, profile, reputation, etc.)</dd><dt>IDENTITY</dt><dd>a unique and persistent (within a community) name for an entity</dd><dt>PROFILE OBJECT</dt><dt>PROFILE</dt><dd>a collection of profile objects created by, or about, an identity</dd><dt>REPUTATION</dt><dd>a usually domain (key) specific (and nearly always fuzzy) calculation of an identity's reputation or standing (usually within a community)</dd><dt>CERTIFICATION</dt><dd>a signed authentication by a trusted (reputable) third party</dd></dl><p>Thus, these all may make up part of my profile:</p><table border="1"><tbody><tr><td align="right">Fen says:</td><td>Fen co-founded OpenPrivacy</td></tr><tr><td align="right">Fen says:</td><td>Owen is a good networker</td></tr><tr></tr><tr><td align="right">Owen says:</td><td>Fen is passionate about reputations and privacy</td></tr></tbody></table><p>Reputations are often calculated within a domain such that transitive trust issues can be more easily resolved, e.g., a process calculating Owen's reputation as a networker may tap into Fen's profile during its lifetime.</p>
