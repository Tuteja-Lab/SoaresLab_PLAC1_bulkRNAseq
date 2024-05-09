# PLAC1 Bulk RNAseq analyses documentation
## [Tuteja Lab](https://www.tutejalab.org), Iowa State University, Ames IA-50011

**The HTML version of this documentation is available [here](https://tuteja-lab.github.io/SoaresLab_PLAC1_bulkRNAseq)**:

### Documentation (Rmarkdown files)

1. [BeWo: PLAC1 vs. KD](1_BeWo-PLAC1-KD_RNAseq.v2.Rmd)
2. [CT27: ST3D-PLAC1 vs. KD](1_CT27-ST3D-PLAC1-KD_RNAseq.v2.Rmd)
3. [CT29: ST3D-PLAC1-KD](1_CT29-ST3D-PLAC1-KD_RNAseq.v2.Rmd)
4. [Rat PLAC1 JZ_18.5](1_PLAC1_JZ_18.5_RNAseq.v2.Rmd)
5. [Rat PLAC1 placenta_13.5](1_PLAC1_placenta_13.5_RNAseq.v2.Rmd)
6. [rTS_Diff: PLAC1 vs. KD](1_rTS_Diff_PLAC1_KD_RNAseq.v2.Rmd)
7. [Comparing human datasets](comparing_human_datasets.Rmd)


### Data availability

The data used in this study are publicly available:



| Dataset                  | Primary Accession                                                         | Sample Accession                                                            | Description                                               | Type         |
|--------------------------|---------------------------------------------------------------------------|-----------------------------------------------------------------------------|-----------------------------------------------------------|--------------|
| BeWo_PLAC1_KD            | [GSE263205](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE263205) | [GSM8187595](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187595) | Choriocarcinoma-derived BeWo cells, control shRNA treated |  replicate 1 |
|                          |                                                                           | [GSM8187596](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187596) | Choriocarcinoma-derived BeWo cells, control shRNA treated |  replicate 2 |
|                          |                                                                           | [GSM8187597](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187597) | Choriocarcinoma-derived BeWo cells, control shRNA treated |  replicate 3 |
|                          |                                                                           | [GSM8187598](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187598) | Choriocarcinoma-derived BeWo cells, PLAC1 shRNA treated   |  replicate 1 |
|                          |                                                                           | [GSM8187599](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187599) | Choriocarcinoma-derived BeWo cells, PLAC1 shRNA treated   |  replicate 2 |
|                          |                                                                           | [GSM8187600](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187600) | Choriocarcinoma-derived BeWo cells, PLAC1 shRNA treated   |  replicate 3 |
| CT29_ST3D_PLAC1_KD       | [GSE263207](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE263207) | [GSM8187617](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187617) | Human TS cells (CT29), control shRNA treated              |  replicate 1 |
|                          |                                                                           | [GSM8187618](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187618) | Human TS cells (CT29), control shRNA treated              |  replicate 2 |
|                          |                                                                           | [GSM8187619](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187619) | Human TS cells (CT29), control shRNA treated              |  replicate 3 |
|                          |                                                                           | [GSM8187620](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187620) | Human TS cells (CT29), PLAC1 shRNA treated                |  replicate 1 |
|                          |                                                                           | [GSM8187621](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187621) | Human TS cells (CT29), PLAC1 shRNA treated                |  replicate 2 |
|                          |                                                                           | [GSM8187622](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187622) | Human TS cells (CT29), PLAC1 shRNA treated                |  replicate 3 |
| PLAC1_JZ_18.5            | [GSE263209](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE263209) | [GSM8187629](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187629) | gd 18.5 junctional zone tissue from Plac1 mutant rats     |  replicate 1 |
|                          |                                                                           | [GSM8187630](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187630) | gd 18.5 junctional zone tissue from wild type rats        |  replicate 1 |
|                          |                                                                           | [GSM8187631](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187631) | gd 18.5 junctional zone tissue from Plac1 mutant rats     |  replicate 2 |
|                          |                                                                           | [GSM8187632](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187632) | gd 18.5 junctional zone tissue from wild type rats        |  replicate 2 |
|                          |                                                                           | [GSM8187633](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187633) | gd 18.5 junctional zone tissue from Plac1 mutant rats     |  replicate 3 |
|                          |                                                                           | [GSM8187634](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187634) | gd 18.5 junctional zone tissue from wild type rats        |  replicate 3 |
|                          |                                                                           | [GSM8187635](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187635) | gd 18.5 junctional zone tissue from Plac1 mutant rats     |  replicate 4 |
|                          |                                                                           | [GSM8187636](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187636) | gd 18.5 junctional zone tissue from wild type rats        |  replicate 4 |
|                          |                                                                           | [GSM8187637](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187637) | gd 18.5 junctional zone tissue from Plac1 mutant rats     |  replicate 5 |
| PLAC1_placenta_13.5      | [GSE263211](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE263211) | [GSM8187648](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187648) | gd 13.5 placental tissue from Plac1 mutant rats           |  replicate 1 |
|                          |                                                                           | [GSM8187649](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187649) | gd 13.5 placental tissue from wild type rats              |  replicate 1 |
|                          |                                                                           | [GSM8187650](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187650) | gd 13.5 placental tissue from Plac1 mutant rats           |  replicate 2 |
|                          |                                                                           | [GSM8187651](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187651) | gd 13.5 placental tissue from wild type rats              |  replicate 2 |
|                          |                                                                           | [GSM8187652](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187652) | gd 13.5 placental tissue from Plac1 mutant rats           |  replicate 3 |
|                          |                                                                           | [GSM8187653](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187653) | gd 13.5 placental tissue from wild type rats              |  replicate 3 |
|                          |                                                                           | [GSM8187654](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187654) | gd 13.5 placental tissue from Plac1 mutant rats           |  replicate 4 |
|                          |                                                                           | [GSM8187655](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187655) | gd 13.5 placental tissue from wild type rats              |  replicate 4 |
|                          |                                                                           | [GSM8187656](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187656) | gd 13.5 placental tissue from Plac1 mutant rats           |  replicate 5 |
|                          |                                                                           | [GSM8187657](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187657) | gd 13.5 placental tissue from wild type rats              |  replicate 5 |
| hTS_CT27_ST3D_PLAC1_KD   | [GSE263212](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE263212) | [GSM8187658](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187658) | Human TS cells (CT27), PLAC1 shRNA treated                |  replicate 1 |
|                          |                                                                           | [GSM8187659](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187659) | Human TS cells (CT27), PLAC1 shRNA treated                |  replicate 2 |
|                          |                                                                           | [GSM8187660](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187660) | Human TS cells (CT27), PLAC1 shRNA treated                |  replicate 3 |
|                          |                                                                           | [GSM8187661](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187661) | Human TS cells (CT27), control shRNA treated              |  replicate 1 |
|                          |                                                                           | [GSM8187662](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187662) | Human TS cells (CT27), control shRNA treated              |  replicate 2 |
|                          |                                                                           | [GSM8187663](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187663) | Human TS cells (CT27), control shRNA treated              |  replicate 3 |
| rTS_Diff_PLAC1_KD        | [GSE263213](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE263213) | [GSM8187664](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187664) | rat TS cells, PLAC1 shRNA treated                         |  replicate 1 |
|                          |                                                                           | [GSM8187665](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187665) | rat TS cells, PLAC1 shRNA treated                         |  replicate 2 |
|                          |                                                                           | [GSM8187666](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187666) | rat TS cells, PLAC1 shRNA treated                         |  replicate 3 |
|                          |                                                                           | [GSM8187667](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187667) | rat TS cells, control shRNA treated                       |  replicate 1 |
|                          |                                                                           | [GSM8187668](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187668) | rat TS cells, control shRNA treated                       |  replicate 2 |
|                          |                                                                           | [GSM8187669](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM8187669) | rat TS cells, control shRNA treated                       |  replicate 3 |
### Contacts

1. Project related questions: Geetu Tuteja
2. Scripts and workflow related questions: please open an [issue](https://github.com/Tuteja-Lab/SoaresLab_PLAC1_bulkRNAseq/issues) here on GitHub.

### Publication

If you use the scripts from this repository in your research, please cite this publication (coming soon):

Ayelen Moreno Irusta, Jovana Urosevic, Khursheed Iqbal, Arun S. Seetharam, Jackson Nteeba, Regan L. Scott, Marija Kuna, Masanaga Muto, Keisuke Kozai, Andjelka Celic, Hiroaki Okae, Takahiro Arima, Geetu Tuteja, Michael J. Soares
Species-specific gene utilization in the regulation of hemochorial placentation
_in preparation_ (2024)