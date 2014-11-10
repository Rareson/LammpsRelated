# use this as:
# import gui.LrBase.experiment as expLr



import subprocess

scriptName = "./demo/ex02_elastic/ex02.input"
lammpsPath = "./compile/compiled/lmp_serial"
atomEyePath = "./tools/AtomEye"
dumpName = "./demo/ex02_elastic/dump.comp_0.cfg"

def TargetScript(sName):
    scriptName = sName


def LammpsPath(lPath):
    lammpsPath = lPath

def AtomEyePath(aePath):
    atomEyePath = aePath

def DumpFile(dName):
    dumpName = dName

def RunExperiment(scriptName, lammpsPath):
    subprocess.call("%s < %s"% (lammpsPath, scriptName), shell=True)

def VisualizeExperiment(dumpName, atomEyePath):
    subprocess.call("%s %s"% (atomEyePath, dumpName), shell=True)

def BrowseTargetScript(sName):
    scriptName = sName
