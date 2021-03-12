# brain_reg_var
A jupyter notebook which can be used to identify and characterize SNPs with regulatory potential in human brain.  
**Input:** genetic variants identified in a group of samples, in a [multisample vcf format](https://gatk.broadinstitute.org/hc/en-us/articles/360035531692-VCF-Variant-Call-Format), in hg38 coordinates.  
**Output:** biallelic SNPs located in regulatory regions active in human brain, annotated with putative target genes and predicted affected transcription factor binding sites.  

The contents of the notebook can be previewed in the pdf file (annotate_brain_regulatory_variants.pdf).
 
## Main steps of the analysis performed within the notebook:
### 1. Selection of biallelic SNPs located in regulatory regions active in human brain.
In the first step of the analysis biallelic SNPs located in promoters and non-promoter regulatory regions active in human brain are selected. Files describing active promoter and non-promoter regulatory regions are stored in the `<data>` folder (brain_promoters_active.bed and brain_enhancers_active.bed). These are "common active promoters" and "common putative enhancers" identified by [Stepniak et al](https://www.biorxiv.org/content/10.1101/867861v2). You can replace them by your custom files if you wish (you can read more about customization options in the ["How the analysis can be customized"](#how-the-analysis-can-be-customized) section).
### 2. Annotation with population frequencies based on gnomAD genome database data using the ANNOVAR tool.  
In the second step [ANNOVAR](https://annovar.openbioinformatics.org/en/latest/) tool is run on the selected SNPs located in promoters and non-promoter regulatory regions to annotate them with population frequencies obtained from the [gnomAD genome database](https://gnomad.broadinstitute.org/). 
### 3. Selection of rare SNPs enriched in the analyzed group of samples compared to the population. 
Since this analysis was designed for identification of putative regulatory SNPs with pathogenic effects, associated with a disease represented by the group of samples under study only SNPs rare in the population are selected for further analysis. By default SNPs with minor allele frequency (MAF) below 0.01 in all populations included in gnomAD genome are selected. Then a binomial test is performed to identify SNPs observed in the analyzed group of samples more often than expected based on their population frequencies (Benjamini-Hochberg procedure is used to select results significant at FDR = 0.01). The reference population is set to non-Finnish European but it can easily be changed to any population included in the gnomAD genome database.
### 4. Annotation with predicted transcription factor binding sites.
In the next step the regulatory function of each selected SNP is assessed using the [motifbreakR tool](https://www.bioconductor.org/packages/release/bioc/vignettes/motifbreakR/inst/doc/motifbreakR-vignette.html). For each SNP the surrounding sequences are scanned with transcription factor motifs from the [HOCOMOCOv11 database](https://hocomoco11.autosome.ru/) and change in the motif match caused by the presence of alternative allele is assessed. SNPs predicted to have strong influence on transcription factor binding are selected.  
### 5. Assignment of putative target genes which expression could be affected by the SNPs. 
For SNPs located in promoters the assignment of putative target genes is relatively straightforward - it requires identification of transcription start sites (TSS) located within the same promoter region. For SNPs located in non-promoter regulatory regions this task is more complicated. We decided to use three criteria to identify putative target genes for non-promoter regulatory regions:
* distance between the regulatory region and TSS (by identification of the closest TSS),
* chromatin contacts inferred from Hi-C data (we used Hi-C data from developing human brain from [Won et al., 2016](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5358922/) interpreted using the [HiCEnterprise software](https://peerj.com/preprints/27753/)),
* correlation between non-promoter regulatory region activity and gene expression level (we used coverage from H3K27ac ChIP-seq experiments from [Stepniak et al](https://www.biorxiv.org/content/10.1101/867861v2) as measure of regulatory regions activity and RNA-seq data from the same work).
## How the analysis can be customized:
1. different regulatory regions (but experimental results which can quantitatively describe activity of these regulatory regions, such as coverage from appropriate ChIP-seq experiments or open-chromatin detecting assays, have to be provided as well)
2. different reference population (can be chosen from populations available in gnomAD genome)
3. other TF motifs database (any motifs collection available in the MotifDb R package)
4. methods and thresholds for motif scanning.

## Requirements and installation
The notebook has been developed and tested in the following environment:  
  
Ubuntu 20.04   
  
Python 3.8.5  
* jupyterlab 3.0.7  
* pandas 1.2.1  
* scipy 1.6.0 
* statsmodels 0.12.2 
* pybedtools 0.8.1 
* rpy2 3.4.2

R 4.0.3  
* BiocManager 3.12  
* motifbreakR  2.4  
* BSgenome.Hsapiens.UCSC.hg38 1.4.3
* MotifDb 1.32

[ANNOVAR](https://annovar.openbioinformatics.org/en/latest/user-guide/download/) with gnomad_genome database  ??  
bedtools  ??  
GATK 4.1.9.0 ()  




A virtual disk image (.vdi) file with Ubuntu 20.04, all requirements and this notebook ready to use is available at: link.


