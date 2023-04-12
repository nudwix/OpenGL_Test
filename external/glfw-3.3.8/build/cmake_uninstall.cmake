
if (NOT EXISTS "C:/Users/arthr/Downloads/glfw-3.3.8/glfw-3.3.8/build/install_manifest.txt")
  message(FATAL_ERROR "Cannot find install manifest: \"C:/Users/arthr/Downloads/glfw-3.3.8/glfw-3.3.8/build/install_manifest.txt\"")
endif()

file(READ "C:/Users/arthr/Downloads/glfw-3.3.8/glfw-3.3.8/build/install_manifest.txt" files)
string(REGEX REPLACE "\n" ";" files "${files}")

foreach (file ${files})
  message(STATUS "Uninstalling \"$ENV{DESTDIR}${file}\"")
  if (EXISTS "$ENV{DESTDIR}${file}")
    exec_program("C:/Users/arthr/AppData/Local/JetBrains/Toolbox/apps/CLion/ch-0/222.4345.21/bin/cmake/win/bin/cmake.exe" ARGS "-E remove \"$ENV{DESTDIR}${file}\""
                 OUTPUT_VARIABLE rm_out
                 RETURN_VALUE rm_retval)
    if (NOT "${rm_retval}" STREQUAL 0)
      MESSAGE(FATAL_ERROR "Problem when removing \"$ENV{DESTDIR}${file}\"")
    endif()
  elseif (IS_SYMLINK "$ENV{DESTDIR}${file}")
    EXEC_PROGRAM("C:/Users/arthr/AppData/Local/JetBrains/Toolbox/apps/CLion/ch-0/222.4345.21/bin/cmake/win/bin/cmake.exe" ARGS "-E remove \"$ENV{DESTDIR}${file}\""
                 OUTPUT_VARIABLE rm_out
                 RETURN_VALUE rm_retval)
    if (NOT "${rm_retval}" STREQUAL 0)
      message(FATAL_ERROR "Problem when removing symlink \"$ENV{DESTDIR}${file}\"")
    endif()
  else()
    message(STATUS "File \"$ENV{DESTDIR}${file}\" does not exist.")
  endif()
endforeach()

