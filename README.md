# brain_reg_var
A jupyter notebook which can be used to identify and characterize SNPs with regulatory potential in human brain.  
**Input:** genetic variants identified in a group of samples, in a multisample vcf format (see https://gatk.broadinstitute.org/hc/en-us/articles/360035531692-VCF-Variant-Call-Format).  
**Output:** biallelic SNPs located in regulatory regions active in human brain, annotated with putative target genes and predicted affected transcription factor binding sites.  

The contents of the notebook can be previewed in the pdf file (annotate_brain_regulatory_variants.pdf).
 
# Main steps of the analysis performed within the notebook:
## 1. Selection of biallelic SNPs located in regulatory regions active in human brain.
Files describing active promoter and enhacer regions are in data folder (brain_promoters_active.interval_list and brain_enhancers_active.interval_list). These are "common active promoters" and "common putative enhancers" identified by Stepniak et al [ref]. You can replace them by your custom files if you wish.
## 2. Annotation with population frequencies based on gnomAD genome database data using the ANNOVAR tool  
## 3. Selection of rare SNPs enriched in the analyzed group of samples compared to the population (by default non-Finnish European but other populations included in gnomAD genome can be selected).
## 4. Annotation with predicted transcription factor binding sites which can be affected by the SNPs using the motifBreakR tool.  
## 5. Assignment of putative target genes which expression could be affected by the SNPs. 

# How the analysis could be customized:
1. different regulatory regions (but experimental results which can quantitatively describe activity of these regulatory regions, such as coverage from appropriate ChIP-seq experiments or open-chromatin detecting assays, have to be provided as well)
2. different reference population (can be chosen from populations available in gnomAD genome)
3. other TF motifs database (any motifs collection available in the MotifDb R package)

# Requirements and installation
The jupyter notebook itself does not require any installation but to run it the following packages/libraries/tools are required:
python > 3.5   
ANNOVAR (https://annovar.openbioinformatics.org/en/latest/user-guide/download/) with gnomad_genome database  
`<annotate_variation.pl -buildver hg38 -downdb -webfrom annovar gnomad_genome humandb/>` (run this command afted ANNOVAR download)  
bedtools  
`<sudo apt install bedtools>`  
python libraries: jupyterlab, pandas, scipy, statsmodels, pybedtools, rpy2  
`<pip3 install jupyterlab pandas scipy statsmodels pybedtools rpy2>` 
R 4.*
BiocManager 3.12
motifbreakR
BSgenome.Hsapiens.UCSC.hg38

A virtual disk image (.vdi) file with Ubuntu 20.04, all requirements and this notebook ready to use is available at: link.


