clc; clear; fclose all; close all;

lx=dlmread('layer02_x.dat');
ly=dlmread('layer02_y.dat');
lz=dlmread('layer02.dat');
[lon,lan]=meshgrid(lx,ly);
depth=reshape(lz,length(lx),length(ly)); % 水深
depth= -depth';   

pcolor(lon,lan,depth); %畫地形
caxis([-6000 4000]);
colormap([flipud(m_colmap('blue',5850)); m_colmap('blues',150); flipud(m_colmap('green',4000))]);
shading flat; axis image;

hold on
contour(lon,lan,depth,[0 0],'k','linewidth',1.3)
box on; grid on; set(gca, 'layer', 'top');

hcb = colorbar;
set(get(hcb,'Ylabel'),'String','Elevation (m)');
xlabel('Longitude'); ylabel('Latitude');
title('Taipd200m.xyz data')