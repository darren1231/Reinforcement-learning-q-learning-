function [  ] = plot_action( q_value,x,y )

% number_experience=rand_experience;
% [net_input,net_output] = transport_experience(number_experience);
% net = train_rprop(net_input,net_output);

% for x=2:5
%       for y=2:5
%           for action=1:4
%             q_value(y,x,action)=roundn(sim(net,transport_feature_byte_diff(x,y,action)),-3);
%           end
%       end
% end
plot(1,1);


coordinate_y=1.75-(x-2)*0.5;
coordinate_x=0.2+(y-2)*0.5;
text(coordinate_x,coordinate_y,num2str(0),'color','r')


for center_x=0.2:0.5:1.7
    for center_y=1.75:-0.5:0.25
        x=(center_x-0.2)/0.5+2;
        y=(1.75-center_y)/0.5+2;
%     text(center_x,center_y+0.15,num2str(q_value((center_x-0.2)/0.5+2,(1.75-center_y)/0.5+2),1));
%     text(center_x,center_y-0.15,num2str(q_value((center_x-0.2)/0.5+2,(1.75-center_y)/0.5+2),2));
%     text(center_x-0.1,center_y,num2str(q_value((center_x-0.2)/0.5+2,(1.75-center_y)/0.5+2),3));
%     text(center_x+0.1,center_y,num2str(q_value((center_x-0.2)/0.5+2,(1.75-center_y)/0.5+2),4));
    text(center_x,center_y+0.15,num2str(q_value(y,x,1)));
    text(center_x,center_y-0.15,num2str(q_value(y,x,2)));
    text(center_x-0.1,center_y,num2str(q_value(y,x,3)));
    text(center_x+0.1,center_y,num2str(q_value(y,x,4)));
    
%      text(center_x,center_y+0.15,num2str((1.75-center_y)/0.5+2));
    end
end





end
