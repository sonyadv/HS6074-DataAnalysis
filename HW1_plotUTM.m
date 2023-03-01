clc; clear; fclose all; close all;

m_proj('UTM','long',[118 125],'lat',[20 26]);
caxis([-6000 0]);
colormap(flipud([flipud(m_colmap('blues',10));m_colmap('jet',118)]));
m_etopo2('shadedrelief','gradient',3);
alpha(0.4)

m_gshhs_i('color','k');
m_grid('box','fancy','tickdir','in');
m_ruler(1.2,[.5 .8]);

title('UTM projection')
xlabel('Longitude'); ylabel('Latitude');
