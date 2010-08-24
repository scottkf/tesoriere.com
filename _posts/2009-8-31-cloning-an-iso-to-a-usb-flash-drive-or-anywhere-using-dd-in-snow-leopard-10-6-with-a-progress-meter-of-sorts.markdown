--- 
layout: post
title: Cloning an ISO to a USB flash drive (or anywhere) using DD in Snow Leopard 10.6 with a progress-ish meter
syntax-highlighting: yes
tags: 
- dd
- snow leopard
- leopard
- terminal
- unix
---
Oh, and Leopard too. 

What a title. I recently needed to use G-Parted, but didn't have any blank disc's laying around, and the method they describe on the [gparted wiki][2] to do this with a USB disk doesn't work on OSX. So, I used [DD][3].

Open up terminal (from Applications/Utilities or use Spotlight) and type what follows *substituting as necessary*. My USB device was located at /dev/disk3. You can find the device name in Disk Utility by right-clicking on the device, and choosing 'information'. 

<b>THIS WILL OVERWRITE WHATEVER'S ON THE DISK</b>.

{% highlight bash %}
sudo dd if=/path/to/iso.iso.dmg.img of=/dev/disk3 bs=1024
{% endhighlight %}
And voila, you have a *read-only* replica of the iso on your usb device. Please note the emphasis on *read-only* in the case of an ISO.

To see a progress bar (of sorts), open up a new terminal window and type the following

{% highlight bash %}
ps auxww | grep " dd " | grep -v grep | awk '{print $2}' | while read pid; do kill -SIGINFO $pid; done
{% endhighlight %}

I originally got the progress bit from [here][1], but changed it to work with OSX.

  [1]: http://www.kclug.org/wiki/index.php/Dd_progress
  [2]: http://gparted.sourceforge.net/liveusb.php
  [3]: http://en.wikipedia.org/wiki/Dd_(Unix)
