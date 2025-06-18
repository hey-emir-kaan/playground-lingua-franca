#!/bin/bash
set -euo pipefail

ECOSYSTEM_DIR="lf-ecosystem"
REPOS=(
    "https://github.com/lf-lang/lingua-franca.git"
    "https://github.com/lf-lang/reactor-c.git" 
    "https://github.com/lf-lang/reactor-cpp.git"
    "https://github.com/lf-lang/reactor-ts.git"
    "https://github.com/lf-lang/lf-python-support.git"
)

echo "Setting up complete LF-Lang ecosystem from source..."

if [ -d "$ECOSYSTEM_DIR" ]; then
    echo "Removing existing $ECOSYSTEM_DIR directory..."
    rm -rf "$ECOSYSTEM_DIR"
fi
mkdir -p "$ECOSYSTEM_DIR"
cd "$ECOSYSTEM_DIR"

echo "Cloning LF-Lang ecosystem repositories..."
for repo in "${REPOS[@]}"; do
    echo "Cloning $repo..."
    git clone "$repo"
done

echo "Building lingua-franca from source..."
cd lingua-franca
git submodule update --init --recursive
./gradlew assemble
cd ..

echo "Building reactor-c runtime..."
cd reactor-c
mkdir -p build
cd build
cmake ..
make
cd ../..

echo "Building reactor-cpp runtime..."
cd reactor-cpp
mkdir -p build
cd build
cmake ..
make
cd ../..

echo "Building reactor-ts runtime..."
cd reactor-ts
npm install
npm run build
cd ..

echo "Installing lf-python-support..."
cd lf-python-support
python3 -m pip install -e .
cd ..

cd .. # Back to playground root

echo "LF ecosystem setup complete!"
echo "All repositories are available in: $ECOSYSTEM_DIR/"
echo "To use this setup, run: source utils/scripts/activate-lf-dev-env.bash"
