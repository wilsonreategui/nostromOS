#!/usr/bin/env bash
set -oue pipefail

echo "Configurando servicio de auto-crecimiento de disco..."

# Asegurarse de que las herramientas necesarias estén instaladas
# (rpm-ostree install se maneja mejor en el recipe.yml, pero aquí configuramos el servicio)

cat <<EOF > /usr/lib/systemd/system/grow-rootfs.service
[Unit]
Description=Grow root filesystem to fill partition
After=local-fs.target
ConditionFirstBoot=yes

[Service]
Type=oneshot
ExecStartPre=/usr/bin/sh -c 'if [ -x /usr/bin/growpart ]; then /usr/bin/growpart /dev/\$(lsblk -no pkname \$(findmnt -nvo source /)) \$(lsblk -no PARTNUM \$(findmnt -nvo source /)); fi'
ExecStart=/usr/bin/sh -c 'if findmnt / -nvo fstype | grep -q btrfs; then btrfs filesystem resize max /; elif findmnt / -nvo fstype | grep -q xfs; then xfs_growfs /; else resize2fs \$(findmnt -nvo source /); fi'
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

systemctl enable grow-rootfs.service
