#!/bin/sh
stack build --install-ghc && stack exec -- sitehaskus $@
