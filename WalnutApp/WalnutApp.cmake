add_executable("WalnutApp"
    "WalnutApp/src/ImPlot/MyPlot.cpp"
    "WalnutApp/src/ImPlot/MyPlot.h"
    "WalnutApp/src/ImPlot/implot.cpp"
    "WalnutApp/src/ImPlot/implot.h"
    "WalnutApp/src/ImPlot/implot_demo.cpp"
    "WalnutApp/src/ImPlot/implot_internal.h"
    "WalnutApp/src/ImPlot/implot_items.cpp"
    "WalnutApp/src/WalnutApp.cpp"
    #"WalnutApp/src/nativefiledialog-extended/src/include/nfd.h"
    #"WalnutApp/src/nativefiledialog-extended/src/nfd_win.cpp"
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  add_dependencies("WalnutApp"
    "Walnut"
  )
  set_target_properties("WalnutApp" PROPERTIES
    OUTPUT_NAME "WalnutApp"
    ARCHIVE_OUTPUT_DIRECTORY "C:/Users/alixd/Desktop/Walnut/bin/Debug-windows-x86_64/WalnutApp"
    LIBRARY_OUTPUT_DIRECTORY "C:/Users/alixd/Desktop/Walnut/bin/Debug-windows-x86_64/WalnutApp"
    RUNTIME_OUTPUT_DIRECTORY "C:/Users/alixd/Desktop/Walnut/bin/Debug-windows-x86_64/WalnutApp"
  )
endif()
target_include_directories("WalnutApp" PRIVATE
  $<$<CONFIG:Debug>:C:/Users/alixd/Desktop/Walnut/vendor/imgui>
  $<$<CONFIG:Debug>:C:/Users/alixd/Desktop/Walnut/vendor/glfw/include>
  $<$<CONFIG:Debug>:C:/Users/alixd/Desktop/Walnut/Walnut/Source>
  $<$<CONFIG:Debug>:C:/Users/alixd/Desktop/Walnut/Walnut/Platform/GUI>
  $<$<CONFIG:Debug>:C:/VulkanSDK/1.3.275.0/Include>
  $<$<CONFIG:Debug>:C:/Users/alixd/Desktop/Walnut/WalnutApp/../vendor/glm>
  $<$<CONFIG:Debug>:C:/Users/alixd/Desktop/Walnut/vendor/imgui>
)
target_compile_definitions("WalnutApp" PRIVATE
  $<$<CONFIG:Debug>:WL_PLATFORM_WINDOWS>
  $<$<CONFIG:Debug>:WL_DEBUG>
)
target_link_directories("WalnutApp" PRIVATE
)
target_link_libraries("WalnutApp"
  $<$<CONFIG:Debug>:Walnut>
  $<$<CONFIG:Debug>:nfd>
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  set_target_properties("WalnutApp" PROPERTIES COMPILE_FLAGS "/EHsc /Zc:preprocessor /Zc:__cplusplus ")
endif()
target_compile_options("WalnutApp" PRIVATE
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:-m64>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:-g>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-m64>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-g>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  set_target_properties("WalnutApp" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Release)
  add_dependencies("WalnutApp"
    "Walnut"
  )
  set_target_properties("WalnutApp" PROPERTIES
    OUTPUT_NAME "WalnutApp"
    ARCHIVE_OUTPUT_DIRECTORY "C:/Users/alixd/Desktop/Walnut/bin/Release-windows-x86_64/WalnutApp"
    LIBRARY_OUTPUT_DIRECTORY "C:/Users/alixd/Desktop/Walnut/bin/Release-windows-x86_64/WalnutApp"
    RUNTIME_OUTPUT_DIRECTORY "C:/Users/alixd/Desktop/Walnut/bin/Release-windows-x86_64/WalnutApp"
  )
endif()
target_include_directories("WalnutApp" PRIVATE
  $<$<CONFIG:Release>:C:/Users/alixd/Desktop/Walnut/vendor/imgui>
  $<$<CONFIG:Release>:C:/Users/alixd/Desktop/Walnut/vendor/glfw/include>
  $<$<CONFIG:Release>:C:/Users/alixd/Desktop/Walnut/Walnut/Source>
  $<$<CONFIG:Release>:C:/Users/alixd/Desktop/Walnut/Walnut/Platform/GUI>
  $<$<CONFIG:Release>:C:/VulkanSDK/1.3.275.0/Include>
  $<$<CONFIG:Release>:C:/Users/alixd/Desktop/Walnut/WalnutApp/../vendor/glm>
)
target_compile_definitions("WalnutApp" PRIVATE
  $<$<CONFIG:Release>:WL_PLATFORM_WINDOWS>
  $<$<CONFIG:Release>:WL_RELEASE>
)
target_link_directories("WalnutApp" PRIVATE
)
target_link_libraries("WalnutApp"
  $<$<CONFIG:Release>:Walnut>
  $<$<CONFIG:Release>:nfd>
)
if(CMAKE_BUILD_TYPE STREQUAL Release)
  set_target_properties("WalnutApp" PROPERTIES COMPILE_FLAGS "/EHsc /Zc:preprocessor /Zc:__cplusplus ")
endif()
target_compile_options("WalnutApp" PRIVATE
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:-m64>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:-O2>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:-g>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-m64>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-O2>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-g>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Release)
  set_target_properties("WalnutApp" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Dist)
  add_dependencies("WalnutApp"
    "Walnut"
  )
  set_target_properties("WalnutApp" PROPERTIES
    OUTPUT_NAME "WalnutApp"
    ARCHIVE_OUTPUT_DIRECTORY "C:/Users/alixd/Desktop/Walnut/bin/Dist-windows-x86_64/WalnutApp"
    LIBRARY_OUTPUT_DIRECTORY "C:/Users/alixd/Desktop/Walnut/bin/Dist-windows-x86_64/WalnutApp"
    RUNTIME_OUTPUT_DIRECTORY "C:/Users/alixd/Desktop/Walnut/bin/Dist-windows-x86_64/WalnutApp"
  )
endif()
target_include_directories("WalnutApp" PRIVATE
  $<$<CONFIG:Dist>:C:/Users/alixd/Desktop/Walnut/vendor/imgui>
  $<$<CONFIG:Dist>:C:/Users/alixd/Desktop/Walnut/vendor/glfw/include>
  $<$<CONFIG:Dist>:C:/Users/alixd/Desktop/Walnut/Walnut/Source>
  $<$<CONFIG:Dist>:C:/Users/alixd/Desktop/Walnut/Walnut/Platform/GUI>
  $<$<CONFIG:Dist>:C:/VulkanSDK/1.3.275.0/Include>
  $<$<CONFIG:Dist>:C:/Users/alixd/Desktop/Walnut/WalnutApp/../vendor/glm>
)
target_compile_definitions("WalnutApp" PRIVATE
  $<$<CONFIG:Dist>:WL_PLATFORM_WINDOWS>
  $<$<CONFIG:Dist>:WL_DIST>
)
target_link_directories("WalnutApp" PRIVATE
)
target_link_libraries("WalnutApp"
  $<$<CONFIG:Dist>:Walnut>
  $<$<CONFIG:Dist>:nfd>
)
if(CMAKE_BUILD_TYPE STREQUAL Dist)
  set_target_properties("WalnutApp" PROPERTIES COMPILE_FLAGS "/EHsc /Zc:preprocessor /Zc:__cplusplus ")
endif()
target_compile_options("WalnutApp" PRIVATE
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:C>>:-m64>
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:C>>:-O2>
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:-m64>
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:-O2>
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Dist)
  set_target_properties("WalnutApp" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()