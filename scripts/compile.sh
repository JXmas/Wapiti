DIR=$( cd `dirname $BASH_SOURCE[0]`  && pwd )
cd $DIR  
cd ../
PROJECT_ROOT=$(pwd)

export WAPITI_INSTALL_DIR=$PROJECT_ROOT/dist
setenv_filename="setenv-wapiti.sh"


mkdir $WAPITI_INSTALL_DIR
pushd $WAPITI_INSTALL_DIR
  echo 'DIR=$( cd `dirname $BASH_SOURCE[0]`  && pwd )'   >  $setenv_filename
  echo 'export WAPITI_INSTALL_DIR=$DIR'   >>  $setenv_filename
  echo "export LD_LIBRARY_PATH=$WAPITI_INSTALL_DIR/lib:$LD_LIBRARY_PATH"   >>  $setenv_filename
popd


mkdir build
cd build
  cmake ..
  make
  make install
