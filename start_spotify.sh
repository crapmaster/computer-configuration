#!/bin/bash

# 1. Starta Spotify i bakgrunden
spotify &

# 2. Vänta på att Spotify-fönstret faktiskt skapas (max 15 sekunder)
TIMEOUT=15
while [ $TIMEOUT -gt 0 ]; do
    if wmctrl -l | grep -i "Spotify" > /dev/null; then
        break
    fi
    sleep 1
    ((TIMEOUT--))
done

# Ge fönstret en kort extra sekund att ritas upp helt
sleep 1

# 3. Gör fönstret synligt på ALLA workspaces ("sticky")
wmctrl -r "Spotify" -b add,sticky

# 4. Flytta fönstret till laptop-skärmen (position 0,0) och ge det en standardstorlek
# Format: wmctrl -r "Fönsternamn" -e g,b,x,y,w,h
# g=0 (standard), x=100, y=100 (övre vänstra hörnet), w=1280 (bredd), h=800 (höjd)
wmctrl -r "Spotify" -e 0,100,100,1280,800

