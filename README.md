Within this Overlay you can find some Gentoo ebuilds/tools/apps/progs/stuff/misc/etc.

You should know what you're doing.

-USAGE-

Emerge Layman:

    emerge -av layman

First run these two commands:

    layman --overlays=https://github.com/bLo0dRunNer/tmisc-ol/raw/master/overlays.xml -L
    layman --overlays=https://github.com/bLo0dRunNer/tmisc-ol/raw/master/overlays.xml -a tmisc-ol

Then add the following line to /etc/layman/layman.cfg (just the second line):

    overlays  : http://www.gentoo.org/proj/en/overlays/repositories.xml
                https://github.com/bLo0dRunNer/tmisc-ol/raw/master/overlays.xml?raw=true

After those steps:

    layman -L
    layman -a tmisc-ol

Afterwards you can emerge everything from this overlay.
