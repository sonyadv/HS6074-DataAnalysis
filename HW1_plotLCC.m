clear all;
close all;
clc;

m_proj('lambert', 'lat', [15 50], 'long', [100 150]);
m_coast('patch',[1 .85 .7]);
m_elev('contourf',[500:500:6000]);
m_grid('box','fancy','tickdir','in');
colormap(flipud(copper));
ax=m_contfbar(.97,[.5 .9],[0 6000],[0:100:5000],'edgecolor','none','endpiece','no');
xlabel(ax,'meters','color','k');
title('Lambert Conformal Conic projection')
