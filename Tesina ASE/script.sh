find . -type f -name "*vhd*" -exec sed -i 's/-- /--! /g' {} +
