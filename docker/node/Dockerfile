FROM node:lts-slim as node
FROM ubuntu:22.04

ENV YARN_VERSION 1.22.18
COPY --from=node /opt/yarn-v${YARN_VERSION} /opt/yarn-v${YARN_VERSION}
COPY --from=node /usr/local/bin/node /usr/local/bin/
COPY --from=node /usr/local/lib/node_modules/ /usr/local/lib/node_modules/
RUN ln -s /opt/yarn-v${YARN_VERSION}/bin/yarn /usr/local/bin/yarn && \ 
    ln -s /opt/yarn-v${YARN_VERSION}/bin/yarn /usr/local/bin/yarnpkg && \
    ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm && \
    ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npx
RUN sysctl fs.inotify.max_user_watches=24288
ARG UID=1000
ARG GID=1000
ARG USER_NAME=dev
RUN groupadd --gid ${GID} ${USER_NAME} && \
    useradd --uid ${UID} --gid ${GID} --shell /bin/bash --create-home ${USER_NAME}
USER ${UID}
WORKDIR /home/${USER_NAME}
ENTRYPOINT [ "bash", "-c" ]
CMD [ "bash" ]
