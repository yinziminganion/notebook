from __future__ import print_function
import os

os.chdir(r'D:\dt')
filess = os.listdir(os.getcwd())
for item in filess:
    print(item)