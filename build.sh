set -euxo pipefail

export OCAMLPATH="$(pwd)/_install/lib:$(pwd)/_install"

pushd pkg1
dune build --release --build-dir=_build @install
dune install --release --build-dir=_build --prefix=$(pwd)/../_install
popd

pushd pkg2
dune build --release --build-dir=_build @install
dune install --release --build-dir=_build --prefix=$(pwd)/../_install
popd
