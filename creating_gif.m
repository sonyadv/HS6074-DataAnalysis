% create gif animations
function creating_gif(fn1,fn,ii_count)
    A600=imread(['r600.' fn1 '.png']);
    A72=imread(['r72.' fn1 '.png']);
    [I600,map600]=rgb2ind(A600,256);
    [I72,map72]=rgb2ind(A72,256);
    if(ii_count==1)
        imwrite(I600,map600,['r600.' fn '.gif'],'DelayTime',0.6,'LoopCount',Inf);
        imwrite(I72,map72,['r72.' fn '.gif'],'DelayTime',0.6,'LoopCount',Inf);
    else
        imwrite(I600,map600,['r600.' fn '.gif'],'WriteMode','append','DelayTime',0.6);
        imwrite(I72,map72,['r72.' fn '.gif'],'WriteMode','append','DelayTime',0.6);
    end