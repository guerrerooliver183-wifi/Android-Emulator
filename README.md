# Android Emulator over Cloudflare Quick Tunnel

This repository provides a manually-triggered GitHub Actions workflow that starts an Android emulator with an unauthenticated browser VNC session exposed through a Cloudflare Quick Tunnel.

## Run

Open **Actions → Android Emulator VNC → Run workflow**. The workflow prints the temporary `https://*.trycloudflare.com` URL in the job log. Keep the workflow running while using the session; cancel it to stop the emulator and tunnel.

## Notes

- The tunnel URL is public and grants control of the emulator without a password. Anyone with the URL can access it while the job is running.
- The workflow uses an Ubuntu GitHub-hosted runner, Android API 35, and an x86_64 emulator.
