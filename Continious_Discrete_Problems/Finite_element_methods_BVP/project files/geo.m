function [ ele,unkwn, xcoord,local,weight,quadpoint ] = geo(nodes )

count=nodes;
xcoord=linspace(0,2,nodes);

ele=nodes-1;
unkwn= nodes-2;

local=zeros(nodes-1,2);

for i=1:(nodes-1)
count=count-1;
if i<3
local(i)=nodes-1;
else
local(i)=nodes-count;
end
end
count=nodes-1;
for j=nodes:nodes*2-2
    count=count-1;
    if j==nodes || j==nodes*2-2
    local(j)=  -1;
    else
        local(j)=nodes-count;   
    end        
end

quadpoint= zeros(nodes-1,1);
for ii=1:nodes-1
    quadpoint(ii)=(xcoord(ii)+xcoord(2))/2;
end
weight=zeros(nodes-1,1);
 for jj=1:nodes-1
    weight(jj)=xcoord(1); 
 end


end

