Creates and executable and an installer for NoiseModelling

To use :

- Install Autoit (https://www.autoitscript.com/site/)
- Install InnoSetup (https://jrsoftware.org/isinfo.php)
- Download and extract the jdk-11 folder (https://download.java.net/openjdk/jdk11/ri/openjdk-11+28_windows-x64_bin.zip)
- Download and extract the NoiseModelling zip (https://github.com/Ifsttar/NoiseModelling/releases/download/v3.4.4/NoiseModelling_3.4.4.zip)

1. Compile the au3 using Autoit. You should get a NoiseModelling.exe file
2. Compile the installer.iss file using InnoSetup. You should get the NoiseModelling_X.Y.Z_install.exe

If you change the jre version or the NoiseModelling version, you'll need to edit the au3 script and the iss script accordingly.

