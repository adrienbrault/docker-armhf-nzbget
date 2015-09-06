#! /bin/bash -e

if [[ ! -f /config/nzbget.conf ]]; then
    cp /nzbget/nzbget.conf /config/nzbget.conf
    sed -i -E 's#MainDir=.+#MainDir=/downloads#g' /config/nzbget.conf
    sed -i -E 's#ControlUsername=.+#ControlUsername=#g' /config/nzbget.conf
    sed -i -E 's#ControlPassword=.+#ControlPassword=#g' /config/nzbget.conf
fi

/nzbget/nzbget --configfile /config/nzbget.conf --daemon
sleep 5
tail -f /downloads/nzbget.log
