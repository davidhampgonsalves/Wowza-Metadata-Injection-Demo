Overview
========
This code was for a demo I created which uses Wowza to stream a live event using rtp as well as inject JSON based metadata into the media stream and use it to trigger synchronized events on the client side.

Setup
=====
* To get this set up you need to set up wowza and be broadcasting a live stream(Adobe live encoder works well).  
* Build the Wowza module and install it on your Wowza instance.  
* Write some javascript to invoke the broadcaster flash object from a browser and pass in your data.
* Setup the player and write some javascript to be called when the metadata is recieved.

This is covered in more detail [here](http://www.davidhampgonsalves.com/2011/08/Injecting-Live-Metadata-with-Wowza).
