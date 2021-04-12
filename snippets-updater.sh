#!/bin/bash
# File              : snippets-updater.sh
# License           : MIT License
# Author            : M. Nabil Adani <nblid48@gmail.com>
# Date              : Jumat, 26/02/2021 10:41 WIB
# Last Modified Date: Jumat, 26/02/2021 18:31 WIB
# Last Modified By  : M. Nabil Adani <nblid48@gmail.com>


urls='''
[
    ["sh",         "https://github.com/yousefvand/shellman/raw/master/snippets/snippets.json"],
    ["latex",      "https://github.com/sabertazimi/LaTeX-snippets/raw/master/snippets/snippets.json"],
    ["sql",        "https://github.com/SadeghPM/sql-vscode-snipptes/raw/master/snippets/snippets.json"],
    ["javascript", "https://github.com/dsznajder/vscode-es7-javascript-react-snippets/raw/master/snippets/snippets.json"],
    ["html",       "https://github.com/abusaidm/html-snippets/raw/master/snippets/snippets.json"],
    ["go",         "https://github.com/golang/vscode-go/raw/master/snippets/go.json"]
]
'''

function download() {
    if [ `command -v aria2c` ]; then
        aria2c --allow-overwrite -o $1 $2
    elif [ `command -v wget` ]; then
        wget -o $1 $2
    elif [ `command -v curl` ]; then
        curl -o $1 $2
    else
        echo "please install aria2 or wget or curl"
    fi
}

function autoformat(){
    sed -i 's/^\/\/ //g' $1
    prettier -w $1
}

echo $urls | jq -c '.[]' | while read i;
do
    filename=$(echo $i| jq -r '.[0]')
    output="./snippets/$filename.json"
    url=$(echo $i| jq -r '.[1]')
    download $output $url
    autoformat $output
done
