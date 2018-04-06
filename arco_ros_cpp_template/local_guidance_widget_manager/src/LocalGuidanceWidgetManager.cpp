#include <local_guidance_widget_manager/LocalGuidanceWidgetManager.hpp>

namespace local_guidance_widget_manager {

LocalGuidanceWidgetManager::LocalGuidanceWidgetManager(any_node::Node::NodeHandlePtr nodeHandle)
    : any_node::Node(nodeHandle) {}

void LocalGuidanceWidgetManager::init() {
  if (!readPersistentParameters()) {
    ros::requestShutdown();
  }

  advertiseServers();
}

void LocalGuidanceWidgetManager::cleanup() {}

bool LocalGuidanceWidgetManager::update(const any_worker::WorkerEvent& event) {
  // called by the worker which is automatically set up if rosparam standalone == True.
  // The frequency is defined in the time_step rosparam.
  return true;
}

bool LocalGuidanceWidgetManager::readPersistentParameters() {
  bool success = true;

  // success = success && getParam("simulation", simulation_);

  if (!success) {
    MELO_ERROR_STREAM("Could not read all parameters.");
  }

  return success;
}

void LocalGuidanceWidgetManager::advertiseServers() {
  ros::NodeHandle nh = getNodeHandle();

  setDesiredPathToFollow_ =
      advertiseService("set_desired_path", "/default", &LocalGuidanceWidgetManager::setDesiredPathToFollow, this);
}

bool LocalGuidanceWidgetManager::setDesiredPathToFollow(std_srvs::Empty::Request& request,
                                                        std_srvs::Empty::Response& response) {
  return true;
}

}  // namespace local_guidance_widget_manager
