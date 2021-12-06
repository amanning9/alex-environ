#!/usr/bin/python3

import sys
import yaml


def default_ctor(loader, tag_suffix, node):
    return tag_suffix + ' ' + node.value


yaml.add_multi_constructor('', default_ctor, Loader=yaml.FullLoader)

data = sys.stdin.read()

yobject = yaml.load(data, Loader=yaml.FullLoader)

tidyyaml = yaml.dump(yobject,
                     default_flow_style=False,
                     explicit_start=True,
                     width=50,
                     indent=4)

print(tidyyaml)
