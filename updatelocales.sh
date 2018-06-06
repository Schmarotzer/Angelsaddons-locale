#!/bin/bash
# Run this script to export translations from CrowdIn.
# Requires CROWDIN_API_KEY environment variable to be set.

# Get mod name from info.json and use as the CrowdIn project name
# https://stedolan.github.io/jq/
projname=`cat info.json|jq -r .name`

# Call CrowdIn API to build and export latest translations
curl -k "https://api.crowdin.com/api/project/$projname/export?key=$CROWDIN_API_KEY"

# Download and unzip all translations
curl -k -o locales.zip "https://api.crowdin.com/api/project/$projname/download/all.zip?key=$CROWDIN_API_KEY"
unzip locales.zip -d temp

# Move translations into place(Test)
mv temp/locale/ko-KR/angelsaddons-newlocales_ko.ini locale/ko/angelsaddons-newlocales_ko.cfg
mv temp/locale/ko-KR/angelsaddons-oresilos_0.4.0_ko.ini locale/ko/angelsaddons-oresilos_0.4.0_ko.cfg
mv temp/locale/ko-KR/angelsaddons-petrotrain_0.3.2_ko.ini locale/ko/angelsaddons-petrotrain_0.3.2_ko.cfg
mv temp/locale/ko-KR/angelsaddons-pressuretanks_0.3.0_ko.ini locale/ko/angelsaddons-pressuretanks_0.3.0_ko.cfg
mv temp/locale/ko-KR/angelsaddons-warehouses_0.3.0_ko.ini locale/ko/angelsaddons-warehouses_0.3.0_ko.cfg
mv temp/locale/ko-KR/angelsbioprocessing_0.5.6_ko.ini locale/ko/angelsbioprocessing_0.5.6_ko.cfg
mv temp/locale/ko-KR/angelsexploration_0.2.0_ko.ini locale/ko/angelsexploration_0.2.0_ko.cfg
mv temp/locale/ko-KR/angelsindustries_0.1.0_ko-components.ini locale/ko/angelsindustries_0.1.0_ko-components.cfg
mv temp/locale/ko-KR/angelsindustries_0.1.0_ko-logistic.ini locale/ko/angelsindustries_0.1.0_ko-logistic.cfg
mv temp/locale/ko-KR/angelsinfiniteores_0.7.3_ko.ini locale/ko/angelsinfiniteores_0.7.3_ko.cfg
mv temp/locale/ko-KR/angelspetrochem_0.7.8_ko.ini locale/ko/angelspetrochem_0.7.8_ko.cfg
mv temp/locale/ko-KR/angelsrefining_0.9.11_ko-ore-refining.ini locale/ko/angelsrefining_0.9.11_ko-ore-refining.cfg
mv temp/locale/ko-KR/angelsrefining_0.9.11_ko-water-treatment.ini locale/ko/angelsrefining_0.9.11_ko-water-treatment.cfg
mv temp/locale/ko-KR/angelssmelting_0.4.3_ko.ini locale/ko/angelssmelting_0.4.3_ko.cfg

# Clean up
rm locales.zip
rm -rf temp

# Commit to repo
#git add locale/*
#git commit -m "Update localisations"
