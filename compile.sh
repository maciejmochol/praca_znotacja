#!/bin/sh

latex praca_magisterska.tex
dvips -Ppdf -G0 praca_magisterska.dvi -o praca_magisterska.ps
