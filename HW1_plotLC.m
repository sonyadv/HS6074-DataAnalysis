clc; clear; fclose all; close all;
m_proj('lambert','lat',[20 26],'long',[118 123]);

[CS,CH]=m_etopo2('contourf',[-6500:500:0 0:250:4000],'edgecolor','none');

colormap([ m_colmap('blues',130); m_colmap('gland',80)]);
brighten(.5);
m_gshhs_i('color','k');
 
m_grid('box','fancy');
ax=m_contfbar(1,[.5 .8],CS,CH);
title(ax,{'Level/m',''}); % Move up by inserting a blank line

title('Lambert Conformal Projection')
xlabel('Longitude'); ylabel('Latitude');
