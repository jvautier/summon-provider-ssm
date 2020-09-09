#!/usr/bin/env python

import os
import sys

def write_and_flush(pipe, message):
    pipe.write(message)
    pipe.flush()

try:
    import boto3
    ssm = boto3.client('ssm')
except ImportError:
    write_and_flush(sys.stderr, '"boto3" library missing, run "pip install boto3"')
    sys.exit(1)

if __name__ == '__main__':
    if len(sys.argv) <= 1:
        write_and_flush(sys.stderr, 'No variable was provided.')
        sys.exit(1)

    variable = sys.argv[1]
    ssm_parameter = ssm.get_parameter(Name=variable,WithDecryption=True)
    value = ssm_parameter.get('Parameter').get('Value')
    if value is None:
        write_and_flush(sys.stderr, '{} could not be retrieved'.format(variable))
        sys.exit(1)

    write_and_flush(sys.stdout, value)