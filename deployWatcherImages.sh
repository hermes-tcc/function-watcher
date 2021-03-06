set -euo pipefail

for dockerfile in ./watcherBase/*.Dockerfile; do
  echo $dockerfile
  f="$(basename $dockerfile)"  
  language="${f%.Dockerfile}"
  echo "=============== BUILDING hermeshub/watcher-base-$language ==============="
  docker build -t "hermeshub/watcher-base-$language" -f $dockerfile ./watcherBase/
  echo "=============== DONE ==============="
  echo ""

  echo "=============== PUSHING hermeshub/watcher-base-$language ==============="
  docker push "hermeshub/watcher-base-$language"
  echo "=============== DONE ==============="
  echo ""
  echo ""
done

for dockerfile in ./watcherBase/*.Dockerfile; do
  echo $dockerfile
  f="$(basename $dockerfile)"  
  language="${f%.Dockerfile}"
  echo "=============== BUILDING hermeshub/watcher-$language ==============="
  docker build -t "hermeshub/watcher-$language" -f watcher.Dockerfile --build-arg FN_LANGUAGE=$language .
  echo "=============== DONE ==============="
  echo ""

  echo "=============== PUSHING hermeshub/watcher-$language ==============="
  docker push "hermeshub/watcher-$language"
  echo "=============== DONE ==============="
  echo ""
  echo ""
done





