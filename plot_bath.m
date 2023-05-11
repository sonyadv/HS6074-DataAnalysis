%% better way, no need COMCOT

clc; clear; fclose all; close all;

% read the .xyz file and seprate into three array: lx, ly, lz
taipd = load('Taidp200m.xyz');
lx = taipd(:,1);
ly = taipd(:,2);
lz = taipd(:,3);

% reshape 1-dim arrays into 2-dim martix
lon = reshape(lx,2001,2501);
lan = reshape(ly,2001,2501);
depth = reshape(lz,2001,2501);

% plot the bathmetry by pcolor
pcolor(lon,lan,depth);
caxis([-6000 4000]);
%colormap("parula");
colormap([flipud(m_colmap('blue',5850)); m_colmap('blues',150); flipud(m_colmap('green',4000))]);
shading flat; axis image;
hold on

% plot the coastline by contour line of 0m
contour(lon,lan,depth,[0 0],'k','linewidth',1.3) 
box on; grid on; set(gca, 'layer', 'top');

hcb = colorbar;
set(get(hcb,'Ylabel'),'String','Elevation (m)');
