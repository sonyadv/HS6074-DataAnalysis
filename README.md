# HW1 台灣海底地形圖

## M_Map
### M_map 安裝
1. 下載 `m_map` ：https://www.eoas.ubc.ca/~rich/mapug.html#p1
2. 將 `m_map` 解壓縮至本機磁碟的 `Program Files\MATLAB\R2022a\toolbox`
3. 於 Matlab > Home > Environment > Set path > Add folder 加入 `m_map` 並儲存
4. 於 [Example Code](https://www.eoas.ubc.ca/~rich/map.html#examples)  取得 `17. Shaded Relief (Example 1)`

   > 此時執行會出現 `etopo2.m` 之 warning，故需下載高解析度的海底地形數據與海岸線數據，如果沒有下載任何 etopo 的話畫出來的圖會長這樣
  
   > ![org](https://user-images.githubusercontent.com/28960431/222408041-e9a1badf-5ccb-4c5f-b595-962067b8f726.jpg)
 
### etopo1 與 coastline 安裝
1. **下載[海岸線](https://www.ngdc.noaa.gov/mgg/shorelines/gshhs.html)**
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

2. **下載[etopo1](https://www.ngdc.noaa.gov/mgg/global/relief/ETOPO1/data/ice_surface/grid_registered/binary/)**
    > 重新查詢後發現我誤解了`m_map`的地形檔差別，`m_map`中自帶的地形檔解析度為 **1°**，所以不論是下載 etopo1 還是 etopo2 都比`m_map`自帶的解析度好，而`m_map`建議的檔案為 etopo2v2 ，此處設定參考 [Matlab下地形圖繪圖包m_map安裝與使用](https://blog.csdn.net/weixin_39509073/article/details/113247019) ，選用 etopo1。另外 Matlab 本身也有 [etopo](https://www.mathworks.com/help/map/ref/etopo.html) 的函數，裡面有不同解析度與檔案格式的說明。

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
 
### HW1_plotSF.m **地貌暈渲圖**
> ![map1](https://user-images.githubusercontent.com/28960431/222152913-4a2ac5d5-90d1-407b-869d-0f87a41e4e98.png)
> by 王硯葶

> ![image](https://user-images.githubusercontent.com/126145166/222143598-46c7dac2-6007-433f-88ba-23ff27373e85.jpg)
> by 柯亞岑

### HW1_plotLC.m **等角投影**
> ![Lambert Conformal Projection](https://user-images.githubusercontent.com/28960431/222171211-237738f2-580a-419f-b072-0ff61f970541.png)

### HW1_plotLCC.m **正軸等角圓錐投影**
> ![Lambert Conformal Conic projection](https://user-images.githubusercontent.com/126145166/222165932-812935a3-60dc-475b-a5c1-d9adbe3ea774.jpg)

### HW1_plotOM.m **斜軸麥卡托投影**
> ![Oblique Mercator Projection](https://user-images.githubusercontent.com/28960431/222169463-d3012645-99df-4460-8002-cf40a9ae21f6.png)

### HW1_plotUTM.m **通用橫軸麥卡托投影**
>　![UMT](https://user-images.githubusercontent.com/28960431/222169764-761b11dc-e368-4ecc-b9ac-f50d2c483b97.png)

### HW1_plotMiller.m **米勒圓柱投影**
> ![miller projection](https://user-images.githubusercontent.com/126145166/222170860-81f5564f-3831-4848-a1d8-48ea21bac349.jpg)

> 參考資料：
> 1. https://www.eoas.ubc.ca/~rich/map.html#examples
> 2. https://blog.csdn.net/weixin_39509073/article/details/113247019
> 3. https://blog.csdn.net/wokaowokaowokao12345/article/details/88354118

## layer01.dat
* 數據範圍：(118, 18)~(124, 26)
* 解析度比較差
* 預處理過，可以直接跑

###  HW1_plotLayer01.m
> ![Layer01](https://user-images.githubusercontent.com/28960431/222131023-61233794-2374-4111-ad53-4d01a66490c6.png)

## Taipd200m.xyz
  * (119.036, 21) ~ (123, 26)
  * 應該是解析度200公尺(?)，不太確定
  * 檔案很大！（長 X 寬 = 2001 x 2501 = 5004501）

> 測試前處理用的出圖結果，基本上跟 `HW1_plotLayer01` 的做法一樣

> ![200](https://user-images.githubusercontent.com/28960431/222420935-2057bc37-b690-495d-9d1e-01a730d0fddd.png)
