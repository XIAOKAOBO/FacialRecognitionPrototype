function fea = feature(pic,start_i,start_j,size)
    if mod(size,2)==0
        size=size-1;
    end
    pic = double(pic);

    
    l1=double(zeros(size,size));
    for i=1:size
        for j=1:size          
            l1(i,j)=pic(start_i+i-1,start_j+j-1);

        end
    end
    
    Mean=mean(mean(l1));
    l2=double(zeros(size,size));
    for i=1:size
        for j=1:size
            l2(i,j)=l1(i,j)*l1(i,j);
        end
    end

    
    Variance = double(0);
    
    for i=1:size
        for j=1:size
            
            Variance=Variance+(l2(i,j)-2*l1(i,j)*Mean+Mean*Mean)/double(size*size);
        end
    end
    
    
    GA=double((size-1)/-2:1:(size-1)/2);        

    
    GX=double(zeros(size,size));
    for j=1:size
        for i=1:size
            GX(i,j)=GA(j)*l1(i,j);
        end
    end
    
    GY=double(zeros(size,size));
    for i=1:size
        for j=1:size
            GY(i,j)=GA(i)*l1(i,j);
        end
    end
    gx=sum(sum(GX));
    gy=sum(sum(GY));
    
    Mean;
    Variance; 
    Gmag=sqrt(gx*gx+gy*gy);
    Gangle=atan(double(gy)/double(gx));
    fea=[Mean Variance Gmag Gangle];
    
    %fea=l1;
end