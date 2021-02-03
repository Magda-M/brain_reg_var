#!/bin/bash

GATK="/home/magda/Programs/gatk-4.1.1.0/gatk"
INPUT="$1"
OUTPUT_PROMOTERS="$2"
OUTPUT_ENHANCERS="$3"
PROMOTERS=data/brain_promoters_active.interval_list
ENHANCERS=data/brain_enhancers_active.interval_list

$GATK SelectVariants -V $INPUT -L $PROMOTERS --select-type-to-include SNP --restrict-alleles-to BIALLELIC -O $OUTPUT_PROMOTERS
$GATK SelectVariants -V $INPUT -L $ENHANCERS --select-type-to-include SNP --restrict-alleles-to BIALLELIC -O $OUTPUT_ENHANCERS
