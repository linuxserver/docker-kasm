#! /bin/bash
drm_info -j 2>/dev/null| jq -c 'with_entries(.value |= .driver.desc)'
