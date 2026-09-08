# Contributing

## Workflow

1. Create a branch for one focused change.
2. Keep entry-point scripts in `src/` and reusable operations in functions.
3. Document input assumptions, random seeds, and parameter choices.
4. Test changes with `examples/input/lap.png` and at least one additional RGB image.
5. Include before-and-after metrics or screenshots when output quality changes.

## MATLAB checks

```matlab
addpath("src")
checkcode("src/Run_PCA_Compression.m")
checkcode("src/Run_kMeans_Compression.m")
```

Do not replace the archived report or presentation without explaining why. Avoid committing MATLAB autosave files or unrelated generated images.
