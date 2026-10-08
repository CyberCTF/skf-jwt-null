#!/bin/sh
# User/user gets a JWT from /auth.
set -e
H=http://web:5000
curl -fsS -H "Content-Type: application/json" -d '{"username":"user","password":"user"}' "$H/auth" | grep -q access_token
