#!rsc by RouterOS
# RouterOS script: leds-night-mode
# Copyright (c) 2013-2025 Christian Hesse <mail@eworm.de>
# https://git.eworm.de/cgit/routeros-scripts/about/COPYING.md
#
# disable LEDs
# https://git.eworm.de/cgit/routeros-scripts/about/doc/leds-mode.md

/system/leds/settings/set all-leds-off=immediate;
