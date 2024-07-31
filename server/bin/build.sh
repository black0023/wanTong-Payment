cd ..
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build paymentServer
echo "[Build Payment Taker Server Success ]"
cp -r paymentServer ./bin/build
echo "[Copy Payment Taker Server Success ]"