# docker armhf nzbget

## Instructions

```
docker run -d \
    --name nzbget \
    --restart always \
    -p 6789:6789 \
    -v <your_downloads_location>:/downloads \
    -v <your_nzbget_config_location>:/config \
    adrienbrault/armhf-nzbget
```
