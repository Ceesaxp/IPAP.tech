#!/bin/sh
set -euo pipefail

USER=ec2-user
HOST=rsync-aws.fft
DIR=/var/www/html/ipap.tech/htdocs/

hugo && rsync -avz --progress --delete public/* "${HOST}":"${DIR}"

exit 0
