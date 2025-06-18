#!/bin/bash

PLAYGROUND_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
ECOSYSTEM_DIR="$PLAYGROUND_ROOT/lf-ecosystem"

if [ ! -d "$ECOSYSTEM_DIR/lingua-franca" ]; then
    echo "Error: LF ecosystem not found. Run setup-lf-dev-ecosystem.bash first."
    return 1
fi

export LF_PATH="$ECOSYSTEM_DIR/lingua-franca"

export PATH="$LF_PATH/cli/lfc/build/install/lfc/bin:$LF_PATH/cli/lfd/build/install/lfd/bin:$LF_PATH/cli/lff/build/install/lff/bin:$PATH"

export REACTOR_C_PATH="$ECOSYSTEM_DIR/reactor-c"
export REACTOR_CPP_PATH="$ECOSYSTEM_DIR/reactor-cpp" 
export REACTOR_TS_PATH="$ECOSYSTEM_DIR/reactor-ts"
export LF_PYTHON_SUPPORT_PATH="$ECOSYSTEM_DIR/lf-python-support"

echo "LF development environment activated!"
echo "LF_PATH: $LF_PATH"
echo "Using source-built LF toolchain from: $LF_PATH/cli/*/build/install/*/bin"

if command -v lfc >/dev/null 2>&1; then
    echo "lfc version: $(lfc --version)"
else
    echo "Warning: lfc not found in PATH"
fi
