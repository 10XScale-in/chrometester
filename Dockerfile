FROM zenika/alpine-chrome:with-node

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD 1
ENV LIVEKIT_API_KEY API7sLNrme5jtjN
ENV LIVEKIT_API_SECRET 5rsqUKyTVUZ0AFSsyMCpx9E0Hld5Jj8tTUvOlZ5kOlI
ENV LIVEKIT_HOST wss://webconf.10xscale.in
ENV LIVEKIT_ROOM TEST101
ENV ENABLE_PUBLISH true
ENV PUPPETEER_EXECUTABLE_PATH /usr/bin/chromium-browser
WORKDIR /usr/src/app
COPY --chown=chrome package.json package-lock.json ./
RUN npm install
COPY --chown=chrome . ./
ENTRYPOINT ["tini", "--"]
CMD ["node", "src/index"]
