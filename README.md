
[Official Kibana image](https://registry.hub.docker.com/_/kibana/) was recently added to the Docker Hub.  
It's 184MB, while it easy enough to make a smaller one.. Here it is.

| this one | official |
| -------- | -------- |
| [![](https://badge.imagelayers.io/anapsix/kibana:latest.svg)](https://imagelayers.io/?images=anapsix/kibana:latest) | [![](https://badge.imagelayers.io/kibana:latest.svg)](https://imagelayers.io/?images=kibana:latest) |

## Tags

|  tag   | version |
| :----- | ------- |
| latest |  4.3.0  |
| 4.3    |  4.3.0  |
| 4.3.0  |  4.3.0  |
| 4.2    |  4.2.1  |
| 4.2.1  |  4.2.1  |
| 4.1    |  4.1.3  |
| 4.1.3  |  4.1.3  |
| 4.0    |  4.0.3  |
| 4.0.3  |  4.0.3  |

## Usage 

    docker run -it --rm \
      -e ELASTICSEARCH_URL="http://kibana.acmecorp.com:9200" \
      -p 5601:5601 kibana

