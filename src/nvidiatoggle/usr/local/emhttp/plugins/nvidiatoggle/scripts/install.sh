#!/bin/bash

QEMU=/etc/libvirt/hooks/qemu
QEMUDFILE=/etc/libvirt/hooks/qemu.d/NvidiaToggle

# Check qemu.d exists if not create.
[ ! -d "/etc/libvirt/hooks/qemu.d" ] && mkdir /etc/libvirt/hooks/qemu.d

# Create USB_Manager File.
cat << EOF > $QEMUDFILE
#!/usr/bin/env php

<?php

#begin NvidiaToggle
    shell_exec("/usr/local/emhttp/plugins/NvidiaToggle/scripts/nvidiatoggle '{\$argv[1]}' {\$argv[2]} {\$argv[3]} {\$argv[4]}  >/dev/null 2>&1 & disown");
#end NvidiaToggle

?>
EOF

chmod +x $QEMUDFILE