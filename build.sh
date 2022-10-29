set -euxo pipefail

DUNE_FLAGS="--display=short "
export OCAMLPATH="$(pwd)/_install/lib:$(pwd)/_install"

echo $OCAMLPATH

pushd pkg1
dune build -p pkg1 $DUNE_FLAGS
dune install -p pkg1 $DUNE_FLAGS  --prefix=$(pwd)/../_install
popd

pushd pkg2
dune build -p pkg2
dune install -p pkg2 --build-dir=_build --prefix=$(pwd)/../_install
popd
