# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "openpose_ros_msgs: 4 messages, 1 services")

set(MSG_I_FLAGS "-Iopenpose_ros_msgs:/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg;-Istd_msgs:/opt/ros/lunar/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/lunar/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/lunar/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(openpose_ros_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/PersonDetection.msg" NAME_WE)
add_custom_target(_openpose_ros_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "openpose_ros_msgs" "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/PersonDetection.msg" "openpose_ros_msgs/BodypartDetection"
)

get_filename_component(_filename "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/PersonDetection_3d.msg" NAME_WE)
add_custom_target(_openpose_ros_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "openpose_ros_msgs" "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/PersonDetection_3d.msg" "openpose_ros_msgs/BodypartDetection_3d"
)

get_filename_component(_filename "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/srv/GetPersons.srv" NAME_WE)
add_custom_target(_openpose_ros_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "openpose_ros_msgs" "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/srv/GetPersons.srv" "openpose_ros_msgs/BodypartDetection:sensor_msgs/Image:std_msgs/Header:openpose_ros_msgs/PersonDetection"
)

get_filename_component(_filename "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection_3d.msg" NAME_WE)
add_custom_target(_openpose_ros_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "openpose_ros_msgs" "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection_3d.msg" ""
)

get_filename_component(_filename "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection.msg" NAME_WE)
add_custom_target(_openpose_ros_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "openpose_ros_msgs" "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(openpose_ros_msgs
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/PersonDetection.msg"
  "${MSG_I_FLAGS}"
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/openpose_ros_msgs
)
_generate_msg_cpp(openpose_ros_msgs
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/PersonDetection_3d.msg"
  "${MSG_I_FLAGS}"
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection_3d.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/openpose_ros_msgs
)
_generate_msg_cpp(openpose_ros_msgs
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection_3d.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/openpose_ros_msgs
)
_generate_msg_cpp(openpose_ros_msgs
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/openpose_ros_msgs
)

### Generating Services
_generate_srv_cpp(openpose_ros_msgs
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/srv/GetPersons.srv"
  "${MSG_I_FLAGS}"
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection.msg;/opt/ros/lunar/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/lunar/share/std_msgs/cmake/../msg/Header.msg;/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/PersonDetection.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/openpose_ros_msgs
)

