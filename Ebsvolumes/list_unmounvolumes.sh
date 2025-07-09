#!/bin/bash

# List all volumes and filter out the ones that are not attached
aws ec2 describe-volumes --query "Volumes[?State=='available'].{ID:VolumeId, Size:Size, AZ:AvailabilityZone}" --output table
