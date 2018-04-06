/*!
 * @file    local_guidance_widget_manager_node.cpp
 * @author  Marco Tranzatto
 * @date    Apr 06, 2018
 */
#include <ros/ros.h>
#include <any_node/any_node.hpp>
#include "local_guidance_widget_manager/LocalGuidanceWidgetManager.hpp"

int main(int argc, char** argv) {
  any_node::Nodewrap<local_guidance_widget_manager::LocalGuidanceWidgetManager> node(
      argc, argv, "local_guidance_widget_manager", 1);
  node.execute(90);  // 90=priority of the thread calling the update(..) function (if any)
  // execute blocks until the node was requested to shut down (after reception of a signal (e.g. SIGINT) or after
  // calling the any_node::Node::shutdown() function)
  return 0;
}
