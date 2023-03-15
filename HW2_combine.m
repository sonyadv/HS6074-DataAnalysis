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

% load colormap
load('Taiwan.mat');

% plot etopo1
m_proj('UTM','long',[118 125],'lat',[20 26]);
caxis([-6000 4000]);
colormap(TWcolor);
m_etopo2('pcolor');
shading flat; axis image;
m_gshhs_i('color','k');
hold on

% plot the bathmetry by m_pcolor
m_pcolor(lon,lan,depth);
caxis([-6000 4000]);
colormap(TWcolor);
m_gshhs_i('color','k');
shading flat; axis image;
hold on

m_grid('box','fancy','tickdir','in');
colorbar;
title('Etopo + Taipd200m')
xlabel('Longitude'); ylabel('Latitude');
