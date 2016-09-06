# Reinforcement-learning-q-learning-

This is a very simple example to show how q_learning works

% This is the most important formula of q_learning
% Q(state,x1)=  oldQ + alpha * (R(state,x1)+ (gamma * MaxQ(x1)) - oldQ);

% Here is state information
% (1,1) (1,2) (1,3) (1,4) (1,5) (1,6)     wall wall wall wall wall wall
% (2,1) (2,2) (2,3) (2,4) (2,5) (2,6)     wall                     wall
% (3,1) (3,2) (3,3) (3,4) (3,5) (3,6)     wall                     wall
% (4,1) (4,2) (4,3) (4,4) (4,5) (4,6)     wall                     wall
% (5,1) (5,2) (5,3) (5,4) (5,5) (5,6)     wall                     wall
% (6,1) (6,2) (6,3) (6,4) (6,5) (6,6)     wall wall wall wall wall wall

% start position:(2,2)
% goal  position:(5,5)

% Through this program you can see how agent learn to find a best way to
% reach it's goal. If agent bump into the wall, we will give -1 as the
% negative reward. On the controry, if agent hit the goal, we will give +1
% as the positive reward. You will see the q table gradually being an
% optimizing value and converge to the opitimal value.
