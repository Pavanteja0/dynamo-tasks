#!/bin/bash
python -c '
import json
with open("/app/logs.txt", r") as f:
    lines = f.readlines()
total = len(lines)
errors = sum(1 for line in lines if "[ERROR" in line)
rate = errors / total if total > 0 else 0.0
with open("/app/report.json", "w") as f:
    json.dump({"error_rate": rate}, f)
'
