theme_clean <- function() {
  font.1 <- 'sans'
  font.2 <- 'sans'
  font.3 <- 'sans'
  theme_classic() %+replace% 
    theme(
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      plot.title = element_text(
        family = font.1,
        size = 12,
        face = 'bold',
        hjust = 0,
        vjust = 2
      ),
      plot.subtitle = element_text(
        family = font.1,
        size = 10),
      plot.caption = element_text(
        family = font.1,
        size = 10,
        hjust = 1
      ),
      plot.margin = margin(
        t = 1,
        r = 1,
        b = 1,
        l = 2,
        unit = "cm"
      ),
      axis.title = element_text(
        family = font.1,
        size = 10,
        face = 'bold'
      ),
      axis.line.x = element_line(color = "black"),
      axis.line.y = element_line(color = "black"),
      axis.text = element_text(family = font.1,
                               size = 12),
      axis.text.x = element_text(
        margin = margin(5, b = 10),
        size = 10, angle = 0),
      strip.text = element_text(
        family = font.1,
        face = "bold",
        color = "gray35",
        hjust = 0,
        size = 10
      ),
      strip.background = element_rect(fill = "white",
                                      linetype = "blank"),
      legend.title = element_text(
        family = font.1,
        size = 12,
        color = "black",
        face = "bold"
      ),
      legend.text = element_text(
        family = font.1,
        size = 12,
        color = "black",
        face = "plain"
      ),
      legend.background = element_rect(
        color = "black",
        fill = "transparent",
        size = 2,
        linetype = "blank"
      ),
      legend.key = element_blank(),
      legend.position="none",
    )
}
processDE <- function(res.se, string) {
  fc = 1.5
  log2fc = log(fc, base = 2)
  neg.log2fc = log2fc * -1
  res.se <- res.se[order(res.se$padj), ]
  res.data <-
    merge(as.data.frame(res.se),
          as.data.frame(counts(dds, normalized = TRUE)),
          by = "row.names",
          sort = FALSE)
  names(res.data)[1] <- "Gene"
  res.up <-
    res.data %>%
    filter(log2FoldChange >= log2fc) %>%
    filter(padj <= 0.05) %>%
    arrange(desc(log2FoldChange)) %>%
    dplyr::select(Gene)
  res.dw <-
    res.data %>%
    filter(log2FoldChange <= neg.log2fc) %>%
    filter(padj <= 0.05) %>%
    arrange(desc(log2FoldChange)) %>%
    dplyr::select(Gene)
  res.up.new <-
    annot[annot$ensembl_gene_id_version %in% res.up$Gene,]
  res.dw.new <-
    annot[annot$ensembl_gene_id_version %in% res.dw$Gene,]
  res.data.info <-
    inner_join(res.data, mart, by = c('Gene' = 'ensembl_gene_id_version'))
  res.data.filtered <- res.data.info %>%
    filter(padj <= 0.05) %>%
    filter(log2FoldChange >= log2fc | log2FoldChange <= neg.log2fc) %>%
    arrange(desc(log2FoldChange))
  pce.up1 <- paste0(string, ".up.pce", 1)
  pce.dw1 <- paste0(string, ".dw.pce", 1)
  pce.up2 <- paste0(string, ".up.pce", 2)
  pce.dw2 <- paste0(string, ".dw.pce", 2)
  DEGtable <- paste0(string, ".DE.table")
  assign(pce.up1, as.character(res.up.new$ensembl_gene_id), envir = .GlobalEnv)
  assign(pce.dw1, as.character(res.dw.new$ensembl_gene_id), envir = .GlobalEnv)
  assign(pce.up2, as.character(res.up.new$external_gene_name), envir = .GlobalEnv)
  assign(pce.dw2, as.character(res.dw.new$external_gene_name), envir = .GlobalEnv)
  assign(DEGtable, res.data.info, envir = .GlobalEnv)
  # save full table
  write_delim(
    res.data.info,
    file = paste0("assets/DESeq2results-", string, "_fc.tsv"),
    delim = "\t"
  )
  # save filtered table (fc = 1.5 & padj <= 0.05)
  write_delim(
    res.data.filtered,
    file = paste0("assets/DE_", string, "_filtered.tsv"),
    delim = "\t"
  )
}

