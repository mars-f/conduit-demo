# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

FROM alpine:3.6

# The port the server will run on.
ENV PORT 80

# The Mercurial repo to clone and serve on startup.
ENV HG_REPO ""

RUN mkdir /repos

# Declare /repos as a volume in case the user wants to mount their own repo
# here, or save their repo contents across restarts.
VOLUME /repos

# Build/install dependencies
RUN apk --no-cache add mercurial ca-certificates

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
