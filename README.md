# A2CARDIAC
This is an implementation of CARDIAC for the Apple II platform.

# How to build
This software was developed on both a Mac OS X and a Windows system with Cygwin installed.  You'll need to have common Unix utilities available (e.g., cp), as well as Java (for AppleCommander), Make, and CC65.

Other than the above, the Makefile does use an environmental variable, CC65BASE, that points to the root of your CC65 environment.  The one in the Makefile is the path to my CC65, so obviously its unlikely to work for you.

Once you have everything setup, you can build the project:
  make -e

Note that this Makefile will create a 140k ProDos bootable disk image and copy the program to it.  However, it does not copy STARTUP, so if you want the program to auto-boot, you will need to create that yourself.  To do so, the first time you book the disk, type the following:

]NEW
]10 PRINT CHR$(4);"-A2CARD"
]SAVE STARTUP

The Makefile only creates a new disk if you remove the old disk; otherwise it just replaces the original file.  To facilitate this, this project has three clean targets:

clean: standard clean that removes everything but the disk image
clean-disk: removes only the disk image
clean-all: calls both of above