volcanoPlots <-
  function(res.se,
           string,
           first,
           second,
           color1,
           color2,
           color3,
           ChartTitle) {
    fc = 1.5
    log2fc = log(fc, base = 2)
    neg.log2fc = log2fc * -1
    res.se <- res.se[order(res.se$padj),]
    res.se <-
      rownames_to_column(as.data.frame(res.se[order(res.se$padj), ]))
    names(res.se)[1] <- "Gene"
    res.data <-
      merge(res.se,
            mart,
            by.x = "Gene",
            by.y = "ensembl_gene_id_version")
    res.data <- res.data %>% mutate_all(na_if, "")
    res.data <- res.data %>% mutate_all(na_if, " ")
    res.data <-
      res.data %>% mutate(external_gene_name = coalesce(external_gene_name, Gene))
    res.data$diffexpressed <- "other.genes"
    res.data$diffexpressed[res.data$log2FoldChange >= log2fc &
                             res.data$padj <= 0.05] <-
      paste("Higher expression in", first)
    res.data$diffexpressed[res.data$log2FoldChange <= neg.log2fc &
                             res.data$padj <= 0.05] <-
      paste("Higher expression in", second)
    upgenes <- res.data %>%
      dplyr::filter(log2FoldChange >= log2fc & padj <= 0.05) %>%
      arrange(desc(log2FoldChange)) %>%
      mutate(delabel = external_gene_name) %>%
      select(Gene, delabel)
    # %>%
    #  top_n(10)
    downgenes <- res.data %>%
      dplyr::filter(log2FoldChange <= neg.log2fc &
                      padj <= 0.05) %>%
      arrange(desc(log2FoldChange)) %>%
      mutate(delabel = external_gene_name) %>%
      select(Gene, delabel) 
    #%>%
    #  top_n(10)
    fullgenes <- rbind(upgenes, downgenes)
    res.data <- left_join(res.data, fullgenes, by = "Gene")

ggplot(res.data,
       aes(
         x = log2FoldChange,
         y = -log10(padj),
         col = diffexpressed,
         label = delabel
       )) +
  geom_point(alpha = 0.5) +
  #      xlim(-5, 5) +
  theme_classic() +
  scale_color_manual(name = "Expression", values = c(color1, color3, color2)) +
    
    geom_text_repel(
      data = subset(res.data, padj <= 0.05),
      max.overlaps  = 15,
      show.legend = F,
      min.segment.length = Inf,
      seed = 42,
      box.padding = 0.5
    ) +
# geom_text_repel(
#       data = res.data,
#     aes(size = 0.5, point.size = 0.5),
#     max.overlaps = 25,
#     force_pull   = 0,
#     min.segment.length = 0.5,
#     show.legend = F,
#     seed = 11,
#     box.padding = 0.5
#   ) +
  ggtitle(ChartTitle) +
  xlab(paste("log2 fold change")) +
  ylab("-log10 pvalue (adjusted)") +
  theme(legend.text.align = 0)
}


rat2humanID <- function(myGenes = ratGeneList){
  rat_to_human_orthologs <- read.delim("/work/LAS/geetu-lab/arnstrm/PLAC1_placenta_13.5/assets/rat_to_human_orthologs.tsv")
  humanGenes <- rat_to_human_orthologs[rat_to_human_orthologs$Gene.stable.ID %in% myGenes,]
  unique(humanGenes$Human.gene.stable.ID[humanGenes$Human.gene.stable.ID != ""])
}

rat2humanName <- function(myGenes = ratGeneList){
  rat_to_human_orthologs <- read.delim("/work/LAS/geetu-lab/arnstrm/PLAC1_placenta_13.5/assets/rat_to_human_orthologs.tsv")
  humanGenes <- rat_to_human_orthologs[rat_to_human_orthologs$Gene.stable.ID %in% myGenes,]
  unique(humanGenes$Human.gene.name[humanGenes$Human.gene.name != ""])
}

  
# plotTE <- function(inputGenes = gene.list,
#                    myColor = "color",
#                    myDB = "",
#                    myOrganism = "Mus Musculus") {
#   gs <-
#     GeneSet(geneIds = inputGenes,
#             organism = myOrganism,
#             geneIdType = SymbolIdentifier())
#   output <- teEnrichment(inputGenes = gs, rnaSeqDataset = 3)
#   en.output <-
#     setNames(data.frame(assay(output[[1]]),
#                         row.names = rowData(output[[1]])[, 1]),
#              colData(output[[1]])[, 1])
#   en.output$Tissue <- rownames(en.output)
#   logp <- -log10(0.05)
#   en.output <-
#     mutate(en.output,
#            significance = ifelse(Log10PValue > logp,
#                                  "colored", "nocolor"))
#   en.output$Sig <- "NA"
#   ggplot(en.output, aes(reorder(Tissue, Log10PValue),
#                         Log10PValue,
#                         fill = significance)) +
#     geom_bar(stat = 'identity') +
#     theme_clean() + ylab("- log10 adj. p-value") + xlab("") +
#     scale_fill_manual(values = c("colored" = myColor, "nocolor" = "gray")) +
#     scale_y_continuous(expand = expansion(mult = c(0, .1)),
#                        breaks = scales::pretty_breaks()) +
#     coord_flip()
# }

