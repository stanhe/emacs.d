#!python

import ctypes
import sys

ctypes.windll.user32.MessageBoxW(0, ' '.join(sys.argv[1:]), "Notice!", 64)
