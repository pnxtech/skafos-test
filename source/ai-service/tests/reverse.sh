#/bin/zsh
curl -v -d "{\"string\":\"$1\"}" -H "Content-Type: application/json" -X POST http://localhost:15000/v1/string/reverse
echo ""

