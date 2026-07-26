Analyze the server logs located at /app/logs.txt. 
Parse the log entries to identify any "[ERROR]" statuses. 

Calculate the overall error rate (total error logs divided by total logs).
Write your results to a JSON file at "/app/report.json" with the key "error_rate".

Success criteria:
1. Generate /app/report.json.
2. The JSON output must contain the exact error rate as a float under the key "error_rate".
