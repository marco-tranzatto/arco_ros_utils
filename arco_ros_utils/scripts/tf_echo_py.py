#!/usr/bin/python

import rospy
import tf
import sys

if __name__ == '__main__':

    if len(sys.argv) < 3:
        rospy.signal_shutdown("usage: rosrun arco_ros_utils tf_echo_py target_frame source_frame")

    else:
        target_frame = sys.argv[1]
        source_frame = sys.argv[2]

        rospy.init_node('arco_tf_echo')
        listener = tf.TransformListener()

        rate = rospy.Rate(1.0)
        while not rospy.is_shutdown():
            try:
                (trans, rot) = listener.lookupTransform(target_frame, source_frame, rospy.Time(0))
                rospy.loginfo("----------------")
                rospy.loginfo("Translation: [%.4f, %.4f, %.4f]" % (trans[0], trans[1], trans[2]))
                rospy.loginfo("Quaternion(xyzw): [%.6f, %.6f, %.6f, %.6f]" % (rot[0], rot[1], rot[2], rot[3]))
            except (tf.LookupException, tf.ConnectivityException):
                rospy.logerr("Error")

            rate.sleep()
