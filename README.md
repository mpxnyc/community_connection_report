# MPX NYC: A Community-Led Study of Networks, Outbreaks, and Connection

> This repository contains the full source code, data-processing pipeline, and documentation for **MPX NYC (RESPND-MI)** — a rapid, community-led study of the 2022 mpox outbreak among queer and trans people in New York City. It includes the open-source **Person–Place Network Mapper**, the analytic **SSNAC framework** (Social and Spatial Network Analysis with Causal interpretation), and all materials used to generate the public report at [mpxnycreport.netlify.app](https://mpxnycreport.netlify.app).

## 🧭 Overview

MPX NYC was built to answer an urgent question: **How do the social and spatial networks of LGBTQ+ people shape vulnerability and resilience during an outbreak?**

Conducted under the **RESPND-MI** collective, the project combines:
- Anonymous, web-based network survey
- Spatially aggregated mapping (to census tract level)
- Community-led organizing and dissemination
- Open-source analytic and visualization tools

The study was designed and executed **by and for** the communities most affected — demonstrating that rigorous epidemiologic research can be rooted in collaboration, transparency, and care.

## 📦 Repository Contents

| Directory | Description |
|------------|-------------|
| `R_functions/` | Core functions sourced by the Quarto report (e.g., data cleaning, simulation, plotting) |
| `data/` | Survey data (anonymized and/or simulated) |
| `targets/` | Reproducible data pipeline built with [`targets`](https://docs.ropensci.org/targets/) |


## ⚙️ Installation

To install and run the analytic environment locally:

```r
# install dependencies
install.packages(c("targets", "tidygraph", "ggraph", "gt", "gtsummary", "labelled"))

# install project packages from GitHub
remotes::install_github("KeletsoMakofane/mpxnyc")
remotes::install_github("KeletsoMakofane/mpxtools")

# run data pipeline
targets::tar_make()
```

The pipeline will rebuild all derived datasets and figures required to compile the Quarto report.

## 📘 Reproducing the Report

The MPX NYC report is written in [**Quarto**](https://quarto.org). To compile locally:

```bash
quarto render .
```

This will produce a static site under `docs/`, which can be viewed locally or published to Netlify.

## 🧩 SSNAC Framework

The **Social and Spatial Network Analysis with Causal interpretation (SSNAC)** framework extends classical causal inference (NPSEM-IE, DAGs, SWIGs) to networked data. Key sections of the report describe:
- Network exposure mappings
- Homogeneous and heterogeneous interference
- Bipartite and random graph formulations
- Causal contrasts under interference

These methods are implemented through the `mpxtools` package and demonstrated throughout the SSNAC chapter.

## 🌐 The Person–Place Network Mapper

The **Mapper** is a web-based survey component that allows participants to anonymously link themselves to venues or places they visit (mapped to census tracts). The tool was designed to:
- Capture meaningful social–spatial structure without collecting identifying data
- Support outbreak modeling and vaccine targeting analyses
- Be reusable by other research coalitions

Source code and documentation for the Mapper can be found in `inst/mapper/`.

## 🧠 Citation

If you use any part of this repository or its methods, please cite:

> Makofane K, et al. *MPX NYC: A Community-Led Study of Networks, Outbreaks, and Connection.* RESPND-MI, 2025. [https://mpxnycreport.netlify.app](https://mpxnycreport.netlify.app)

## 🤝 Contributing

We welcome contributions from collaborators, community members, and researchers. You can:
- Submit pull requests for documentation or code improvements
- File issues for bugs or suggestions
- Adapt our framework for your own community or outbreak study

Before contributing, please review the `CODE_OF_CONDUCT.md` and ensure your work aligns with our principles of **community accountability** and **open science**.

## 📢 Related Projects

- [RESPND-MI Collective](https://respnd-mi.org) – the umbrella initiative for rapid community-led outbreak studies
- [ControlF](https://www.controlf.info) – training and consulting based on SSNAC methods
- [The People’s Department of Health Seminar Series](https://www.controlf.info/seminar-series) – a 4-part seminar translating these insights into practice

## 📄 License

All code in this repository is released under the **MIT License**. Text, figures, and non-code materials are licensed under **CC BY-NC-SA 4.0**.

## 🧩 Maintainers

**Principal Investigator:** [Keletso Makofane, MPH, PhD](https://keletsomakofane.com)  
**RESPND-MI Collective** — LGBTQ+ community researchers, developers, and organizers  
**Contact:** admin@controlf.info

## 🌈 Acknowledgments

We thank the thousands of queer and trans New Yorkers who made this project possible, and the collaborators who built and maintained the infrastructure for community-led science.

> *“Community is a form of infrastructure. This project shows what happens when we treat it that way.”*
