#!/bin/bash

#syllable
cut -f3 ./close-2tag.result > ./close-2tag.result.true
cut -f4 ./close-2tag.result > ./close-2tag.result.predicted

cut -f3 ./open-2tag.result > ./open-2tag.result.true
cut -f4 ./open-2tag.result > ./open-2tag.result.predicted

cut -f3 ./close-3tag.result > ./close-3tag.result.true
cut -f4 ./close-3tag.result > ./close-3tag.result.predicted

cut -f3 ./open-3tag.result > ./open-3tag.result.true
cut -f4 ./open-3tag.result > ./open-3tag.result.predicted

cut -f3 ./close-4tag.result > ./close-4tag.result.true
cut -f4 ./close-4tag.result > ./close-4tag.result.predicted

cut -f3 ./open-4tag.result > ./open-4tag.result.true
cut -f4 ./open-4tag.result > ./open-4tag.result.predicted

cut -f3 ./close-5tag.result > ./close-5tag.result.true
cut -f4 ./close-5tag.result > ./close-5tag.result.predicted

cut -f3 ./open-5tag.result > ./open-5tag.result.true
cut -f4 ./open-5tag.result > ./open-5tag.result.predicted

#character

cut -f3 ./close.ch-2tag.result > ./close.ch-2tag.result.true
cut -f4 ./close.ch-2tag.result > ./close.ch-2tag.result.predicted

cut -f3 ./open.ch-2tag.result > ./open.ch-2tag.result.true
cut -f4 ./open.ch-2tag.result > ./open.ch-2tag.result.predicted

cut -f3 ./close.ch-3tag.result > ./close.ch-3tag.result.true
cut -f4 ./close.ch-3tag.result > ./close.ch-3tag.result.predicted

cut -f3 ./open.ch-3tag.result > ./open.ch-3tag.result.true
cut -f4 ./open.ch-3tag.result > ./open.ch-3tag.result.predicted

cut -f3 ./close.ch-4tag.result > ./close.ch-4tag.result.true
cut -f4 ./close.ch-4tag.result > ./close.ch-4tag.result.predicted

cut -f3 ./open.ch-4tag.result > ./open.ch-4tag.result.true
cut -f4 ./open.ch-4tag.result > ./open.ch-4tag.result.predicted

cut -f3 ./close.ch-5tag.result > ./close.ch-5tag.result.true
cut -f4 ./close.ch-5tag.result > ./close.ch-5tag.result.predicted

cut -f3 ./open.ch-5tag.result > ./open.ch-5tag.result.true
cut -f4 ./open.ch-5tag.result > ./open.ch-5tag.result.predicted








