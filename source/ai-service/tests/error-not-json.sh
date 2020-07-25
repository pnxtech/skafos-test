#!/bin/zsh
curl -v -d "{\"string\":\"$1\"}" -X POST http://localhost:15000/v1/string/reverse
echo ""
