```bash
#!/bin/bash

# =====================================
# Swap Space Creation Script
# Student Name:
# Roll Number:
# =====================================

SWAP_FILE="/swapfile"
SWAP_SIZE="1G"

echo "====================================="
echo " Swap Space Creation"
echo "====================================="

# 1. Check current swap status
echo "[1] Current swap status:"
swapon --show

# 2. Create swap file
echo "[2] Creating ${SWAP_SIZE} swap file..."
sudo fallocate -l "${SWAP_SIZE}" "${SWAP_FILE}"

# 3. Set correct permissions
echo "[3] Setting swap file permissions..."
sudo chmod 600 "${SWAP_FILE}"

# 4. Format the file as swap
echo "[4] Creating swap filesystem..."
sudo mkswap "${SWAP_FILE}"

# 5. Enable swap
echo "[5] Enabling swap..."
sudo swapon "${SWAP_FILE}"

# 6. Make swap permanent after reboot
echo "[6] Adding swap entry to /etc/fstab..."
if ! grep -q "^${SWAP_FILE}[[:space:]]" /etc/fstab; then
    echo "${SWAP_FILE} none swap sw 0 0" | sudo tee -a /e_
```
