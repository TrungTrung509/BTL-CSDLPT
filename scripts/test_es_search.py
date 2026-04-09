import requests
import json

# Test search
query = {"query": {"match": {"TenHP": "Cơ sở dữ liệu"}}}

response = requests.post(
    "http://localhost:9200/hocphan/_search?pretty",
    json=query,
    headers={"Content-Type": "application/json; charset=utf-8"}
)

print("Status:", response.status_code)
print("Response:")
print(json.dumps(response.json(), indent=2, ensure_ascii=False))
