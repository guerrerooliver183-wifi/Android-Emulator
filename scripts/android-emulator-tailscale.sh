#!/usr/bin/env bash
set -euo pipefail

duration="${1:-30}"

case "$duration" in
  10|20|30|60|90|120|180|240|300|330) ;;
  *)
    echo "Invalid duration. Use a value from 10 to 330 minutes." >&2
    exit 1
    ;;
esac

adb wait-for-device
adb shell settings put global window_animation_scale 0
adb shell settings put global transition_animation_scale 0
adb shell settings put global animator_duration_scale 0

adb tcpip 5555
adb connect 127.0.0.1:5555 || true
adb devices

sudo tailscale serve --tcp=5555 tcp://127.0.0.1:5555 --yes
echo "Tailscale Serve status:"
tailscale serve status

echo "Keeping the emulator available for ${duration} minutes."
trap 'sudo tailscale serve reset || true' EXIT
sleep "$((duration * 60))"
