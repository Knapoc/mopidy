#!/bin/sh

apt-get install python-alsaaudio && pip install mopidy-alsamixer

pip install Mopidy-InternetArchive
pip install Mopidy-TuneIn
pip install youtube-dl && pip install Mopidy-Youtube
pip install Mopidy-Podcast
pip install Mopidy-Podcast-iTunes

mopidy --config /etc/mopidy/mopidy.conf local scan && mopidy --config /etc/mopidy/mopidy.conf
