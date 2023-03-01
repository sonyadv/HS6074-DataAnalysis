# HW1 台灣海底地形圖

## M_Map
### M_map 安裝
1. 下載 `m_map` ：https://www.eoas.ubc.ca/~rich/mapug.html#p1
2. 將 `m_map` 解壓縮至本機磁碟的 `Program Files\MATLAB\R2022a\toolbox`
3. 於 Matlab > Home > Environment > Set path > Add folder 加入 `m_map` 並儲存
4. 於 [Example Code](https://www.eoas.ubc.ca/~rich/map.html#examples)  取得 `17. Shaded Relief (Example 1)`
   > 此時執行會出現 `etopo2.m` 之 warning，故需下載高解析度的海底地形數據與海岸線數據
 
### etopo2 與 coastline 安裝
1. 下載[海岸線](https://www.ngdc.noaa.gov/mgg/shorelines/gshhs.html)
    1. Download GSHHG data version 2.3.7
    2. 於 `m_gshhs.m` 中可以看到
       ```m
       % Root of directories where all the gshhs_X.b, wdb_borders-X.b and wdb_rivers_X.
       % files live
       % Construct the complete filename by starting with the location of this
       % file and adding /data/:
       FILNAME=[fileparts(which('m_gshhs.m')) '/data/'];
       ```
       故將 GSHHG data 解壓縮至 `m_gshhs.m` 所在的資料夾中的 `data` 資料夾即可，不須修改 `m_gshhs.m` 的內容

2. 下載[etopo2](https://www.ngdc.noaa.gov/mgg/global/relief/ETOPO1/data/ice_surface/grid_registered/binary/)
    1. 下載 `etopo1_ice_g_i2.zip` 並解壓縮到 `m_map` 中
    2. 於 `m_etopo2.m` 中可以看到
       ```
       %%% This will have to be set by YOU the USER! ---------------------

       %PATHNAME='/ocean/rich/more/mmapbase/etopo2v2/';
       PATHNAME='C:/Program Files/MATLAB/R2022a/toolbox/m_map/etopo1/';   
       % Be sure to end the path with a "/" or whatever your separator is.
       ```
    3. 將此行的 Pathname 改為 `etopo1_ice_g_i2.bin` 所在的路徑（**記得結尾必須加上 / ！**）
       > 如果修改 `m_etopo2.m` 時跳出無法儲存的訊息，可以開一個新的 `.m` 檔並把 `m_etopo2.m` 的內容複製過去，在本機磁碟外的地方編輯完後，把原本的 `m_etopo2.m` 覆蓋掉就可以啦 :D
 
 3. 醬就好啦！
    > 保險起見可以再做一次 Add Path 的動作，確保現在讀到的 m_map 是更新後的。現在就可以成功跑出高解析度ㄉ `Shaded Relief` ㄌ！
 
 ### 繪圖
> HW1_plotMap.m

> ![image](https://user-images.githubusercontent.com/28960431/222141551-0f68ae6a-cad0-4033-b65b-f05c222c56e9.png)
> by Sonya

> ![untitled](https://user-images.githubusercontent.com/126145166/222141994-7ba6aa0c-d558-47da-b35e-055d1ea5a06d.jpg)
> by Nanzulo

## layer01.dat
* 數據範圍：(118, 18)~(124, 26)
* 解析度比較差
* 預處理過，可以直接跑

## 繪圖
> HW1_plotLayer01.m

 ![Layer01](https://user-images.githubusercontent.com/28960431/222131023-61233794-2374-4111-ad53-4d01a66490c6.png)

## Taipd200m.xyz
  * (119.036, 21) ~ (123, 26)
  * 應該是解析度200公尺(?)，不太確定
  * 檔案很大！（長 X 寬 = 2001 x 2501 = 5004501）
 
