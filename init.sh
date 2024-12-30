#!/bin/bash
rm -rf apps
mkdir apps
cp -a ./Gemfile ./apps/
cp -a ./Gemfile.lock ./apps/
cp -a ./entrypoint.sh ./apps/entrypoint.sh