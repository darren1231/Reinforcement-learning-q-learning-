# Reinforcement-learning-q-learning

* This is a very simple example to show how q_learning works

* This is the most important formula of q_learning: 
    Q(state,x1)=  oldQ + alpha * (R(state,x1)+ (gamma * MaxQ(x1)) - oldQ)


Through this program you can see the agent how to learn that find the best way to
reach it's goal. If agent bump into the wall, we will give -1 as the
negative reward. On the controry, if agent hit the goal, we will give +1
as the positive reward. You will see the q table gradually being an
optimizing value and converge to the opitimal value.

* Here is q table. Red dot means agent's position.

<img src="./q table.png" width = "400" height = "400" alt="q table" align=center />
<img src="./agent move.png" width = "400" height = "400" alt="agent move" align=center />

## Instruction

* q_learning.m: The basic version of map
* q_learning_matrix_n.m: You can modify the map size by yourself and don't forget to modify the max_round as well

```
goal_x=??;
goal_y=??;
max_round=??;
```
* plot_action.m:Show q table


