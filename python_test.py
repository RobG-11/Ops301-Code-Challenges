#!/usr/bin/env python3

# Main

# Import libraries

import psutil

info_item = "user"

# psutil_list = ["x", "user", "system", "idle", "nice", "iowait", "irq", "softirq", "steal", "guest", "exit"]

results = psutil.cpu_times(info_item)
print()
print(results)


# End