#!/bin/zsh
curl -v -d "{\"string\":\"$1\"}" -H "Content-Type: application/json" -X POST http://localhost:16000/v1/string/reverse
echo ""

