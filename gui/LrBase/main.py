# This is a wrapper for importing modules.
# Usage:
# from gui.LrBase.main import *

# This will keep the editing task each time regenerating the GUI python code.
# And notice that the custom slots used should be named in the .ui file,
# then the "import" and "__name__" would be the two and only two code blocks to
# add, which can be automated by modifying the mkpyqt.py to enable it automatically
# adding these two blocks.

import sys

from PyQt4.QtGui import *  
from PyQt4.QtCore import * 

import gui.LrBase.compile as compileLr


def main():
    """Provide common entrance for converted python GUI files.
    
    Currently not working since Ui_MainWindow is not global.
    
    If the problem is resolved, I guess this may be coupled with command:
    import gui.LrBase.main as mainLr
    
    in gui.py, which will simplify the invokation to mainLr.main()"""
    app = QApplication(sys.argv)
    window = QMainWindow()
    ui = Ui_MainWindow()
    ui.setupUi(window)
