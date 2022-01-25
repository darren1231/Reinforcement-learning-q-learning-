%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project <  Implement q_learning big matrix >
% Motive  : This is a very simple example show how q_learning works
% Date    : 2016/09/10
% Author  : Kun Da Lin
% Comments: Language: Matlab. 

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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% The above example is about 4*4 matrix with two other dimention of wall.
% So it's totally 6*6 matrix. If you want to some more big matrix, feel free
% to modify to the size what you want from goal_x or goal_y. And don't
% forget to change max_round as well.

clear;
%% Set your goal position
goal_x=20;
goal_y=20;
max_round=200;

qtable = zeros(goal_x+1,goal_y+1,4);
qtable_p = zeros(goal_x+1,goal_y+1,4);
round = 0;

initial_epsilon=1;
final_epsilon=0;
epsilon =initial_epsilon;
epsilon_p = initial_epsilon;

while round<max_round
  map_matrix=zeros(goal_x+1,goal_y+1);
  map_matrix(1:goal_x+1,1)=-1;
  map_matrix(1:goal_x+1,goal_y+1)=-1;
  map_matrix(1,1:goal_y+1)=-1;
  map_matrix(goal_x+1,1:goal_y+1)=-1;
% map_matrix = [1,1,1,1,1,1;
%               1,0,0,0,0,1;
%               1,0,0,0,0,1;
%               1,0,0,0,0,1;
%               1,0,0,0,0,1;
%               1,1,1,1,1,1];
     
      
round=round+1;
position_x=2;
position_y=2;
count=0;

if epsilon >= final_epsilon
    epsilon = epsilon-(initial_epsilon - final_epsilon) / 50
end 
if epsilon_p >= final_epsilon
    epsilon_p = epsilon_p-(0.1 - final_epsilon) / 5
end 
disp([num2str(epsilon_p),num2str(epsilon)]);
% disp(['position_x: ',num2str(position_x),'  position_y: ',num2str(position_y)]); 
%input('');
while ~(position_x==goal_x-1 && position_y==goal_y-1) 
    a=0.9;
	b=0.8;
    
% plot_action_matrix_n(qtable,position_x,position_y,goal_x,1);
% plot_action_matrix_n(qtable_p,position_x,position_y,goal_x,2);
    
reward=0;
penalty=0;
count=count+1;
rand_action = floor(mod(rand*10,4))+1;
[max_q, max_index] = max([qtable(position_x,position_y,1) qtable(position_x,position_y,2) qtable(position_x,position_y,3) qtable(position_x,position_y,4)]);
[max_q_p, max_index_p] = max([qtable_p(position_x,position_y,1) qtable_p(position_x,position_y,2) qtable_p(position_x,position_y,3) qtable_p(position_x,position_y,4)]);
% [max_q, max_index] = max([qtable(position_x,position_y,1)+qtable_p(position_x,position_y,1) qtable(position_x,position_y,2)+qtable_p(position_x,position_y,2) qtable(position_x,position_y,3)+qtable_p(position_x,position_y,3) qtable(position_x,position_y,4)+qtable_p(position_x,position_y,4)]);

% if rand<epsilon_p
%     action = max_index_p;    
% elseif rand>=epsilon_p && rand<epsilon
%     action = rand_action;    
% else
%     action = max_index;
% end

% if rand<epsilon
%     action = rand_action;
% else
%     action = max_index;    
% end
action = max_index;    
% if((qtable(position_x,position_y,rand_action)+qtable_p(position_x,position_y,rand_action))>=(qtable(position_x,position_y,max_index)+qtable_p(position_x,position_y,max_index)))
%     action = rand_action;
% else
%     action = max_index;
% end

% if(qtable(position_x,position_y,rand_action)>=qtable(position_x,position_y,max_index))
%     action = rand_action;
% else
%     action = max_index;
% end



map_matrix(position_x,position_y)=count;

pre_position_x=position_x;
pre_position_y=position_y;

switch action
     
    case 1
        position_x = pre_position_x-1;   %up
    case 2
        position_x = pre_position_x+1;  %down
    case 3
        position_y = pre_position_y-1;  %left
    case 4
        position_y = pre_position_y+1;  %right
    
end



    if(position_x==1 || position_x==goal_x || position_y==1 || position_y==goal_y)
        position_x = pre_position_x;
        position_y = pre_position_y;
        reward=0;
        penalty=-100;
        b=0;
        %disp('wall');
    end
    
    if(position_x==goal_x-1 && position_y==goal_y-1)
        reward=1;
        penalty=0;
        b=0;
    end
    
    [max_qtable, max_qtable_index] = max([qtable(position_x,position_y,1) qtable(position_x,position_y,2) qtable(position_x,position_y,3) qtable(position_x,position_y,4)]);
    [min_qtable, min_qtable_index] = min([qtable_p(position_x,position_y,1) qtable_p(position_x,position_y,2) qtable_p(position_x,position_y,3) qtable_p(position_x,position_y,4)]);
    
% You can also uncomment this to see how agen move step by step
% disp(['position_x: ',num2str(position_x),'  position_y: ',num2str(position_y)]); 

% if count>20000
%     test=0
% end
%% This is how magic happened
    
   old_q_p=qtable_p(pre_position_x,pre_position_y,action);
   new_q_p=old_q_p+a*(penalty+b*min_qtable-old_q_p);
   qtable_p(pre_position_x,pre_position_y,action)=new_q_p;
   
   old_q=qtable(pre_position_x,pre_position_y,action);
%    new_q=old_q+a*(reward+b*max_qtable-old_q);
%    new_q=(1-a)*old_q+a*(reward+b*max_qtable);
   new_q=(1-a)*old_q+a*(reward+b*max_qtable+penalty+b*min_qtable-old_q_p);
%     if penalty==-100
%         new_q = -100
%     else
%         new_q=(1-a)*old_q+a*(reward+b*max_qtable+penalty+b*min_qtable-old_q_p);
%     end
    
   qtable(pre_position_x,pre_position_y,action)=new_q;

   
   
  end
save_round(round,:)=  count;
disp(['round:',num2str(round),' step:',num2str(count)]);
      
end
disp(['If you can see the least step: ',num2str(goal_x+goal_y-4), ' in the end, then it']);
disp('means the agent have already found the best way');
disp('to reach the goal. If not, you should change your max_round');
disp('to a bigger number');
disp('');

if(goal_x<10 && goal_y<10)
disp('Here is how agent move:');
disp(map_matrix);
end

plot(save_round);
title(['Q learning--',num2str(goal_x),'*',num2str(goal_y),'  matrix']);
xlabel('episode');
ylabel('step');

%plot_action(qtable,position_x,position_y);