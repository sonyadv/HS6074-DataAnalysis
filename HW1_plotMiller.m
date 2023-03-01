clear all;
close all;
clc;

% Plot a circular orbit

m_proj('lambert', 'lat', [21 26], 'long', [118 123]);
[CS,CH]=m_etopo2('contourf',[-5000:500:0 250:250:3000],'edgecolor','none');
 m_grid('linestyle','none','tickdir','out','linewidth',3);

colormap([ m_colmap('blues',80); m_colmap('gland',48)]);
brighten(.5)

m_coast('color',[0 .6 0]);
m_grid('box','fancy','tickdir','out');
m_northarrow(-150,0,40,'type',4,'linewi',.5);
title('Miller Projection')
