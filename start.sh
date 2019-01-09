#!/bin/bash

IP="${ServerIP:-'0.0.0.0'}"

cp /app/AdGuardHome .
./AdGuardHome --host ${IP}
