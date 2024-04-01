add_library("Walnut" STATIC
        "Walnut/Platform/GUI/Walnut/ApplicationGUI.cpp"
        "Walnut/Platform/GUI/Walnut/ApplicationGUI.h"
          "Walnut/Platform/GUI/Walnut/ImGui/ImGuiBuild.cpp"
          "Walnut/Platform/GUI/Walnut/ImGui/ImGuiTheme.cpp"
          "Walnut/Platform/GUI/Walnut/ImGui/ImGuiTheme.h"
        "Walnut/Platform/GUI/Walnut/Image.cpp"
        "Walnut/Platform/GUI/Walnut/Image.h"
          "Walnut/Platform/GUI/Walnut/Input/Input.cpp"
          "Walnut/Platform/GUI/Walnut/Input/Input.h"
          "Walnut/Platform/GUI/Walnut/Input/KeyCodes.h"
          "Walnut/Platform/GUI/Walnut/UI/Console.cpp"
          "Walnut/Platform/GUI/Walnut/UI/Console.h"
          "Walnut/Platform/GUI/Walnut/UI/UI.cpp"
          "Walnut/Platform/GUI/Walnut/UI/UI.h"
      "Walnut/Source/Walnut/Application.h"
        "Walnut/Source/Walnut/Core/Assert.h"
        "Walnut/Source/Walnut/Core/Buffer.h"
        "Walnut/Source/Walnut/Core/Log.cpp"
        "Walnut/Source/Walnut/Core/Log.h"
        "Walnut/Source/Walnut/Core/LogCustomFormatters.h"
      "Walnut/Source/Walnut/EntryPoint.h"
      "Walnut/Source/Walnut/Layer.h"
      "Walnut/Source/Walnut/Random.cpp"
      "Walnut/Source/Walnut/Random.h"
        "Walnut/Source/Walnut/Serialization/BufferStream.cpp"
        "Walnut/Source/Walnut/Serialization/BufferStream.h"
        "Walnut/Source/Walnut/Serialization/FileStream.cpp"
        "Walnut/Source/Walnut/Serialization/FileStream.h"
        "Walnut/Source/Walnut/Serialization/StreamReader.cpp"
        "Walnut/Source/Walnut/Serialization/StreamReader.h"
        "Walnut/Source/Walnut/Serialization/StreamWriter.cpp"
        "Walnut/Source/Walnut/Serialization/StreamWriter.h"
      "Walnut/Source/Walnut/Timer.h"
        "Walnut/Source/Walnut/Utils/StringUtils.cpp"
        "Walnut/Source/Walnut/Utils/StringUtils.h"
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  add_dependencies("Walnut"
    "ImGui"
    "GLFW"
  )
  set_target_properties("Walnut" PROPERTIES
    OUTPUT_NAME "Walnut"
    ARCHIVE_OUTPUT_DIRECTORY "C:/Users/alixd/Desktop/bin/Debug-windows-x86_64/Walnut"
    LIBRARY_OUTPUT_DIRECTORY "C:/Users/alixd/Desktop/bin/Debug-windows-x86_64/Walnut"
    RUNTIME_OUTPUT_DIRECTORY "C:/Users/alixd/Desktop/bin/Debug-windows-x86_64/Walnut"
  )
endif()
target_include_directories("Walnut" PRIVATE
  $<$<CONFIG:Debug>:C:/Users/alixd/Desktop/Walnut/Walnut/Source>
  $<$<CONFIG:Debug>:C:/Users/alixd/Desktop/Walnut/Walnut/Platform/GUI>
  $<$<CONFIG:Debug>:C:/Users/alixd/Desktop/Walnut/vendor/imgui>
  $<$<CONFIG:Debug>:C:/Users/alixd/Desktop/Walnut/vendor/glfw/include>
  $<$<CONFIG:Debug>:C:/Users/alixd/Desktop/Walnut/vendor/stb_image>
  $<$<CONFIG:Debug>:C:/VulkanSDK/1.3.275.0/Include>
  $<$<CONFIG:Debug>:C:/Users/alixd/Desktop/Walnut/Walnut/../vendor/glm>
  $<$<CONFIG:Debug>:C:/Users/alixd/Desktop/Walnut/Walnut/../vendor/spdlog/include>
)
target_compile_definitions("Walnut" PRIVATE
  $<$<CONFIG:Debug>:WL_PLATFORM_WINDOWS>
  $<$<CONFIG:Debug>:WL_DEBUG>
)
target_link_directories("Walnut" PRIVATE
)
target_link_libraries("Walnut"
  $<$<CONFIG:Debug>:ImGui>
  $<$<CONFIG:Debug>:GLFW>
  $<$<CONFIG:Debug>:C:/VulkanSDK/1.3.275.0/Lib/vulkan-1.lib>
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  set_target_properties("Walnut" PROPERTIES COMPILE_FLAGS "/EHsc /Zc:preprocessor /Zc:__cplusplus ")
endif()
target_compile_options("Walnut" PRIVATE
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:-m64>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:-g>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-m64>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-g>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-std=c++20>
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  set_target_properties("Walnut" PROPERTIES
    CXX_STANDARD 20
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Release)
  add_dependencies("Walnut"
    "ImGui"
    "GLFW"
  )
  set_target_properties("Walnut" PROPERTIES
    OUTPUT_NAME "Walnut"
    ARCHIVE_OUTPUT_DIRECTORY "C:/Users/alixd/Desktop/bin/Release-windows-x86_64/Walnut"
    LIBRARY_OUTPUT_DIRECTORY "C:/Users/alixd/Desktop/bin/Release-windows-x86_64/Walnut"
    RUNTIME_OUTPUT_DIRECTORY "C:/Users/alixd/Desktop/bin/Release-windows-x86_64/Walnut"
  )
endif()
target_include_directories("Walnut" PRIVATE
  $<$<CONFIG:Release>:C:/Users/alixd/Desktop/Walnut/Walnut/Source>
  $<$<CONFIG:Release>:C:/Users/alixd/Desktop/Walnut/Walnut/Platform/GUI>
  $<$<CONFIG:Release>:C:/Users/alixd/Desktop/Walnut/vendor/imgui>
  $<$<CONFIG:Release>:C:/Users/alixd/Desktop/Walnut/vendor/glfw/include>
  $<$<CONFIG:Release>:C:/Users/alixd/Desktop/Walnut/vendor/stb_image>
  $<$<CONFIG:Release>:C:/VulkanSDK/1.3.275.0/Include>
  $<$<CONFIG:Release>:C:/Users/alixd/Desktop/Walnut/Walnut/../vendor/glm>
  $<$<CONFIG:Release>:C:/Users/alixd/Desktop/Walnut/Walnut/../vendor/spdlog/include>
)
target_compile_definitions("Walnut" PRIVATE
  $<$<CONFIG:Release>:WL_PLATFORM_WINDOWS>
  $<$<CONFIG:Release>:WL_RELEASE>
)
target_link_directories("Walnut" PRIVATE
)
target_link_libraries("Walnut"
  $<$<CONFIG:Release>:ImGui>
  $<$<CONFIG:Release>:GLFW>
  $<$<CONFIG:Release>:C:/VulkanSDK/1.3.275.0/Lib/vulkan-1.lib>
)
if(CMAKE_BUILD_TYPE STREQUAL Release)
  set_target_properties("Walnut" PROPERTIES COMPILE_FLAGS "/EHsc /Zc:preprocessor /Zc:__cplusplus ")
endif()
target_compile_options("Walnut" PRIVATE
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:-m64>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:-O2>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:-g>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-m64>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-O2>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-g>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-std=c++20>
)
if(CMAKE_BUILD_TYPE STREQUAL Release)
  set_target_properties("Walnut" PROPERTIES
    CXX_STANDARD 20
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Dist)
  add_dependencies("Walnut"
    "ImGui"
    "GLFW"
  )
  set_target_properties("Walnut" PROPERTIES
    OUTPUT_NAME "Walnut"
    ARCHIVE_OUTPUT_DIRECTORY "C:/Users/alixd/Desktop/bin/Dist-windows-x86_64/Walnut"
    LIBRARY_OUTPUT_DIRECTORY "C:/Users/alixd/Desktop/bin/Dist-windows-x86_64/Walnut"
    RUNTIME_OUTPUT_DIRECTORY "C:/Users/alixd/Desktop/bin/Dist-windows-x86_64/Walnut"
  )
endif()
target_include_directories("Walnut" PRIVATE
  $<$<CONFIG:Dist>:C:/Users/alixd/Desktop/Walnut/Walnut/Source>
  $<$<CONFIG:Dist>:C:/Users/alixd/Desktop/Walnut/Walnut/Platform/GUI>
  $<$<CONFIG:Dist>:C:/Users/alixd/Desktop/Walnut/vendor/imgui>
  $<$<CONFIG:Dist>:C:/Users/alixd/Desktop/Walnut/vendor/glfw/include>
  $<$<CONFIG:Dist>:C:/Users/alixd/Desktop/Walnut/vendor/stb_image>
  $<$<CONFIG:Dist>:C:/VulkanSDK/1.3.275.0/Include>
  $<$<CONFIG:Dist>:C:/Users/alixd/Desktop/Walnut/Walnut/../vendor/glm>
  $<$<CONFIG:Dist>:C:/Users/alixd/Desktop/Walnut/Walnut/../vendor/spdlog/include>
)
target_compile_definitions("Walnut" PRIVATE
  $<$<CONFIG:Dist>:WL_PLATFORM_WINDOWS>
  $<$<CONFIG:Dist>:WL_DIST>
)
target_link_directories("Walnut" PRIVATE
)
target_link_libraries("Walnut"
  $<$<CONFIG:Dist>:ImGui>
  $<$<CONFIG:Dist>:GLFW>
  $<$<CONFIG:Dist>:C:/VulkanSDK/1.3.275.0/Lib/vulkan-1.lib>
)
if(CMAKE_BUILD_TYPE STREQUAL Dist)
  set_target_properties("Walnut" PROPERTIES COMPILE_FLAGS "/EHsc /Zc:preprocessor /Zc:__cplusplus ")
endif()
target_compile_options("Walnut" PRIVATE
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:C>>:-m64>
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:C>>:-O2>
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:-m64>
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:-O2>
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:-std=c++20>
)
if(CMAKE_BUILD_TYPE STREQUAL Dist)
  set_target_properties("Walnut" PROPERTIES
    CXX_STANDARD 20
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()