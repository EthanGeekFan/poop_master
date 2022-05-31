# Install script for directory: /Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/build_x86/libixwebsocket.a")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libixwebsocket.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libixwebsocket.a")
    execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libixwebsocket.a")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ixwebsocket" TYPE FILE FILES
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXBase64.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXBench.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXCancellationRequest.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXConnectionState.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXDNSLookup.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXExponentialBackoff.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXGetFreePort.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXGzipCodec.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXHttp.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXHttpClient.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXHttpServer.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXNetSystem.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXProgressCallback.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXSelectInterrupt.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXSelectInterruptFactory.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXSelectInterruptPipe.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXSelectInterruptEvent.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXSetThreadName.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXSocket.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXSocketConnect.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXSocketFactory.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXSocketServer.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXSocketTLSOptions.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXStrCaseCompare.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXUdpSocket.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXUniquePtr.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXUrlParser.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXUuid.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXUtf8Validator.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXUserAgent.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXWebSocket.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXWebSocketCloseConstants.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXWebSocketCloseInfo.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXWebSocketErrorInfo.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXWebSocketHandshake.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXWebSocketHandshakeKeyGen.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXWebSocketHttpHeaders.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXWebSocketInitResult.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXWebSocketMessage.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXWebSocketMessageType.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXWebSocketOpenInfo.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXWebSocketPerMessageDeflate.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXWebSocketPerMessageDeflateCodec.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXWebSocketPerMessageDeflateOptions.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXWebSocketProxyServer.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXWebSocketSendData.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXWebSocketSendInfo.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXWebSocketServer.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXWebSocketTransport.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXWebSocketVersion.h"
    "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/ixwebsocket/IXSocketAppleSSL.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/ixwebsocket" TYPE FILE FILES "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/build_x86/ixwebsocket-config.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/ixwebsocket/ixwebsocket-targets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/ixwebsocket/ixwebsocket-targets.cmake"
         "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/build_x86/CMakeFiles/Export/lib/cmake/ixwebsocket/ixwebsocket-targets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/ixwebsocket/ixwebsocket-targets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/ixwebsocket/ixwebsocket-targets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/ixwebsocket" TYPE FILE FILES "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/build_x86/CMakeFiles/Export/lib/cmake/ixwebsocket/ixwebsocket-targets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/ixwebsocket" TYPE FILE FILES "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/build_x86/CMakeFiles/Export/lib/cmake/ixwebsocket/ixwebsocket-targets-noconfig.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/IXWebSocket/build_x86/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
