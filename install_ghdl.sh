#!/bin/bash

# extract download link for the latest version
GHDL_DOWNLOAD_LINK=$(curl -s https://api.github.com/repos/ghdl/ghdl/releases/latest | grep macosx-llvm | grep \"browser_download_url\": | cut -d ":" -f 2,3 | tr -d \"\ )

# download the latest version
curl -OL $GHDL_DOWNLOAD_LINK

# extract the latest version into /usr/local/
tar -zxvf ghdl-*-macosx-llvm.tgz -C /usr/local/

# delete the archive
rm ghdl-*-macosx-llvm.tgz

# test the installation worked
if ghdl -v ; then
  echo "Installation successful."
else
  echo "Installation failed."
fi

