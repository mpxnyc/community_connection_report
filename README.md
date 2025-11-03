# MPX NYC: Reproducible Research Repository

> Source code and analytic workflow for the MPX NYC / RESPND-MI study — a rapid, community-led response to the 2022 mpox outbreak among queer and trans New Yorkers. This repository contains the Quarto book, data-processing pipeline, and supporting R functions used to generate the public report at [https://mpxresponse.org.](https://mpxresponse.org)

## Overview

This repository integrates documentation, data processing, and analytical code in one reproducible research environment. It was built with the following goals:

-   Combine **narrative and analysis** in a single Quarto book project\
-   Support **reproducible pipelines** through the `targets` package\
-   Enable **open collaboration** among community, academic, and technical partners\

The repository doubles as both a **Quarto publication** and a **computational analysis project**.

## Directory Structure

### Core analytical and configuration files

| Path            | Description                                            |
|-----------------|--------------------------------------------------------|
| `_quarto.yml`   | Master Quarto configuration for book rendering         |
| `_targets.yaml` | Defines the reproducible data pipeline via `{targets}` |
| `_config.json`  | Settings for computation and rendering, data filepaths |

### Analytical and support folders

| Folder | Purpose |
|------------------------------------|------------------------------------|
| `R_functions/` | Custom R functions for data processing, visualization, and network generation |
| `targets/` | Pipeline objects and cache produced by `{targets}` |
| `_data/` | Survey data |
| `_extensions/` | Quarto extensions and custom shortcodes |
| `_const/` | Graphics, emojis, bibliography, scss file |

### Quarto content

Each numbered or lettered folder corresponds to a section of the published MPX NYC Report.

| Folder                     | Section                                        |
|------------------------------------|------------------------------------|
| `1_introduction/`          | Project background and study overview          |
| `2_methods/`               | Survey design, measures, and analytic approach |
| `3_results/`               | Main study findings                            |
| `4_discussion/`            | Interpretation and implications                |
| `A_ssnac1_context/`        | SSNAC I: Context                               |
| `B_ssnac2_description/`    | SSNAC II: Description                          |
| `C_ssnac3_causality/`      | SSNAC III: Causality                           |
| `F_organizing/`            | RESPND-MI: Organizing                          |
| `E_marketing_comm/`        | RESPND-MI: Marketing                           |
| `D_ssnac3_measurement/`    | MPX NYC: Measurement                           |
| `G_supplementary_results/` | MPX NYC: Results                               |
| `images/`                  | Figures, diagrams, and static image assets     |

### Entry points

| File        | Description                            |
|-------------|----------------------------------------|
| `index.qmd` | Main entry point for the Quarto site   |
| `README.md` | Overview for collaborators (this file) |

## Running the Analysis

### 1. Install Dependencies

``` r
install.packages(c(
  "cowplot",
  "dplyr",
  "ggforce",
  "ggimage",
  "ggplot2",
  "ggraph",
  "grid",
  "gt",
  "gtsummary",
  "here",
  "igraph",
  "knitr",
  "labelled",
  "latex2exp",
  "lubridate",
  "magick",
  "purrr",
  "remotes",
  "rlang",
  "scales",
  "sf",
  "stringr",
  "targets",
  "tidygraph",
  "tidyjson",
  "tidyr",
  "uuid"
))

remotes::install_github("mpxnyc/mpxnyc")
```

### 2. Rebuild the Data Pipeline

``` r
Run targets::tar_source("R_functions") in the root folder
Then run targets::tar_make() in the root folder
```

This command regenerates all intermediate objects, figures, and derived data required by the Quarto report.

### 3. Render the Report

From the project root:

``` bash
quarto render .
```

The compiled HTML files will appear under `_book/` (or `docs/` if configured for GitHub Pages).

## Reproducibility

All analytic steps are defined in `_targets.yaml` and associated scripts in `R_functions/`.\
Each Quarto chapter can be compiled independently or as part of the complete book.\
Dependencies are managed through `targets`.

## Collaboration

To contribute:

1.  Fork the repository and create a new branch.
2.  Add or modify Quarto sections, R functions, or documentation.
3.  Ensure the Quarto book compiles without errors (`quarto render`).
4.  Submit a pull request describing the changes.

All contributions should follow the principles of **community accountability**, **transparency**, and **reproducibility**.

## Citation

Makofane K, et al. *MPX NYC: A Community-Led Study of Networks, Outbreaks, and Connection.*\
RESPND-MI, 2025. <https://mpxnycreport.netlify.app>

## Maintainers

**Principal Investigator:** [Keletso Makofane, MPH, PhD](https://keletsomakofane.com)\
**Contact:** admin\@controlf.info

## Acknowledgments

We thank the participants and collaborators whose work and trust made this project possible.\
*“Community is a form of infrastructure. This project shows what happens when we treat it that way.”*
