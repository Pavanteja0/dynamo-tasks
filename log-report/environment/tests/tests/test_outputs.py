import json
import os

def test_report_exists():
    """1. Generate /app/report.json."""
    assert os.path.exists("/app/report.json"), "/app/report.json does not exist"

def test_error_rate_value():
    """2. The JSON output must contain the exact error rate as a float under the key 'error_rate'."""
    with open("/app/report.json", "r") as f:
        data = json.load(f)
    
    assert "error_rate" in data, "Key 'error_rate' is missing from report.json"
    assert isinstance(data["error_rate"], float), "error_rate is not a float"
    # 1 ERROR out of 8 lines total = 1/8 = 0.125
    assert data["error_rate"] == 0.125, f"Expected error_rate of 0.125, got {data['error_rate']}"