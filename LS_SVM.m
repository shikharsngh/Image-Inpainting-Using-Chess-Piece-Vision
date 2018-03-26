clc
clear all
tic
% dirr='C:\Users\user\Desktop\8th sem\final year project\New folder(2)\image\';
%img = imread(strcat(dirr,'4.2.04.bmp'));
%img2 = imread(strcat(dirr,'4.2.04_sB.bmp'));
img = imread('4.2.04.bmp')
img2 = imread('4.2.04_attack1.bmp')
img = rgb2gray(img);
img2 = rgb2gray(img2);
imgip=img2;
imgip1=img2;
imgip2=img2;
mask=im2bw(img2*10);
switch 'RC'
    case  'RD'
[szex szey]=size(img);
temp=1;
 for i=1:szex %64
for j=1:szey %53
if(mask(i,j)==0)
xipit(1:2,temp)=[i j];
temp=temp+1;
end
end
 end
 temp=1;
 temp2=1;
 for i=min(xipit(1,:)):max(xipit(1,:))
%     i=min(xipit(1,:));
for j=1:szex
         if(mask(i,j)~=0)
             trinset(1,temp)=j;
             trinset(2,temp)=img2(i,j);
             temp=temp+1;
         else
             out_svm_in(temp2)=j;
             temp2=temp2+1;
         end
         original(j)=img2(i,j);
         
end
temp=1;
 temp2=1;
     pin=fitrsvm(trinset(1,:)',trinset(2,:)');
     pin_out=predict(pin,out_svm_in');
     for j=1:szex
%          if(trinset(1,temp)==j&&temp<size(trinset,2))
% %              imgip(i,j)=trinset(2,temp);
%              temp=temp+1;
%          end
         if(out_svm_in(temp2)==j&&temp2<size(out_svm_in,2)+1)
             imgip(i,j)=pin_out(temp2);
             temp2=temp2+1;
             if(temp2==size(out_svm_in,2)+1)
                 break;
             end
         end
     end
     clear pin;
     toc
 end
 %%
    case 'CD'
        
        [szex szey]=size(img);
temp=1;
 for i=1:szex %64
for j=1:szey %53
if(mask(i,j)==0)
xipit(1:2,temp)=[i j];
temp=temp+1;
end
end
 end
 temp=1;
 temp2=1;
 for j=min(xipit(2,:)):max(xipit(2,:))
%     i=min(xipit(1,:));
for i=1:szex
         if(mask(i,j)~=0)
             trinset(1,temp)=i;
             trinset(2,temp)=img2(i,j);
             temp=temp+1;
         else
             out_svm_in(temp2)=i;
             temp2=temp2+1;
         end
         original(i)=img2(i,j);
         
end
temp=1;
 temp2=1;
     pin=fitrsvm(trinset(1,:)',trinset(2,:)');
     pin_out=predict(pin,out_svm_in');
     for i=1:szex
%          if(trinset(1,temp)==j&&temp<size(trinset,2))
% %              imgip(i,j)=trinset(2,temp);
%              temp=temp+1;
%          end
         if(out_svm_in(temp2)==i&&temp2<size(out_svm_in,2)+1)
             imgip(i,j)=pin_out(temp2);
             temp2=temp2+1;
             if(temp2==size(out_svm_in,2)+1)
                 break;
             end
         end
     end
     clear pin;
     toc
 end
    case 'RC'
        RC_mat
end
