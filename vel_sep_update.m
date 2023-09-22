clc; clear; fclose all; close all;

%% init para setting
cd ..
area = csvread('area.csv');

cd('TORI')

% Set up the area
% 0:0.2:2.8
power_sep = zeros(5,40);
range = 0.1;

%% plot codar data

season = [2 3 7 8 9 10 11 12];
season_name = ['2015 Spring';'2015 Summer';'2014 Autumn';'2014 Winter'];
count = [0,0,0,0,0];
p = [0,0,0,0,0];

for month=1:8

    x = 118.5:0.1:123.5;
    y = 21:0.1:26.5;
    [X,Y] = meshgrid(x,y);

    for d = 1:31
    for hr = 0:24

        if month <= 4
            fn_day = ['TOTL_TORO_2015_' sprintf('%02d',season(month)) '_' sprintf('%02d',d) '_' sprintf('%02d',hr) '00.tuv'];
        else
            fn_day = ['TOTL_ALLM_2014_' sprintf('%02d',season(month)) '_' sprintf('%02d',d) '_' sprintf('%02d',hr) '00.tuv'];
        end

        if  exist(fn_day)~=0


            
            q = load(fn_day);

            % elements
            lon_d = q(:,1);
            lat_d = q(:,2);
            vel = q(:,13);
			vel = vel./100; %cm to m
            
            %power = power + p;
            [len c] = size(lon_d);

            % dumber way
            %[len c] = size(lon_d);
            [ly lx] = size(X);
            
            for i = 1:len
                for pos = 1:5
                    if lon_d(i) >= area(pos,1) && lon_d(i) <= area(pos,2)
                    if lat_d(i) >= area(pos,3) && lat_d(i) <= area(pos,4)
                        if vel(i)~= 0
                            %p(pos) = p(pos) + vel(i);
                            count(pos) = count(pos) + 1;
                            power_sep(pos,floor(vel(i)/range)+1) = power_sep(pos,floor(vel(i)/range)+1)+1;
                        end
                    end
                    end
                end
            end
         
            %day_avg = p./count;

        end
    end
    end
end

for i=1:5
    power_sep(i,:)=power_sep(i,:)./sum(power_sep(i,:))
end

area_name = ['North ';'East 1';'East 2';'South ';' West '];

for i=1:5
    figure(i)
    bar(power_sep(i,1:20))
    ylim([0 0.2])
    xticklabels(['0.0';'0.2';'0.4';'0.6';'0.8';'1.0';'1.2';'1.4';'1.6';'1.8';'2.0';])
    yticks(0:0.05:0.2)
    yticklabels({'0%','5%','10%','15%','20%'})
    xlabel('Velocity (m/s)','FontSize',12)
    ylabel('Percent','FontSize',12)
    set(gca, 'YGrid', 'on', 'XGrid', 'off')
    title(area_name(i,:),'FontSize',16)
    print([area_name(i,:) '.png'],'-dpng','-r600');
end
