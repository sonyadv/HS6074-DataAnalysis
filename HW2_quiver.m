clc; clear; fclose all; close all;

lx=dlmread('layer02_x.dat');  %先到COMCOT跑要的網格大小及地形範圍
ly=dlmread('layer02_y.dat');  %把得到後的資料變成真實的經緯度範圍
lz=dlmread('layer02.dat');
[lon,lan]=meshgrid(lx,ly);
depth=reshape(lz,length(lx),length(ly)); % 水深
depth= -depth';   

cd('codar_data')
hold on

month = 12;
for day = 1:11
    for hour = 0:23
        figure((day-1)*24+hour+1)
        pcolor(lon,lan,depth); %畫地形
        caxis([-6000 4000]);
        colormap([flipud(m_colmap('blue',5850)); m_colmap('blues',150); flipud(m_colmap('green',4000))]);
        shading flat; axis image;

        hold on

        contour(lon,lan,depth,[0 0],'k','linewidth',1.3)   %畫海岸線    
        box on; grid on; set(gca, 'layer', 'top');
        hcb = colorbar;
        set(get(hcb,'Ylabel'),'String','Elevation (m)');

        hold on

        fn=['TOTL_ALLM_2014_' sprintf('%02d',month) '_' sprintf('%02d',day) '_' sprintf('%02d',hour) '00' '.tuv']
        q = load(fn);
        
        X = q(:,1);
        Y = q(:,2);
        U = q(:,3);
        V = q(:,4);
        
        quiver(X,Y,U,V)

        axis([119,123,21,26])
        xlabel('Longitude'); ylabel('Latitude');
        title([sprintf('%02d',month) '/' sprintf('%02d',day) ' ' sprintf('%02d',hour) ':00'])
        print(['r600.' fn '.png'],'-dpng','-r600');
    end
end

