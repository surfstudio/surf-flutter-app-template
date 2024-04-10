#!/usr/bin/env bash

fvm flutter gen-l10n
fvm dart format -l 120 lib/l10n
