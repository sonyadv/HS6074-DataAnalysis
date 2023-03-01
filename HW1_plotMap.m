m_proj('lambert','lat',[20 26],'long',[118 125]);

set(gcf,'color','w')   % Set background colour before m_image call

caxis([-6000 0]);
colormap(flipud([flipud(m_colmap('blues',10));m_colmap('jet',118)]));
m_etopo2('shadedrelief','gradient',3);
 
m_gshhs_i('patch',[.8 .8 .8]);
 
m_grid('box','fancy');

ax=m_contfbar(.97,[.5 .9],[-6000 0],[-6000:100:000],'edgecolor','none','endpiece','no');
xlabel(ax,'meters','color','k');