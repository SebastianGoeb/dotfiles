#!/usr/bin/env python3

from __future__ import print_function

import argparse
import os
import subprocess
import uuid
from random import shuffle

import lxml.etree as etree


def parse_time(time_str):
    """
    converts time string to seconds
    :param time_str: time in seconds, minutes, hours, days (s, m, h, d)
    :return: seconds
    """
    multipliers = {
        's': 1,
        'm': 60,
        'h': 60 * 60,
        'd': 60 * 60 * 24
    }
    num = float(time_str[:-1])
    unit = time_str[-1]
    return round(num * multipliers[unit])


def parse_args():
    parser = argparse.ArgumentParser()

    parser.add_argument('-f', '--file', help='file or dir where wallpapers are located', required=True)
    parser.add_argument('-i', '--interval', help='e.g. 30s, 0.5m, 1h, 2d')
    parser.add_argument('-r', '--random', action='store_true')

    return parser.parse_args()


def register_file(file):
    print(os.path.abspath(file))


def collect_files(directory, random):
    files = [os.path.abspath(os.path.join(root, file)) for root, dirs, files in os.walk(directory) for file in files if not file.endswith('.xml')]
    if random:
        shuffle(files)
    return files


def gen_starttime():
    starttime = etree.Element('starttime')
    etree.SubElement(starttime, 'year').text = '1970'
    etree.SubElement(starttime, 'month').text = '01'
    etree.SubElement(starttime, 'day').text = '01'
    etree.SubElement(starttime, 'hour').text = '00'
    etree.SubElement(starttime, 'minute').text = '00'
    etree.SubElement(starttime, 'second').text = '00'
    return starttime


def gen_static(duration, file):
    static = etree.Element('static')
    etree.SubElement(static, 'duration').text = '{0:.1f}'.format(duration)
    etree.SubElement(static, 'file').text = os.path.abspath(file)
    return static


def gen_background(directory, interval, random):
    background = etree.Element('background')
    background.append(gen_starttime())
    for file in collect_files(directory, random):
        background.append(gen_static(interval, file))
    return background


def register_dir(directory, interval, random):
    slideshow_path = os.path.abspath(os.path.join(directory, str(uuid.uuid4()) + '.xml'))
    with open(slideshow_path, 'wb') as file:
        background = gen_background(directory, interval, random)
        tostring = etree.tostring(background, pretty_print=True)
        file.write(tostring)

    slideshow_uri = 'file://' + slideshow_path
    subprocess.run(['gsettings', 'set', 'org.gnome.desktop.background', 'picture-uri', slideshow_uri])
    subprocess.run(['gsettings', 'set', 'org.gnome.desktop.screensaver', 'picture-uri', slideshow_uri])


def run(file, interval, random):
    if os.path.isfile(file):
        register_file(file)
    else:
        if interval is None:
            print('Must specify -i / --interval with -d / --dir')
            exit(1)
        register_dir(file, parse_time(interval), random)


if __name__ == '__main__':
    args = parse_args()
    run(args.file, args.interval, args.random)
