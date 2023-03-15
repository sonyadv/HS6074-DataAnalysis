clc; clear; fclose all; close all;

%% plot codar data
for month = 12:12

    % create the folder
    m = sprintf('%02d',month);
    mkdir(m);

    for day = 1:11

        % initial declaration
        box=[0];

        for hour = 0:23
    
            % read files
            fn=['TOTL_ALLM_2014_' sprintf('%02d',month) '_' sprintf('%02d',day) '_' sprintf('%02d',hour) '00' '.tuv'];
            q = load(fn);
            
            % collect the data in the range(120~120.5, 22.5~23)
            [rol com] = size(q);
            b=1;
            for i = 1:rol
                if q(i,1)<=120.5 && q(i,1)>=120
                    if q(i,2)<=23 && q(i,2)>=22.5
                        % calculate the velocity
                        box(b,hour+1) = sqrt(q(i,3)^2+q(i,4)^2);
                        b = b+1;
                    end
                end
            end
        end
        
        % plot the box chart
        boxchart(box);
        ylabel('Velocity'); xlabel('Time(hour)');
        title([sprintf('%02d',month) '/' sprintf('%02d',day)])
        
        % save to png file
        savename = ['TOTL_ALLM_2014_' sprintf('%02d',month) '_' sprintf('%02d',day)];
        print([savename '.png'],'-dpng','-r600');

        % move the png files to the specified folders
        files = [savename '.png'];
        movefile(files, m, 'f');

    end
end

