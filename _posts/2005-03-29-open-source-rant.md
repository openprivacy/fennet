---
layout: blog
title: Open source rant
date: 2005-03-29 12:09:12.000000000 -05:00
teaser: "The following is a rant on Open Source vs. Free Software, with Java as the
  protagonist.  While I am pragmatic and appreciate what Java offers (fast development,
  powerful tools, strong support) I have also voiced at times my concerns over its
  use, particularly within the non-profit and NGO markets that we have been looking
  at pursuing.\r\n\r"
categories:
- foss
---
The following is a rant on Open Source vs. Free Software, with Java as the protagonist.  While I am pragmatic and appreciate what Java offers (fast development, powerful tools, strong support) I have also voiced at times my concerns over its use, particularly within the non-profit and NGO markets that we have been looking at pursuing.

There are many sides to the issue, and I don't really want this to become a long thread with arguments and counter-arguments - find those on any open source and/or free software developers forum.  But as it is a difficult topic to understand, I found <a href="http://software.newsforge.com/article.pl?sid=05/03/22/204244">this article</a> [Newsforge] provides a fair overview of a particular scenario, and decided to share it with the goal of shedding some more light upon a subtle yet important issue.

OpenOffice is the premier open source alternative to Microsoft Office - it's what I use to open and read the .doc and .ppt files that occasionally flow through the IdCommons mailing lists.  The much anticipated version 2.0 is nearing, but not without controversy, as the new version has certain dependencies on Java, a non-free language.

The well-balanced article more or less concludes that the choice to use Java is largely a matter or pragmatism (the open source advocates) vs. philosophy (the free software supporters).  But as some of the comments suggest - and I must say I agree with - it's important to stick to your philosophy if you want to create a superior product.

An example in the XDI world might be if we made an architectural decision that, while you have total control over your own data, so does XDI.org, and you can trust XDI.org, right?  Today, the answer might be yes, but over time and political pressures, the once pragmatic architectural decision may lead to the destruction of the trust that Identity Commons depends upon.  That's why we are committed to the philosophy that <i>you own your own data</i>.

To date, my company, 2idi, has used only free and open source software (LAMP) for its i-broker development.  (There is an exception: our connection to the global registry currently uses a Java library, but only a tiny percentage of i-brokers will be global registrars and need this code, and there is a C++ library available, too.)  Nonetheless, I'm comfortable that several XRI and XDI developers are currently using Java, as they are doing great work that is portable, has language-independent APIs, and is extending the state of the art.    I look forward to incorporating these new code contributions, no matter what language they are written in, as long as the copyright is given to Identity Commons so that they can license is as GPL/BSD, or in some cases Apache 2.0.  This will support the growing community and enable us, should the time come that such is necessary, to rewrite the code in a free language.  In the mean time, we will be able to enjoy the benefits of a rapidly expanding code base.

If you'd like some more points of view, here's the <a href="http://developers.slashdot.org/developers/05/03/28/2218246.shtml
">Slashdot commentary</a>.

<a href="http://public.xdi.org/=Fen">=Fen</a>
