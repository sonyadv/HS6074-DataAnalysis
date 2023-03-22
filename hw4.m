clc; clear; fclose all; close all;

%% plot codar data
for month = 9:9

    % create the folder
    m = sprintf('%02d',month);
    mkdir(m);

    for day = 15:30

        % initial declaration
        box=[0];
        U=[0];
        V=[0];

        for hour = 0:23
    
            % read files
            fn=['TOTL_ALLM_2014_' sprintf('%02d',month) '_' sprintf('%02d',day) '_' sprintf('%02d',hour) '00' '.tuv'];
            q = load(fn);
            
            % collect the data in the range(120~120.5, 22.5~23)
            [rol com] = size(q);
            b=1;
            u=1;
            v=1;
            for i = 1:rol
                if q(i,1)<=121.5 && q(i,1)>=121
                    if q(i,2)<=24 && q(i,2)>=22.5
                        % calculate the velocity
                        box(b,hour+1) = sqrt(q(i,3)^2+q(i,4)^2);
                        U(u,hour+1) = q(i,3);
                        V(v,hour+1) = q(i,4);
                        
                        b = b+1;
                        u = u+1;
                        v = v+1;
                    end
                end
            end
        end
        
        % plot the box chart
        subplot(3,1,1);
        boxchart(box);
        ylim([0 200]);
        ylabel('Velocity(cm/s)');
        title([sprintf('%02d',month) '/' sprintf('%02d',day)]);
        
        subplot(3,1,2);
        boxchart(U);
        ylim([-100 200]);
        ylabel('U(cm/s)');
        
        subplot(3,1,3);
        boxchart(V);
        ylim([-100 200]);
        ylabel('V(cm/s)'); xlabel('Time(hour)');
        
        % save to png file
        savename = ['TOTL_ALLM_2014_' sprintf('%02d',month) '_' sprintf('%02d',day)];
        print([savename '.png'],'-dpng','-r600');

        % move the png files to the specified folders
        files = [savename '.png'];
        movefile(files, m, 'f');

    end
end
