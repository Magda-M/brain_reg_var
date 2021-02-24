# brain_reg_var
A jupyter notebook which can be used to identify and characterize SNPs with regulatory potential in human brain.
Input file should contain biallelic single nucleotide polimorphisms (SNPs) identified in a group of samples, in a multisample vcf format (see https://gatk.broadinstitute.org/hc/en-us/articles/360035531692-VCF-Variant-Call-Format).
The analysis performed within the notebook consists the following steps:
1. Selection of SNPs located in regulatory regions active in human brain.
2. Annotation with population frequencies based on gnomAD genome database data using the ANNOVAR tool
Files describing active promoter and enhacer regions are in data folder (brain_promoters_active.interval_list and brain_enhancers_active.interval_list). These are "common active promoters" and "common putative enhancers" identified by Stepniak et al [ref]. You can replace them by your custom files if you wish.
