# HW2

## Taipd200m.xyz
### 數據前處理

> <p>應該要用 matlab 做的但我來不及研究ㄌ就直接用COMCOT跑ㄌ QQ</p>
> 不是很會寫 matlab 所以之後有空應該會用 C++ 寫

1. **原始數據格式**

    此處需要將這個二維陣列拆成三個二維陣列（x\*x, y\*y, z\*z)，才能在 Matlab 中使用 `contour` 或 `pcolor`。
    
| longitude | latitude | depth  |
| ------ | ------ | ------ |
| 119     | 26 | 655.824707031 |
| 119.002 | 26 | 656.41418457  |
| 119.004 | 26 | 661.540527344 |
| 119.006 | 26 | 674.647277832 |
| 119.008 | 26 | 691.231994629 |
| 119.01  | 26 | 706.741882324 |

2. **使用 COMCOT 跑前處理** ~~偷吃步~~
   > OK我想大家都知道COMCOT是做什麼用的就不在此贅述ㄌ，總之在跑海嘯或其他水波的模擬前，會需要底床地形圖，所以COMCOT會自動生成一組`layer`、`layer_x`、`layer_y`，做為不同格式的數據前處理
  * layer_x、layer_y：將經度與緯度各拆成一個一維陣列的檔案，可以想像成座標軸刻度
  * layer：把原本是一維陣列的水深依照對應的經緯度填入二維陣列      
   
  處理好的資料我已經丟在 release，HW2那邊有一個layer02.zip，直接下載就是可以拿去 Matlab 用的數據ㄌ

### 繪圖 HW2_plotTaipd200m.m

1. **讀入檔案**

   ```
   lx=dlmread('layer02_x.dat'); 
   ly=dlmread('layer02_y.dat');
   lz=dlmread('layer02.dat');
   ```

2. **使用 `meshgrid` 製作矩陣**

   ```
   [lon,lan]=meshgrid(lx,ly); 
   depth=reshape(lz,length(lx),length(ly));
   depth= -depth';
   ```

    1. 先將原先是一維陣列的 x 軸與 y 軸畫成二維陣列，讓矩陣的每個點都標記上各自的經緯度
    2. 透過另一個矩陣紀錄每個點的水深
    3. Taipd200.xyz 原先是**向下為正，向上為負**，故需將所有數值加上負號

3. **繪製地形** 

   ```
   pcolor(lon,lan,depth);
   caxis([-6000 4000]);
   colormap([flipud(m_colmap('blue',5850)); m_colmap('blues',150); flipud(m_colmap('green',4000))]);
   shading flat; axis image;
   ```
   
    1. 使用 `pcolor` 依照 depth 的參數填上顏色
    2. 範圍：-6000m ~ 4000m
    3. 使用 `colormap` 設定不同範圍的顏色
       > <p>為了使台灣海峽區域的地形顏色更明顯，我將 -150 ~ 0 和 -6000 ~ -150 的 colorbar 區分開來，而 0 以上則使用綠色作為陸地的顏色</p>
       > 這邊應該有更好的畫法QQ
    4. 設定填色的參數
    
4. **繪製海岸線**
   ```
   hold on
   contour(lon,lan,depth,[0 0],'k','linewidth',1.3)
   box on; grid on; set(gca, 'layer', 'top');
   ```
   1. 使用 `contour` 標上 0m 等高線作為海岸線
   2. 設定邊線與繪製於地形圖之上
 
5. **圖例與座標軸標示**
   ```
   hcb = colorbar;
   set(get(hcb,'Ylabel'),'String','Elevation (m)');
   xlabel('Longitude'); ylabel('Latitude');
   titleI('Taipd200m.xyz data')
   ```
6. **成果**

    ![untitled1](https://user-images.githubusercontent.com/28960431/223664695-abdd6587-c6a2-4fc7-9bc1-842f126c17a3.png)

7. **reverse前的圖**
   ![untitled](https://user-images.githubusercontent.com/126145166/223707267-3e0247b7-1f7e-4002-ba96-01d1bc1af382.jpg)


   
