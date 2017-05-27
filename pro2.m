tic
clc;
clear

disp('Hello World');
template = imread('LT.png');
t_gray=rgb2gray(template);
siz=size(t_gray);
t_width=siz(2);
t_height=siz(1);
t_fea=feature(template,1,1,t_width);
t_track=double(1000);
o_i=1;
o_j=1;

B=imread('down.jpg');    
r_gray=rgb2gray(B);
r_siz=size(r_gray);
r_width=r_siz(2);
r_height=r_siz(1);

disp('Entering');
for i=1:(r_height-t_height+1)
    for j=1:(r_width-t_width+1)
        tic
        temp_fea=feature(r_gray,i,j,t_width);
        %temp_mean=0;
        temp_mean=abs((temp_fea(1)-t_fea(1)))/abs(t_fea(1))+abs((temp_fea(2)-t_fea(2)))/abs(t_fea(2))+abs((temp_fea(3)-t_fea(3)))/abs(t_fea(3))+abs((temp_fea(4)-t_fea(4)))/abs(t_fea(4));

        if temp_mean<t_track
            t_track=temp_mean;
            o_i=i;
            o_j=j;
        end
        toc
    end
end

oput=r_gray(o_i:o_i+t_height-1,o_j:o_j+t_width-1);
imshow(oput);

disp('done!')
toc

