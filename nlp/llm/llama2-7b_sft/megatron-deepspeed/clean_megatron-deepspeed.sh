#!/bin/bash

PYTHON_PATH=$(which python3)

${PYTHON_PATH} setup.py clean || true
rm -rf build build_pip dist megatron_core.egg-info

exit 0