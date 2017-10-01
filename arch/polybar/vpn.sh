#!/bin/bash
curl -s ovpn-ip.info | grep -q "Connected to" && echo "#57e500" || echo "#e50000"
