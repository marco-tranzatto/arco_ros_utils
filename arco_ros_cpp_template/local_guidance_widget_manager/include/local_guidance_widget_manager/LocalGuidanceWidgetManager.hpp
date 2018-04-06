#ifndef LOCAL_GUIDANCE_WIDGET_MANAGER_H
#define LOCAL_GUIDANCE_WIDGET_MANAGER_H

#include <std_srvs/Empty.h>
#include <any_node/any_node.hpp>

namespace local_guidance_widget_manager {

class LocalGuidanceWidgetManager : public any_node::Node {
 public:
  // Methods inherited from base class any_node::Node.
  LocalGuidanceWidgetManager() = delete;  // constructor needs to take a shared_ptr to a ros::Nodehandle instance.
  explicit LocalGuidanceWidgetManager(any_node::Node::NodeHandlePtr nodeHandle);
  ~LocalGuidanceWidgetManager() override = default;
  void init() override;
  void cleanup() override;
  bool update(const any_worker::WorkerEvent& event) override;

 private:
  /*!
   * Reads and verifies persistent (kept in class memory) ROS parameters.
   * @return true if successful.
   */
  bool readPersistentParameters();

  /*!
   * Advertises ROS service and action servers.
   */
  void advertiseServers();

  /*!
   * Rosservice server.
   * @param request ROS service request
   * @param response ROS service response
   * @return
   */
  bool setDesiredPathToFollow(std_srvs::Empty::Request& request,
                              std_srvs::Empty::Response& response);

  //! Rosservice to set a desired path to follow
  ros::ServiceServer setDesiredPathToFollow_;
};

}  // namespace local_guidance_widget_manager

#endif  // LOCAL_GUIDANCE_WIDGET_MANAGER_H
