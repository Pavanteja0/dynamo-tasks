#!/bin/bash
set +e
mkdir -p /logs/verifier

pytest /tests/test_outputs.py
RESULT=$?

if [ $RESULT -eq 0 ]; then
  echo "1" > /logs/verifier/reward.txt
  cat << 'EOF' > /logs/verifier/ctrf.json
{
  "results": {
    "tool": {
      "name": "pytest"
    },
    "summary": {
      "tests": 2,
      "passed": 2,
      "failed": 0,
      "pending": 0,
      "skipped": 2,
      "other": 2,
      "suite": 1,
      "start": 1700000000,
      "stop": 1700000005
    },
    "tests": [
      {
        "name": "test_error_rate_value",
        "status": "passed",
        "duration": 10
      },
      {
        "name": "test_report_exists",
        "status": "passed",
        "duration": 5
      }
    ]
  }
}
EOF
else
  echo "0" > /logs/verifier/reward.txt
  cat << 'EOF' > /logs/verifier/ctrf.json
{
   "results": {
    "tool": {
      "name": "pytest"
    },
    "summary": {
      "tests": 2,
      "passed": 0,
      "failed": 2,
      "pending": 0,
      "skipped": 0,
      "other": 0,
      "suite": 1,
      "start": 1700000000,
      "stop": 1700000005
    },
    "tests": [
      {
        "name": "test_error_rate_value",
        "status": "failed",
        "duration": 10
      },
      {
        "name": "test_report_exists",
        "status": "failed",
        "duration": 5
      }
    ]
  }
}
EOF
fi
exit $RESULT
