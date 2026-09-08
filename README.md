# Image Compression Using K-Means and PCA

## Overview

This MATLAB project implements and compares two lossy image-compression approaches:

- **K-means colour quantization** reduces the number of RGB colours used by an image.
- **Principal component analysis (PCA)** reconstructs each colour channel with a smaller set of principal components.

The implementations use MATLAB matrix operations and project-specific helper functions rather than a machine-learning library.

## Repository Structure

```text
ImageCompression-Using-Kmeans-PCA/
├── src/                    # MATLAB entry points and helper functions
├── examples/
│   ├── input/lap.png       # Sample input
│   └── output/             # Reference PCA reconstructions
├── docs/
│   ├── project-report.docx
│   └── presentation.pptx
├── CONTRIBUTING.md
└── README.md
```

## Quick Start

### Prerequisites

- MATLAB
- Image Processing Toolbox for image reading, writing, conversion, and display

Run all commands from the repository root.

### PCA compression

```matlab
addpath("src")
Run_PCA_Compression
```

Use these values to reproduce the included example:

```text
Enter File Name: 'examples/input/lap'
Enter File Format: 'png'
Enter different numbers of principal components: [2 10 100]
```

The script processes the red, green, and blue channels independently and writes each reconstruction beside the selected input image.

### K-means compression

```matlab
addpath("src")
rng(0)
Run_kMeans_Compression
```

Example responses:

```text
Enter File Name: 'examples/input/lap'
Enter File Format: 'png'
Enter different K values: [8 16 32]
Enter the maximum iterations: 20
```

Setting the random seed makes centroid initialization reproducible. K-means output files are also written beside the selected input image.

## Example PCA Results

| Original | 2 components | 10 components | 100 components |
|---|---|---|---|
| ![Original input](examples/input/lap.png) | ![PCA reconstruction with 2 components](examples/output/lap_Compressed_2_PCs.png) | ![PCA reconstruction with 10 components](examples/output/lap_Compressed_10_PCs.png) | ![PCA reconstruction with 100 components](examples/output/lap_Compressed_100_PCs.png) |

The report concludes that K-means is preferable when reducing the number of stored colours, while PCA better preserves the image's overall colour appearance. The best setting depends on the desired balance between visual quality and representation size.

## Project Team

The report and presentation credit:

- K. Vishnu Sainadh
- K. Satwik
- V. Ashrith

The archived material does not assign individual implementation roles, so no person-specific role claims are made here.

## Documentation

- [Project report](docs/project-report.docx)
- [Presentation](docs/presentation.pptx)

## Contributing

Improvements to numerical stability, evaluation metrics, examples, or documentation are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

No open-source license has been declared for this repository. The source is publicly visible for educational and reference purposes; obtain permission from the repository owner before reuse or redistribution.
