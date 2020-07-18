#/bin/zsh
curl -v -d '{"string":"The quick brown fox jumped over the lazy brown dogs"}' -H "Content-Type: application/json" -X POST http://localhost:15000/v1/string/reverse
echo ""

