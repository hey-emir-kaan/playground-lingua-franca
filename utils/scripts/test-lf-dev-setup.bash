#!/bin/bash
set -e

echo "Testing LF development setup..."

if [ -z "$LF_PATH" ]; then
    echo "Error: LF development environment not activated. Run 'source utils/scripts/activate-lf-dev-env.bash' first."
    exit 1
fi

echo "LF_PATH: $LF_PATH"
echo "lfc location: $(which lfc)"
echo "lfc version: $(lfc --version)"

echo "Testing C target..."
cd examples/C/src
C_EXAMPLE=$(find . -name "*.lf" | head -1)
if [ -n "$C_EXAMPLE" ]; then
    echo "Compiling $C_EXAMPLE..."
    lfc "$C_EXAMPLE"
    echo "✓ C example compiled successfully"
else
    echo "⚠ No C examples found, skipping"
fi
cd - > /dev/null

echo "Testing C++ target..."
cd examples/Cpp
CPP_EXAMPLE=$(find . -name "*.lf" | head -1)
if [ -n "$CPP_EXAMPLE" ]; then
    echo "Compiling $CPP_EXAMPLE..."
    lfc "$CPP_EXAMPLE"
    echo "✓ C++ example compiled successfully"
else
    echo "⚠ No C++ examples found, skipping"
fi
cd - > /dev/null

echo "Testing Python target..."
cd examples/Python/src
PYTHON_EXAMPLE=$(find . -name "*.lf" | head -1)
if [ -n "$PYTHON_EXAMPLE" ]; then
    echo "Compiling $PYTHON_EXAMPLE..."
    lfc "$PYTHON_EXAMPLE"
    echo "✓ Python example compiled successfully"
else
    echo "⚠ No Python examples found, skipping"
fi
cd - > /dev/null

echo "✅ LF development setup verification complete!"