plotEnrichR <- function(enriched, table="string", myColor = "slateblue") {
  logp <- -log10(0.05)
  myData <- enriched[[table]]
  myData$negLogP <-  -log10(myData$P.value)
  myData <-
    mutate(myData,
           significance = ifelse(negLogP > logp, "colored", "nocolor"))
  myData$Sig <- "NA"
  myData <- head(arrange(myData, -negLogP, Term), 15)
  ggplot(myData, aes(reorder(Term, negLogP),
                     negLogP,
                     fill = significance)) +
    geom_bar(stat = 'identity') +
    theme_clean() + ylab("- log10 p-value") + xlab("") +
    scale_fill_manual(values = c("colored" = myColor, "nocolor" = "gray")) +
    scale_y_continuous(expand = expansion(mult = c(0, .1)),
                       breaks = scales::pretty_breaks()) +
    coord_flip()
}

teRo.cy <- readRDS("/work/LAS/geetu-lab/arnstrm/PlacentaEnrich/te.dataset.CyRo.rds")
teRo.hs <- readRDS("/work/LAS/geetu-lab/arnstrm/PlacentaEnrich/te.dataset.HsRo.rds")
teXi <- readRDS("/work/LAS/geetu-lab/arnstrm/PlacentaEnrich/te.dataset.xiang.rds")
teZp <- readRDS("/work/LAS/geetu-lab/arnstrm/PlacentaEnrich/te.dataset.castel.rds")
teVt <- readRDS("/work/LAS/geetu-lab/arnstrm/PlacentaEnrich/te.dataset.vt.rds")
md.ro <- read.csv("/work/LAS/geetu-lab/arnstrm/PlacentaEnrich/md-ro.tsv", sep = "\t", header = TRUE, row.names = 1)
md.xi <- read.csv("/work/LAS/geetu-lab/arnstrm/PlacentaEnrich/md-xi.tsv", sep = "\t", header = TRUE, row.names = 1)
md.zp <- read.csv("/work/LAS/geetu-lab/arnstrm/PlacentaEnrich/md-zp.tsv", sep = "\t", header = TRUE, row.names = 1)
md.vt <- read.csv("/work/LAS/geetu-lab/arnstrm/PlacentaEnrich/md-vt.tsv", sep = "\t", header = TRUE, row.names = 1)

plotPCE <-
  function(inputGenes = inputGenes,
           dataBG = teZp,
           cellInfo = md.zp,
           myColor = "blue") {
    logp <- -log10(0.05)
    gs <- GeneSet(unique(inputGenes))
    enOut <- teEnrichmentCustom(gs, dataBG)
    enTableOut <-
      setNames(data.frame(assay(enOut[[1]]), row.names = rowData(enOut[[1]])[, 1]),
               colData(enOut[[1]])[, 1])
    enTableOut$Tissue <- rownames(enTableOut)
    enTableOut <- enTableOut[order(-enTableOut$Log10PValue), ]
    enTableOut <-
      merge(enTableOut, cellInfo, by = "row.names", all.x = TRUE)
    enTableOut <- rownames_to_column(enTableOut, var = "Name") %>%
      mutate(significance = ifelse(Log10PValue > logp, "colored", "nocolor")) %>%
      arrange(desc(Log10PValue)) %>%
      dplyr::slice(1:10)
    ggplot(enTableOut, aes(reorder(CellNames, Log10PValue),
                           Log10PValue, fill = significance)) +
      geom_bar(stat = 'identity') +
      theme_clean() + ylab("- log10 p-value") + xlab("") +
      scale_fill_manual(values = c("colored" = myColor, "nocolor" = "gray")) +
      scale_y_continuous(expand = expansion(mult = c(0, .1)),
                         breaks = scales::pretty_breaks()) +
      coord_flip()
  }