### Generating Module File
_generate_module_cpp(openpose_ros_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/openpose_ros_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(openpose_ros_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(openpose_ros_msgs_generate_messages openpose_ros_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/PersonDetection.msg" NAME_WE)
add_dependencies(openpose_ros_msgs_generate_messages_cpp _openpose_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/PersonDetection_3d.msg" NAME_WE)
add_dependencies(openpose_ros_msgs_generate_messages_cpp _openpose_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/srv/GetPersons.srv" NAME_WE)
add_dependencies(openpose_ros_msgs_generate_messages_cpp _openpose_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection_3d.msg" NAME_WE)
add_dependencies(openpose_ros_msgs_generate_messages_cpp _openpose_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection.msg" NAME_WE)
add_dependencies(openpose_ros_msgs_generate_messages_cpp _openpose_ros_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(openpose_ros_msgs_gencpp)
add_dependencies(openpose_ros_msgs_gencpp openpose_ros_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS openpose_ros_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(openpose_ros_msgs
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/PersonDetection.msg"
  "${MSG_I_FLAGS}"
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/openpose_ros_msgs
)
_generate_msg_eus(openpose_ros_msgs
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/PersonDetection_3d.msg"
  "${MSG_I_FLAGS}"
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection_3d.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/openpose_ros_msgs
)
_generate_msg_eus(openpose_ros_msgs
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection_3d.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/openpose_ros_msgs
)
_generate_msg_eus(openpose_ros_msgs
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/openpose_ros_msgs
)

### Generating Services
_generate_srv_eus(openpose_ros_msgs
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/srv/GetPersons.srv"
  "${MSG_I_FLAGS}"
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection.msg;/opt/ros/lunar/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/lunar/share/std_msgs/cmake/../msg/Header.msg;/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/PersonDetection.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/openpose_ros_msgs
)

### Generating Module File
_generate_module_eus(openpose_ros_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/openpose_ros_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(openpose_ros_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(openpose_ros_msgs_generate_messages openpose_ros_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/PersonDetection.msg" NAME_WE)
add_dependencies(openpose_ros_msgs_generate_messages_eus _openpose_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/PersonDetection_3d.msg" NAME_WE)
add_dependencies(openpose_ros_msgs_generate_messages_eus _openpose_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/srv/GetPersons.srv" NAME_WE)
add_dependencies(openpose_ros_msgs_generate_messages_eus _openpose_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection_3d.msg" NAME_WE)
add_dependencies(openpose_ros_msgs_generate_messages_eus _openpose_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection.msg" NAME_WE)
add_dependencies(openpose_ros_msgs_generate_messages_eus _openpose_ros_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(openpose_ros_msgs_geneus)
add_dependencies(openpose_ros_msgs_geneus openpose_ros_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS openpose_ros_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(openpose_ros_msgs
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/PersonDetection.msg"
  "${MSG_I_FLAGS}"
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/openpose_ros_msgs
)
_generate_msg_lisp(openpose_ros_msgs
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/PersonDetection_3d.msg"
  "${MSG_I_FLAGS}"
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection_3d.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/openpose_ros_msgs
)
_generate_msg_lisp(openpose_ros_msgs
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection_3d.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/openpose_ros_msgs
)
_generate_msg_lisp(openpose_ros_msgs
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/openpose_ros_msgs
)

### Generating Services
_generate_srv_lisp(openpose_ros_msgs
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/srv/GetPersons.srv"
  "${MSG_I_FLAGS}"
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection.msg;/opt/ros/lunar/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/lunar/share/std_msgs/cmake/../msg/Header.msg;/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/PersonDetection.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/openpose_ros_msgs
)

### Generating Module File
_generate_module_lisp(openpose_ros_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/openpose_ros_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(openpose_ros_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(openpose_ros_msgs_generate_messages openpose_ros_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/PersonDetection.msg" NAME_WE)
add_dependencies(openpose_ros_msgs_generate_messages_lisp _openpose_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/PersonDetection_3d.msg" NAME_WE)
add_dependencies(openpose_ros_msgs_generate_messages_lisp _openpose_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/srv/GetPersons.srv" NAME_WE)
add_dependencies(openpose_ros_msgs_generate_messages_lisp _openpose_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection_3d.msg" NAME_WE)
add_dependencies(openpose_ros_msgs_generate_messages_lisp _openpose_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection.msg" NAME_WE)
add_dependencies(openpose_ros_msgs_generate_messages_lisp _openpose_ros_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(openpose_ros_msgs_genlisp)
add_dependencies(openpose_ros_msgs_genlisp openpose_ros_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS openpose_ros_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(openpose_ros_msgs
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/PersonDetection.msg"
  "${MSG_I_FLAGS}"
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/openpose_ros_msgs
)
_generate_msg_nodejs(openpose_ros_msgs
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/PersonDetection_3d.msg"
  "${MSG_I_FLAGS}"
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection_3d.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/openpose_ros_msgs
)
_generate_msg_nodejs(openpose_ros_msgs
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection_3d.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/openpose_ros_msgs
)
_generate_msg_nodejs(openpose_ros_msgs
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/openpose_ros_msgs
)

### Generating Services
_generate_srv_nodejs(openpose_ros_msgs
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/srv/GetPersons.srv"
  "${MSG_I_FLAGS}"
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection.msg;/opt/ros/lunar/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/lunar/share/std_msgs/cmake/../msg/Header.msg;/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/PersonDetection.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/openpose_ros_msgs
)

### Generating Module File
_generate_module_nodejs(openpose_ros_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/openpose_ros_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(openpose_ros_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(openpose_ros_msgs_generate_messages openpose_ros_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/PersonDetection.msg" NAME_WE)
add_dependencies(openpose_ros_msgs_generate_messages_nodejs _openpose_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/PersonDetection_3d.msg" NAME_WE)
add_dependencies(openpose_ros_msgs_generate_messages_nodejs _openpose_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/srv/GetPersons.srv" NAME_WE)
add_dependencies(openpose_ros_msgs_generate_messages_nodejs _openpose_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection_3d.msg" NAME_WE)
add_dependencies(openpose_ros_msgs_generate_messages_nodejs _openpose_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection.msg" NAME_WE)
add_dependencies(openpose_ros_msgs_generate_messages_nodejs _openpose_ros_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(openpose_ros_msgs_gennodejs)
add_dependencies(openpose_ros_msgs_gennodejs openpose_ros_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS openpose_ros_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(openpose_ros_msgs
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/PersonDetection.msg"
  "${MSG_I_FLAGS}"
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/openpose_ros_msgs
)
_generate_msg_py(openpose_ros_msgs
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/PersonDetection_3d.msg"
  "${MSG_I_FLAGS}"
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection_3d.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/openpose_ros_msgs
)
_generate_msg_py(openpose_ros_msgs
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection_3d.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/openpose_ros_msgs
)
_generate_msg_py(openpose_ros_msgs
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/openpose_ros_msgs
)

### Generating Services
_generate_srv_py(openpose_ros_msgs
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/srv/GetPersons.srv"
  "${MSG_I_FLAGS}"
  "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection.msg;/opt/ros/lunar/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/lunar/share/std_msgs/cmake/../msg/Header.msg;/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/PersonDetection.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/openpose_ros_msgs
)

### Generating Module File
_generate_module_py(openpose_ros_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/openpose_ros_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(openpose_ros_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(openpose_ros_msgs_generate_messages openpose_ros_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/PersonDetection.msg" NAME_WE)
add_dependencies(openpose_ros_msgs_generate_messages_py _openpose_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/PersonDetection_3d.msg" NAME_WE)
add_dependencies(openpose_ros_msgs_generate_messages_py _openpose_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/srv/GetPersons.srv" NAME_WE)
add_dependencies(openpose_ros_msgs_generate_messages_py _openpose_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection_3d.msg" NAME_WE)
add_dependencies(openpose_ros_msgs_generate_messages_py _openpose_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fetchbot/catkin_ws/src/openpose_ros_msgs/msg/BodypartDetection.msg" NAME_WE)
add_dependencies(openpose_ros_msgs_generate_messages_py _openpose_ros_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(openpose_ros_msgs_genpy)
add_dependencies(openpose_ros_msgs_genpy openpose_ros_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS openpose_ros_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/openpose_ros_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/openpose_ros_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(openpose_ros_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(openpose_ros_msgs_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/openpose_ros_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/openpose_ros_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(openpose_ros_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(openpose_ros_msgs_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/openpose_ros_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/openpose_ros_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(openpose_ros_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(openpose_ros_msgs_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/openpose_ros_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/openpose_ros_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(openpose_ros_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(openpose_ros_msgs_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/openpose_ros_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/openpose_ros_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/openpose_ros_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(openpose_ros_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(openpose_ros_msgs_generate_messages_py sensor_msgs_generate_messages_py)
endif()
