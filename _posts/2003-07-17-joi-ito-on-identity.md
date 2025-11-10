---
layout: blog
title: Joi Ito on Identity
date: 2003-07-17 10:02:20.000000000 -04:00
categories:
- blog
permalink: "/blog/2003/07/17/joi-ito-on-identity/"
excerpt: "In a recent <a href=\"http://joi.ito.com/archives/2003/07/16/im_not_joi_ito_thats_just_my_name.html\">
  blog posting</a>, Joi Ito wrote:\r\n\r\n    <blockquote>\r\n\r\nYou don't care if
  my real name is Joi Ito or where I live exactly.  As a blog reader, you probably
  care if it is the same blogger that has posted all of the other blog entries on
  this blog.\r\n\r\n    </blockquote>\r\n\r\nPrecisely - for reputation to accrue
  and be trustable, all you need to know is that it is the same identity/actor as
  the last time."
---

In a recent <a href="http://joi.ito.com/archives/2003/07/16/im_not_joi_ito_thats_just_my_name.html"> blog posting</a>, Joi Ito wrote:

    <blockquote>

You don't care if my real name is Joi Ito or where I live exactly.  As a blog reader, you probably care if it is the same blogger that has posted all of the other blog entries on this blog.

    </blockquote>

Precisely - for reputation to accrue and be trustable, all you need to know is that it is the same identity/actor as the last time.  The ability to make and test such an assertion becomes increasingly important as reputations grow and become themselves a mechanism for choosing what to read, who to trust, etc.  I continue to be amazed that the blogging community doesn't seem to care about it enough to add a field to a newly proposed standard (e.g. <a href="http://www.intertwingly.net/wiki/pie/FrontPage">Echo</a>) to enable a signature on a post (<a href="/archives/000006.html">more on this</a>) though I hope I am wrong.

The identity framework I'm currently working on may not have any strong authentication (beyond names and passwords) in the initial release.  However, the system will support the ability to sign and even encrypt messages, authenticate sources (e.g., assert "same as last time"), make secure introductions, and spawn anonymous child nyms that can, if desired, be later authenticated or left to build their own reputations as independent identities with the privacy-protected parent pulling the invisible strings.

BTW: I've always talked about an orthogonal set of identities to those very practical ones posited by Eric Hughes, namely: my family ID, my work ID, and the ID that I don't tell the others about.

PS: this is my first attempt at at trackback...

