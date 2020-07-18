#/bin/zsh
curl -v -d '{"string":"The quick brown fox jumped over the lazy brown dogs"}' -H "Content-Type: application/json" -X POST http://localhost:16000/v1/string/reverse
echo ""

