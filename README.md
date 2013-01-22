You can find some Ebuilds for Gentoo here.
You should understand and know what you're doing.


USAGE

Emerge Layman:

    emerge -av layman

First run these two commands:

    layman --overlays=https://github.com/bLo0dRunNer/tmisc-ol/raw/master/overlays.xml -L
    layman --overlays=https://github.com/bLo0dRunNer/tmisc-ol/raw/master/overlays.xml -a tmisc-ol

Then add the following line to /etc/layman/layman.cfg :

    overlays  : http://www.gentoo.org/proj/en/overlays/repositories.xml
		https://github.com/bLo0dRunNer/tmisc-ol/raw/master/overlays.xml?raw=true

After those steps:

    layman -L
    layman -a tmisc-ol

Afterwards you can emerge everything from this overlay.
