#!/usr/bin/env bash

fvm flutter pub run intl_utils:generate && fvm flutter format -l 100 lib/generated
