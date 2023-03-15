# HW3 ocean current analysis
## statistics variables(ex. range, IQR...)
## tide period

## 程式碼解說
1. **讀取檔案**
時間是9到12月，但不是每個日期都有，也不是每個月都有31號，所以要先檢查檔案有沒有存在。
順便建立每個月的資料夾，這樣輸出圖片後會比較好整理。

```
for month = 9:12
  m = sprintf('%02d',month);
  mkdir(m);
  for day = 1:31
    for hour = 0:23 
      fn=['TOTL_ALLM_2014_' sprintf('%02d',month) '_' sprintf('%02d',day) '_' sprintf('%02d',hour) '00' '.tuv'];
      if exist(fn,'file')
        q = load(fn);
      end
    end
  end
end
```

2. **蒐集要畫成 box chart 的資料**
box要宣告在hour外，每天重新宣告box比較不會佔記憶體空間。
整個 q 掃過一遍，用兩個if來判斷經緯度是否在我們要取的範圍內，如果是的話計算速度並記錄在當下時間的位置裡。
```
  box=[0];
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
```

3. **畫圖**
使用 `boxchart` ，能夠一次畫多個 boxplot。
```
        boxchart(box);
        ylabel('Velocity'); xlabel('Time(hour)');
        title([sprintf('%02d',month) '/' sprintf('%02d',day)])
```

4. **存檔**
將檔案存成`.png`並移到剛剛建立好的資料夾裡。

```
        % save to png file
        savename = ['TOTL_ALLM_2014_' sprintf('%02d',month) '_' sprintf('%02d',day)];
        print([savename '.png'],'-dpng','-r600');

        % move the png files to the specified folders
        files = [savename '.png'];
        movefile(files, m, 'f');
```
