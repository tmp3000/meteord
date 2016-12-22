#!/bin/bash
set -e
if [ -z "$NODE_VERSION" ]; then
  echo "Must set NODE_VERSION with --build-arg NODE_VERSION=x.y.z when building docker image"
  exit 1
fi
echo "Installing Node v${NODE_VERSION}"
NODE_ARCH=x64

# check we need to do this or not

NODE_DIST=node-v${NODE_VERSION}-linux-${NODE_ARCH}

cd /tmp

#curl -O -L http://nodejs.org/dist/v${NODE_VERSION}/${NODE_DIST}.tar.gz

curl -O -L http://npm.taobao.org/mirrors/node/v${NODE_VERSION}/${NODE_DIST}.tar.gz


tar xvzf ${NODE_DIST}.tar.gz
rm -rf /opt/nodejs
mv ${NODE_DIST} /opt/nodejs

ln -sf /opt/nodejs/bin/node /usr/bin/node
ln -sf /opt/nodejs/bin/npm /usr/bin/npm

npm config set registry https://registry.npm.taobao.org
npm config set disturl https://npm.taobao.org/dist

npm install --global npm@3
#npm install -g npm-cache
#ln -sf /opt/nodejs/bin/npm-cache /usr/bin/npm-cache

#npm install yarn -g
#ln -sf /opt/nodejs/bin/yarn /usr/bin/yarn

#curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg |  apt-key add -echo "deb https://dl.yarnpkg.com/debian/ stable main" |  tee /etc/apt/sources.list.d/yarn.list
#apt-get update
#apt-get install yarn

#yarn install


#npm install -g cnpm
#ln -sf /opt/nodejs/bin/cnpm /usr/bin/cnpm
#cnpm install


npm cache add source-map-support@"https://github.com/meteor/node-source-map-support/tarball/1912478769d76e5df4c365e147f25896aee6375e"


#alias lnpm="npm3 --registry=https://registry.npm.taobao.org"
#alias cnpm="npm --registry=https://registry.npm.taobao.org --cache=/opt/nodejs/.npm/.cache/cnpm --disturl=https://npm.taobao.org/dist --userconfig=/opt/nodejs/.cnpmrc"