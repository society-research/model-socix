# Model: SOCIX

The ODD model description can be found in [this extended
abstract](https://drive.google.com/file/d/1dZB0H_dPsCGyOyWuw6grYNY8NA7p-uyJ/view?usp=sharing).

## Overview
Adapted from the [flamegpu2 template](https://github.com/FLAMEGPU/FLAMEGPU2_example_template).
See FLAME GPU 2 [user guide & api documentation](https://docs.flamegpu.com/) for more information.

- `./cmake`: cmake build files
- `./src`: model source code
- `./ana`: analysis code

### Requirements
All dependencies to FLAME GPU 2
[FLAMEGPU2](https://github.com/FLAMEGPU/FLAMEGPU2) apply to this project, as
FLAMEGPU2 is downloaded via CMake and configured as a dependency of the
project.

## Building

### Linux
```bash
make
```

### Docker
```bash
docker-compose up
```
