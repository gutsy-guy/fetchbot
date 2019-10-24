
(cl:in-package :asdf)

(defsystem "openpose_ros_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "BodypartDetection" :depends-on ("_package_BodypartDetection"))
    (:file "_package_BodypartDetection" :depends-on ("_package"))
    (:file "BodypartDetection_3d" :depends-on ("_package_BodypartDetection_3d"))
    (:file "_package_BodypartDetection_3d" :depends-on ("_package"))
    (:file "PersonDetection" :depends-on ("_package_PersonDetection"))
    (:file "_package_PersonDetection" :depends-on ("_package"))
    (:file "PersonDetection_3d" :depends-on ("_package_PersonDetection_3d"))
    (:file "_package_PersonDetection_3d" :depends-on ("_package"))
  ))