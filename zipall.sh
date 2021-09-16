#!/bin/bash

zipdat=$(date +%Y%m%d)

zip -vr "$zipdat"_addressli.zip ./. && md5sum "$zipdat"_addressli.zip >"$zipdat"_addressli_md5sum.txt


