SPRITOPIA
==========

The sprite generator

Description
-----------

Spritopia pretend to be an easy to use, one command line tool, that do one task: 
Generate png sprites.

Usage
-----

Supose you have 3 images called ``images/icons/cut.png``, ``images/icons/copy.png``
 and ``images/icons/paste.png``, and you want to create a sprite with all of them.

For doing that you need to create a file. Where you put that file is important 
because the images will be relative to that file.

In our example, we are going to create ``images/icons.png``. For doing that, we 
are going to create ``images/icons.sprite`` with the following content:

    icons/cut.png
    icons/copy.png
    icons/paste.png

Now you have that file, you just need to call spritopia:

    spritopia images/icons.sprite

This command will create two new files ``icons.png`` and ``icons.json`` in the same
directory of our ``.sprite`` file.

**icons.png** is the actual sprite with all the images defined inside ``icons.sprite``
**icons.json** will have the coordinates of each image and the size.

For example, icons.json could be like this:


    {
      "icons/cut.png":{
        "width":100,
        "height":100,
        "x":0,
        "y":0,
        "x2":100,
        "y2":100
      },
      "icons/copy.png":{
        "width":20,
        "height":20,
        "x":0,
        "y":100,
        "x2":20,
        "y2":120
      },
      "icons/paste.png":{
        "width":350,
        "height":150,
        "x":0,
        "y":120,
        "x2":350,
        "y2":270
      }
    }

Now you can load that file with any program you want. The only files you are 
going to need is ``icons.png`` and ``icons.json``.

Thats all.


Installation
------------

    gem install spritopia


Author
------

  * Guillermo Álvarez Fernández <guillermo@cientifico.net> - @guillermooo






