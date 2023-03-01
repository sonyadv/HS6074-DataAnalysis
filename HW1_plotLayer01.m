clc; clear; fclose all; close all;

lx=dlmread('layer01_x.dat');  %先到COMCOT跑要的網格大小及地形範圍
ly=dlmread('layer01_y.dat');  %把得到後的資料變成真實的經緯度範圍
lz=dlmread('layer01.dat');
[lxx,lyy]=meshgrid(lx,ly);
lzz=reshape(lz,length(lx),length(ly)); % 水深
lzz= -lzz';   
pcolor(lxx,lyy,lzz); %畫地形
shading flat; axis image;
hold on
contour(lxx,lyy,lzz,[0 0],'k','linewidth',1.3)   %畫海岸線 
box on; grid on; set(gca, 'layer', 'top');
hcb = colorbar; set(get(hcb,'Ylabel'),'String','Elevation (m)');
xlabel('Longitude'); ylabel('Latitude');