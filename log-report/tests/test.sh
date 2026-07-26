#!/bin/bash
set +e
mkdir -p /logs/verifier

python -m pytest /tests/test_outputs.py --json-ctrf /logs/verifier/ctrf.json
RESULT=$?

if [ $RESULT -eq 0 ]; then
  echo "1" > /logs/verifier/reward.txt
else
  echo "0" > /logs/verifier/reward.txt
fi

exit $RESULT
