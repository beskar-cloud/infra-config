import sys

import yaml
import glob


# TODO
# This is a simple check of MAC address duplicates
# This script won't show where the duplicate is

networks = {}
networks_simple = []

files = glob.glob(sys.argv[1] + "/*.yml")


def parse_mac_addresses(ethernets) -> []:
    macs = []
    for i in ethernets:
        # print(ethernets[i]["match"]["macaddress"])
        macs.append(str(ethernets[i]["match"]["macaddress"]))
        networks_simple.append(str(ethernets[i]["match"]["macaddress"]))

    return macs

def parse_files(file):
    with open(file, 'r') as stream:
        try:
            y = yaml.safe_load(stream)
            # print(file, y["netplan"]["network"]["ethernets"])
            # print(type(y["netplan"]))
            networks[file] = parse_mac_addresses(y["netplan"]["network"]["ethernets"])
        except:
            print("error")



for file in files:
    parse_files(file)

print(networks_simple)

duplicates = {x for x in networks_simple if networks_simple.count(x) > 1}

if len(duplicates) > 0:
    print("MAC duplicates:")
    print(duplicates)
    exit(1)
else:
    print("No duplicates found.")
    exit(0)
