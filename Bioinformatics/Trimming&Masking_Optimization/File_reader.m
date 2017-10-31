








x=[0,.1,.2,.3,.4,.5,.6,.7,.8,.9,1];
y=[0,2,4,6,8,10,12,14,16,18,20];
z=[0,3,6,10,12,14,16,18,20,22,24,28,30,34,37,40,58,76,94];


yaxis=zeros(209,10);
xaxis=zeros(19,10,11);
for jj=1:8
    num=0;
    numx=0;
    if jj==1
        filename1 = ('nGenes.txt');
        I = textread(filename1);
        elseif jj==2
            filename2= ('taxa.txt');
        I = textread(filename2);
        elseif jj==3
            filename3= ('sites.txt');
        I = textread(filename3);
        elseif jj==4
            filename4= ('varsites.txt');
        I = textread(filename4);
        elseif jj==5
            filename5= ('infosites.txt');
        I = textread(filename5);
        elseif jj==6
            filename6= ('char.txt');
        I = textread(filename6);
        elseif jj==7
            filename7= ('missingcharN.txt');
        I = textread(filename7);
    else 
        filename8= ('missingchar.txt');
        I = textread(filename8);
    end
for ii=1:10
    
yaxis(:,ii)=I(1+num:209+num);
num=num+209;


xaxis(:,ii,1)=I(1+numx:19+numx);
xaxis(:,ii,2)=I(20+numx:38+numx);
xaxis(:,ii,3)=I(39+numx:57+numx);
xaxis(:,ii,4)=I(58+numx:76+numx);
xaxis(:,ii,5)=I(77+numx:95+numx);
xaxis(:,ii,6)=I(96+numx:114+numx);
xaxis(:,ii,7)=I(115+numx:133+numx);
xaxis(:,ii,8)=I(134+numx:152+numx);
xaxis(:,ii,9)=I(153+numx:171+numx);
xaxis(:,ii,10)=I(172+numx:190+numx);
xaxis(:,ii,11)=I(191+numx:209+numx);
numx=numx+190;


end
end
for kk=1:10
bar(z,xaxis(:,kk,kk))
hold on
end

title('% Missing characters (all considered)')
xlabel('Z')
ylabel('% Missing characters (all considered)')




 