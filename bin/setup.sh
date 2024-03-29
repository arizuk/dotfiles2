#!/bin/sh

set -eu

version='1.12.7'
mitamae_version="mitamae-${version}"
arch=$(uname -m)

if ! [ -f "bin/${mitamae_version}" ]; then
  case "$(uname)" in
    "Darwin")
      if [ $arch = "arm64" ] ; then
        mitamae_bin="mitamae-aarch64-darwin"
      else
        mitamae_bin="mitamae-x86_64-darwin"
      fi
      ;;
    "Linux")
      mitamae_bin="mitamae-x86_64-linux"
      ;;
    *)
      echo "unknown uname: $(uname)"
      exit 1
      ;;
  esac

  # http://www.hcn.zaq.ne.jp/___/unix/curl_manual.html
  curl -o "bin/${mitamae_bin}.tar.gz" -fL "https://github.com/itamae-kitchen/mitamae/releases/download/v${version}/${mitamae_bin}.tar.gz"
  tar xvzf "bin/${mitamae_bin}.tar.gz"

  rm "bin/${mitamae_bin}.tar.gz"
  mv "${mitamae_bin}" "bin/${mitamae_version}"
  chmod +x "bin/${mitamae_version}"
  ln -sf "${mitamae_version}" bin/mitamae

else
  echo 'already installed Mitamae'
fi
