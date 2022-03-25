
% help show
% help rigidBodyJoint
% help rigidBodyTree
% help rigidBody

% https://it.mathworks.com/help/robotics/ug/rigid-body-tree-robot-model.html#responsive_offcanvas
% https://it.mathworks.com/help/robotics/ref/rigidbodytree.html
% https://it.mathworks.com/help/robotics/ref/rigidbody.html
% https://it.mathworks.com/help/robotics/ref/rigidbodytree.show.html

robot = importrobot('PPP.urdf');

showdetails(robot)

figure;
config = homeConfiguration(robot);
show(robot,config);
%%
%moves along x, limits [-0.2,0,2]
config(1).JointPosition =   0.0;
%moves along z, limits [-0.2,0,2]
config(2).JointPosition = -0.0;
%moves along y, limits [-0.2,0,2]
config(3).JointPosition = 0.0;
getTransform(robot,config,"ee","base_link")

show(robot,config);
xlim([-0.5 0.8])
ylim([-0.5 0.5])
zlim([0 0.8])



