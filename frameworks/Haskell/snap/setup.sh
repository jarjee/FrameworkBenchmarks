#!/bin/bash
export CABAL_HOME=/opt/cabal/1.22
export HASKELL_HOME=/opt/ghc/7.10.3
export LANG=en_US.UTF-8

sed -i 's|host=".*"|host="'"${DBHOST}"'"|g' bench/cfg/db.cfg

export PATH=${HASKELL_HOME}/bin:$PATH

cd bench

${CABAL_HOME}/bin/cabal update
${CABAL_HOME}/bin/cabal sandbox init
${CABAL_HOME}/bin/cabal install

`find dist/ -name "snap-bench" -type f` +RTS -A4M -N -qg2 -I0 -G2 &
