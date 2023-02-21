#!/bin/bash

docker run -ti --rm \
	--volume "$(pwd):/data" \
	--workdir /data \
	alpine sh -c 'apk add --no-cache python3 asciidoctor && gem install pygments.rb && asciidoctor Shib_SP_tutorial.adoc'
