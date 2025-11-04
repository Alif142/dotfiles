#!/usr/bin/env bash
# Simple Arch Linux system health checker
# Author: Alif’s system doctor 😎

echo "=== 🩺 Arch Linux Health Check ==="
echo

# Kernel info
echo "→ Kernel:"
uname -r
echo

# Systemd failed services
echo "→ Failed systemd units:"
if systemctl --failed --no-legend | grep -q .; then
    systemctl --failed
else
    echo "✅ No failed services"
fi
echo

# DKMS module status
if command -v dkms &>/dev/null; then
    echo "→ DKMS module status:"
    dkms status || echo "⚠️ DKMS not installed or no modules."
    echo
fi

# NVIDIA or GPU check
if lsmod | grep -q nvidia; then
    echo "→ NVIDIA module detected:"
    nvidia-smi --query-gpu=name,driver_version --format=csv,noheader 2>/dev/null || echo "⚠️ nvidia-smi unavailable."
    echo
fi

# Kernel log check
echo "→ Kernel errors and warnings (recent 20):"
sudo dmesg -T -l err,warn | tail -20 || echo "⚠️ Unable to read dmesg (need root)."
echo

# Disk SMART status (optional)
if command -v smartctl &>/dev/null; then
    echo "→ Disk SMART quick check:"
    sudo smartctl -H /dev/nvme0n1 2>/dev/null | grep -E "SMART overall-health|PASSED|FAILED" || echo "No SMART info (non-NVMe or unsupported)."
    echo
fi

echo "✅ Health check complete!"

