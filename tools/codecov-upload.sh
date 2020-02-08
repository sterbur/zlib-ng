#!/bin/sh
set -ux
cd "$CODECOV_DIR"
python -m codecov --required --flags "$CODECOV_FLAGS" --name "$CODECOV_NAME" --gcov-exec="$CODECOV_EXEC"
if [ $? -ne 0 ]; then
  sleep 5
  python -m codecov --required --flags "$CODECOV_FLAGS" --name "$CODECOV_NAME" --gcov-exec="$CODECOV_EXEC"
fi
if [ $? -ne 0 ]; then
  sleep 30
  python -m codecov --required --flags "$CODECOV_FLAGS" --name "$CODECOV_NAME" --gcov-exec="$CODECOV_EXEC"
fi
if [ $? -ne 0 ]; then
  sleep 90
  python -m codecov --required --flags "$CODECOV_FLAGS" --name "$CODECOV_NAME" --gcov-exec="$CODECOV_EXEC"
fi
exit $?
