FROM debian:stretch-slim

RUN apt-get update \
    && apt-get install -y \
                       wget \
                       gcc \
                       gnupg \
    && wget -q -O - https://apt.mopidy.com/mopidy.gpg | apt-key add - \
    && wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/jessie.list \
    && apt-get update \
    && apt-get install -y \
                       python-pip \
                       mopidy \
                       python-alsaaudio \
    && pip install -U \
                  pyasn1 \
                  mopidy-moped \
                  mopidy-alsamixer \
                  Mopidy-InternetArchive \
                  Mopidy-TuneIn \
                  youtube-dl \
                  Mopidy-Youtube \
                  Mopidy-Podcast \
                  Mopidy-Podcast-iTunes \
                  Mopidy-API-Explorer \
                  Mopidy-Scrobbler \
                  Mopidy-AudioAddict \
                  mopidy-bassdrive \
                  mopidy-gmusic \
                  Mopidy-SoundCloud \
                  Mopidy-Spotify \
    && apt-get purge --auto-remove -y \
        wget \
        gcc \
    && apt-get clean \              
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache
                 
CMD ["mopidy","--config /root/.config/mopidy/mopidy.conf"]
#COPY start.sh /start.sh

#RUN chmod a+x /start.sh

#ENTRYPOINT [ "/start.sh" ]
