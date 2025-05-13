Creates and executable and an installer for NoiseModelling

To use :

- Install Autoit (https://www.autoitscript.com/site/)
- Install InnoSetup (https://jrsoftware.org/isinfo.php)
- Download and extract the jdk-11 folder (https://download.java.net/openjdk/jdk11/ri/openjdk-11+28_windows-x64_bin.zip)
- cd in the jdk-11/bin folder and run `./jlink.exe --no-header-files --no-man-pages --compress=2 --add-modules java.base,java.compiler,java.datatransfer,java.desktop,java.instrument,java.logging,java.management,java.management.rmi,java.naming,java.net.http,java.prefs,java.rmi,java.scripting,java.se,java.security.jgss,java.security.sasl,java.smartcardio,java.sql,java.sql.rowset,java.transaction.xa,java.xml,java.xml.crypto,jdk.accessibility,jdk.aot,jdk.attach,jdk.charsets,jdk.compiler,jdk.crypto.cryptoki,jdk.crypto.ec,jdk.crypto.mscapi,jdk.dynalink,jdk.editpad,jdk.hotspot.agent,jdk.httpserver,jdk.internal.ed,jdk.internal.jvmstat,jdk.internal.le,jdk.internal.opt,jdk.internal.vm.ci,jdk.internal.vm.compiler,jdk.internal.vm.compiler.management,jdk.jartool,jdk.javadoc,jdk.jcmd,jdk.jconsole,jdk.jdeps,jdk.jdi,jdk.jdwp.agent,jdk.jfr,jdk.jlink,jdk.jshell,jdk.jsobject,jdk.jstatd,jdk.localedata,jdk.management,jdk.management.agent,jdk.management.jfr,jdk.naming.dns,jdk.naming.rmi,jdk.net,jdk.pack,jdk.rmic,jdk.scripting.nashorn,jdk.scripting.nashorn.shell,jdk.sctp,jdk.security.auth,jdk.security.jgss,jdk.unsupported,jdk.unsupported.desktop,jdk.xml.dom,jdk.zipfs --output ../../java-min-11` [TODO : curate the list to strictly needed modules]
- Download and extract the NoiseModelling zip (https://github.com/Ifsttar/NoiseModelling/releases/download/v5.0.0/NoiseModelling_5.0.0.zip)

1. Compile the au3 using Autoit. You should get a NoiseModelling.exe file
2. Compile the installer.iss file using InnoSetup. You should get the NoiseModelling_X.Y.Z_install.exe

If you change the jre version or the NoiseModelling version, you'll need to edit the au3 script and the iss script accordingly.

