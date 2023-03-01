# HW1
## 台灣海底地形圖
* Taipd200m.xyz
  * (119.036, 21) ~ (123, 26)
  * 應該是解析度200公尺(?)，不太確定
  * 檔案很大！（長 X 寬 = 2001 x 2501 = 5004501）
* layer01.dat
  * (118, 18)~(124, 26)
  * 解析度比較差
  * 預處理過，可以直接跑

## M_Map 安裝
### M_map
1. 下載 `m_map` ：https://www.eoas.ubc.ca/~rich/mapug.html#p1
2. 將 `m_map` 解壓縮至本機磁碟的 `Program Files\MATLAB\R2022a\toolbox`
3. 於 Matlab > Home > Environment > Set path > Add folder 加入 `m_map` 並儲存
4. 於 [Example Code](https://www.eoas.ubc.ca/~rich/map.html#examples)  取得 `17. Shaded Relief (Example 1)`
  ```python
  m_proj('lambert','lat',[5 24],'long',[105 125]);

  set(gcf,'color','w')   % Set background colour before m_image call

  caxis([-6000 0]);
  colormap(flipud([flipud(m_colmap('blues',10));m_colmap('jet',118)]));
  m_etopo2('shadedrelief','gradient',3);
 
  m_gshhs_i('patch',[.8 .8 .8]);
 
  m_grid('box','fancy');

  ax=m_contfbar(.97,[.5 .9],[-6000 0],[-6000:100:000],'edgecolor','none','endpiece','no');
  xlabel(ax,'meters','color','k');
  ```
 此時執行會出現 `etopo2.m` 之 warning，故需下載高解析度的海底地形數據與海岸線數據
 
### etopo2 與 coastline
1. 
