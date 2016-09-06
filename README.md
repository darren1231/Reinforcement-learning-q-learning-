# Reinforcement-learning-q-learning-

This is a very simple example to show how q_learning works

This is the most important formula of q_learning
Q(state,x1)=  oldQ + alpha * (R(state,x1)+ (gamma * MaxQ(x1)) - oldQ);

Through this program you can see how agent learn to find a best way to
reach it's goal. If agent bump into the wall, we will give -1 as the
negative reward. On the controry, if agent hit the goal, we will give +1
as the positive reward. You will see the q table gradually being an
optimizing value and converge to the opitimal value.


<img src="./q table.png" width = "400" height = "400" alt="q table" align=center />
