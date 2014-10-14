from Tkinter import *
import subprocess




def hello():
    print('hello')

def about():
    w = Label(root,text="The developer\nfuyunbiyi\nfyby website\nhttp://   www.")
    w.pack(side=TOP)

def installMin():
    w = Label(root,text="The meanings of these options:\nMin: Install LAMMPS with package MEAM and REAX\nAll:\nhttp://www.")
    w.pack(side=TOP)
    print('Install LAMMPS with package MEAM and REAX, please wait...')
    subprocess.call(["chmod","+x","./installClass.sh"])
    subprocess.call(["./installClass.sh"], shell=True)

    


root = Tk()
menubar = Menu(root)

#Create menu, and add them to the upmost toolbar
filemenu = Menu(menubar,tearoff=0)
filemenu.add_command(label="Min", command=installMin)
filemenu.add_command(label="All", command=hello)
filemenu.add_separator()
filemenu.add_command(label="ReadMe", command=root.quit)
menubar.add_cascade(label="Install", menu=filemenu)
w = Label(root,text="The meanings of these options:\nMin: Install LAMMPS with package MEAM and REAX\nAll: Install LAMMPS with all the packages\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nCurrently there is only one button working: Min")
w.pack(side=TOP)

#Create another menu: Test
editmenu = Menu(menubar, tearoff=0)
editmenu.add_command(label="Basic", command=hello)
editmenu.add_command(label="Ex_01", command=hello)
editmenu.add_command(label="Ex_02", command=hello)
menubar.add_cascade(label="Test Sample",menu=editmenu)

#Create menu: Help
helpmenu = Menu(menubar, tearoff=0)
helpmenu.add_command(label="About", command=about)
menubar.add_cascade(label="Help", menu=helpmenu)

#Show the menu
root.config(menu=menubar)

mainloop()

# ref: http://www.cnblogs.com/fuyunbiyi/archive/2012/06/13/2548497.html
# http://thinkingtkinter.sourceforge.net/
