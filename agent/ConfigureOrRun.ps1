converter para powhershell

echo Starting $(pwd)/configureOrRun.sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
work_dir="$DIR/_works/$(hostname)"

unset DOCKER_PASSWORD
unset DOCKER_USERNAME

if ! [ -d $work_dir ]; then
  echo Executing agent config...
  . $DIR/configureAndRun.sh
else
  echo Executando background agent...
  . $DIR/runAgent.sh
fi
