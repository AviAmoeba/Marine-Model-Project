# StrathE2E2 Harvest-Ratio Feasibility Pipeline

Author: Avinash Pothuri

A computational pipeline developed in R for investigating whether specified harvest-ratio targets can be achieved within the StrathE2E2 ecosystem model by adjusting fishing-gear activity values.

## Overview

The project formulates the relationship between fishing activity and harvest ratios as a constrained linear system:

$$
\mathbf{M}\mathbf{x}=\mathbf{y}, \qquad \mathbf{x}\geq0
$$

where M is the contribution matrix, x represents fishing-gear activity values, and y contains the target harvest ratios.

The pipeline determines whether an exact non-negative solution exists. When an exact solution cannot be found, it calculates the closest feasible solution using non-negative least squares (NNLS).

## Key Methods

The project combines several approaches to investigate solution feasibility:

- Linear system solving — analytical solutions for simple and square systems.
- Non-negative optimisation — NNLS and constrained optimisation for infeasible or underdetermined systems.
- Graph decomposition — bipartite graphs are used to identify independent groups of fishing gears and guilds.
- Connectivity analysis — investigates how strongly fishing gears overlap in the guilds they affect.
- Bridge analysis — identifies power relationships whose removal can alter the structure and feasibility of the system.
- Harvest-ratio leverage — identifies constraints with the greatest influence on the fitted solution.
- Power sensitivity analysis — measures how changes to individual fishing-power values affect model error.
- Power-combination analysis — investigates combinations of power relationships that can be removed while retaining a feasible solution.
- SSR analysis — uses the Sum of Squared Residuals to quantify the distance between target and predicted harvest ratios.

## Workflow

StrathE2E2 Model 
|
v
Contribution Matrix | v Graph-Based Decomposition | v Remove Redundant Constraints | v Analytical / Exact Solutions | v Non-Negative Optimisation | v SSR & Solution Assessment | v Connectivity, Bridge & Sensitivity Analysis
The final analysis brings these methods together to investigate how far the model is from an exact solution and which structural or parameter changes have the greatest potential to improve feasibility.

## R Packages

The project is implemented in R and uses packages including:

- StrathE2E2
- igraph
- lpSolve
- nloptr
- nnls
- bvls
- ggplot2
- knitr
- patchwork
- Model

The examples use the North Sea StrathE2E2 model (2003–2013).

## Acknowledgements

I would like to sincerely thank Dr Jack Laverick and Dr Douglas Speirs for their help, guidance, and supervision throughout this project.

I would also like to thank Professor Michael Heath for giving me the opportunity to undertake this project.

## Author

Avinash Pothuri
