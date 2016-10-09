#!/usr/bin/env sh

DOMAIN="http://localhost:9000"

getResponseCode() {
    echo $(curl -sL -w "%{http_code}\\n" "$1" -o /dev/null)
}

testCurlGets200StatusCodeAsResponseFromRootDirectory() {
    local response=$(getResponseCode "${DOMAIN}")
    assertEquals $response 200
}

testCurlGets404StatusCodeAsResponseFromInvalidPath() {
    local response=$(getResponseCode "${DOMAIN}/noExists.html")
    assertEquals $response 404
}

. shunit2-2.1.6/src/shunit2
