clc; clear; fclose all; close all;

%% init para setting
r = 2.5; % 10kW FKT商用機型
rho = 1024; % kg/m^3
A = r^2*pi; % m^2
Cp = 0.35;

cd ..

% % read the .xyz file and seprate into three array: lx, ly, lz
% taipd = load('Taidp200m.xyz');
% lx = taipd(:,1);
% ly = taipd(:,2);
% lz = taipd(:,3);
% 
% % reshape 1-dim arrays into 2-dim martix
% bath_x = reshape(lx,2001,2501);
% bath_y = reshape(ly,2001,2501);
% depth = reshape(lz,2001,2501);

cd('codar_data')

%% plot codar data
for month = 9:9
        % set up the grid
    x = 118.5:0.1:123.5;
    y = 21:0.1:26.5;
    [X,Y] = meshgrid(x,y);
            
    % count
    power = zeros(size(X));
    


    for day = 15:30
            

        for hour = 0:23

            % initialize
            count = zeros(size(X));
            p = zeros(size(X));

            % read files
            fn=['TOTL_ALLM_2014_' sprintf('%02d',month) '_' sprintf('%02d',day) '_' sprintf('%02d',hour) '00' '.tuv'];
            q = load(fn);

            % elements
            lon_d = q(:,1);
            lat_d = q(:,2);
            u = q(:,3)./100;
            v = q(:,4)./100;
			
            vel = u.^2+v.^2;
            vel = vel.^(0.5);
            vel = vel.^3;

            % calculate
            % seems like we could use griddata
            % but i'm too tired to study it
            % power = griddata(x,y,vel,lon_d,lat,'linear');

            % dumber way
            [len c] = size(lon_d);
            [ly lx] = size(X);

			for i = 1:len
                r=0; c=0;

			     % find lon_d
				for j = 1:lx-1
               		if lon_d(i)>=x(j) && lon_d(i)<=x(j+1)
					    c = j;
                    end
                end

				       % find lat
			    for j = 1:ly-1
                    if lat_d(i)>=y(j) && lat_d(i)<=y(j+1)
                        r = j;
                    end
                end
				
               % memo
               p(r,c) = p(r,c)+vel(i);
               count(r,c) = count(r,c)+1;
            end

            p = p./count;
            p(isnan(p)) = 0;
            power = power+p;
        % end of hour
        end

    % end of day
    end


        %power = power./count;
        %power(isnan(power)) = 0;
        power(power == 0) = NaN;
        power = power.*rho*A*Cp; % vel^3 to power
        power = power.*3600; % everyhour
        power = power.*(10^-3); % W to kW
			
        % plot power
        m_proj('lambert','lat',[21 26.5],'long',[118.5 123.5]);
        hold on
        m_pcolor(X,Y,power);
        %caxis([0 10]);
        hold on
        m_gshhs_i('color','k');
        
        cmap = cbrewer2('YlGnBu',100);
        colormap(cmap);
        h=colorbar;
        set(get(h,'title'),'string','kJ');
        shading flat; axis image;
        xlabel('Longitude'); ylabel('Latitude');
        %hold on
        
        % plot coastline
%         contourf(bath_x,bath_y,depth,[0 0],'k','linewidth',1.3) 
        m_grid('box','fancy','tickdir','in');
        date = [sprintf('%02d',month) '/' sprintf('%02d',day)];
        title("September");


        % safe flies
        savename = ['dailypower_' sprintf('%02d',month) '_' sprintf('%02d',day)];
        print(['sep.png'],'-dpng','-r600');

end
