clc; clear; fclose all; close all;

%% init
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

%% plot codar data
cd('codar_data')

count = 1
month = 12;
for day = 1:1
    for hour = 0:23
        figure((day-1)*24+hour+1)

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

        % codar data
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

        A600=imread([fn '.png']);
        [I600,map600]=rgb2ind(A600,256);
        
        % create gif
        if(count==1)
          imwrite(I600,map600,['TOTL_ALLM.gif'],'DelayTime',0.6,'LoopCount',Inf);
        else
            imwrite(I600,map600,['TOTL_ALLM.gif'],'WriteMode','append','DelayTime',0.6);
        end

        count = count + 1;

    end
end
