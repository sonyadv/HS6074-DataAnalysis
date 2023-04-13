% 可能會噴一些我懶得看得 warring
% 跑一天大概要半個多小時吧（內顯、無平行處理

clc; clear; fclose all; close all;

%% initial argument setting
r = 2.5; %10kW FKT商用機型
rho = 1024;
A = r^2*pi;
Cp = 0.35;

%% plot power by hour (9/15)
for month = 9:9
    for day = 15:15
        for hour = 0:23
            cd('codar_data')
            
            % read files
            fn=['TOTL_ALLM_2014_' sprintf('%02d',month) '_' sprintf('%02d',day) '_' sprintf('%02d',hour) '00' '.tuv'];
            if( exist(fn) )
                q = load(fn);

                v_lon = q(:,1);
                v_lat = q(:,2);
                vel = [0];
    
                % calculate the velocity
                vel = sqrt(q(:,3).^2+q(:,4).^2);
                vel = vel.^3;
                
                % calculate the power and reshape to martix
                power = vel.*rho*A*Cp;
                [Lon, Lat] = meshgrid(v_lon,v_lat);
                P = griddata(v_lon, v_lat, power, Lon, Lat);
             
                %% contour
                m_proj('mercator','long',[119 123],'lat',[21 26]);
                hold on
                m_pcolor(Lon,Lat,P);
                cmap = cbrewer2('BuPu',100);
                colormap(cmap);
                h=colorbar;
                shading flat; axis image;
                hold on
                m_gshhs_f('patch',[.8 .8 .8]);
                m_grid('linewidth',3,'xtick',0:1:180,'fontsize',10,'ytick',-40:1:40,'fontsize',10);
                xlabel('Longitude'); ylabel('Latitude');
                title(['9/15 ' sprintf('%04d',hour)]);
                cd ..

                % save to png file
                savename = ['0915_' sprintf('%04d',hour)];
                print([savename '_contour_hour.png'],'-dpng','-r600');
            end
            
        end
    end
end
