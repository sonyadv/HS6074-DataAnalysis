# HW4

## 洋流盒狀圖
* 把原本的圖改成 速度／U／V
* 固定Y軸
* 增加範圍

| area | Lon range  | Lat range | 特色 |
| -------- | -------- | -------- | ---------|
| 西南近岸 | (22.5~24N) | (120~120.5E) | 大概是澎湖水道的位置 |
| 西南遠岸 | (22.5~24N) | (119.5~120) | 深度約50~100m |
| 東部近岸 | (22.5~24N) | (121~121.5) |  |
| 東部遠岸 | (22.5~24N) | (121.5~122) |  |

## 潮汐圖
> 感覺可以畫日平均的速度圖，能看出季節或區域差異
> 氣象局的潮汐觀測圖(2014)

> [潮汐年報（共113頁，流量預警）](https://www.google.com/url?sa=t&source=web&rct=j&url=https://www.cwb.gov.tw/Data/service/notice/download/publish_20140428143540.pdf&ved=2ahUKEwij6O_dgvD9AhVFT2wGHRdjDUMQFnoECB4QAQ&usg=AOvVaw28iUl8QPylxVD8O19lQDhV)

### 東部近岸（花蓮）
 | ![](https://i.imgur.com/FgfRbmA.jpg) |
 | -------- |
 | ![](https://i.imgur.com/FzvaNQX.jpg) |
 | ![](https://i.imgur.com/QMNUR8Z.jpg) |
 | ![](https://i.imgur.com/68VouTr.jpg) |
 | ![](https://i.imgur.com/Br5EYCP.jpg) | 
 | ![](https://i.imgur.com/XinFlxG.jpg) |

 ### 西部近岸（布袋） 
 | ![](https://i.imgur.com/sGuvCJ4.jpg) |
 | -------- |
 | ![](https://i.imgur.com/g5ZfouA.jpg) |
 | ![](https://i.imgur.com/hkIxe4c.jpg) |
 | ![](https://i.imgur.com/5bgcFiL.jpg) |
 | ![](https://i.imgur.com/W3OXooz.jpg) |
 | ![](https://i.imgur.com/LCkOBOq.jpg) |

## 潮汐能公式
> https://www.irena.org/publications/2020/Dec/Innovation-Outlook-Ocean-Energy-Technologies
> https://www.linkedin.com/pulse/tidal-power-based-numbers-ian-gagnon/

### 台灣附近海域之海流發電 Ocean Current Power in the Region around Taiwan
> [name=林勝豐 Sheng Fong Lin] 2008, 科儀新知 第三十一卷第五期

- 流速與發電
![](https://i.imgur.com/7sF03Ds.jpg)
* **公式： P/A = 0.5PV^3**
    * P 為發電潛能
    * A 為海流通過之截面積 (m^2)
    * roh為海水密度 (kg/m^3)，約為 1024 kg/m^3
    * v 為海流流速 (m/s)
- 台灣附近海域強流區之流速機率分布
![](https://i.imgur.com/wLaUp8U.jpg)

### Tidal Power (Based on the Numbers)
> [name=Ian Gagnon, PE]2018, LinkIn

* ![](https://i.imgur.com/G8s3sa0.png)
    * P is the amount of power that the device can extract from the flow
    * rho (the greek symbol that kinda looks like a p) is the desity of the fluid the device is in (air for wind turbines, water for tidal turbines)
    * A is the flow intercepting area of the turbine rotor
    * V is the fluid velocity
    * $C_p$ is the coefficient of power of the device which is essentially it's efficiency.

### 海流變電流
> [name=柯永澤] 2012, 科學發展 471期

* ![](https://i.imgur.com/a5usmHA.jpg)
    * P 電功率
    * $\rho$ 水的密度
    * V 海流進入葉輪前的速度
    * A 葉輪的圓盤面積
    * $C_p$ 轉換功率係數，即轉換效率，約0.35

## 問題討論
### 問題
* 現在有具體的case嗎？
* 比較可能發展潮汐能的場域
* 如果要寫成文章的話研究目的那些要寫什麼？

### 海流發電需要考慮的其他事情

1. 流速過快的時候渦輪機可能被蝕鏽
2. 颱風可能會破壞渦輪機
3. 安裝的成本較高，經濟效益問題

* [國內海洋能發電利用海流、波浪、溫差、潮流發電發展](https://www.google.com/url?sa=t&source=web&rct=j&url=https://km.twenergy.org.tw/ReadFile/%3Fp%3DKLBase%26n%3D20111125162159.pdf&ved=2ahUKEwjzm7al7u_9AhU9R2wGHTO3AyoQFnoECDcQAQ&usg=AOvVaw3YXOGqSp9Ecn05JOExvdrx)
    > 一般而言，當流速越大，渦輪機的轉速也越快，驅動發電的效果就越好。但當海流流速超過 8m/s 時，渦輪機可能會產生孔蝕現象，進而破壞機組；且海流渦輪機轉速較快，較易影響海洋環境及生態，或使海中生物及殘骸吸入渦輪機，造成損害；且機組抗海水腐蝕也是維修上的一大挑戰，使得海流渦輪機成本常高於風力渦輪機。 
* 海流變電流
    > 第一，台灣地區颱風多，因此雖然水表面附近流速較快，機組不能長期安裝在靠近水表面的地方，以免被大浪破壞。這系統在水深的方向必須可以調整，即平常機組處於水表面，但遇颱風可以沉至較深的位置。這不難辦到，只需有足夠系統預留浮力做調整即可。
    第二，系統既然需要沉入水中，就有水密的問題。這問題在陸地上是不須面對的，而要克服水密的問題傳統上要付出很高的代價，因此必須發展經濟有效的方式才有可能。
    第三，海事工程較陸上工程複雜且花費高很多，因此機組構件必須簡單可靠，使維修降至最低。另外若針對黑潮，還有一個非常嚴重的問題，即黑潮的水深很深，要如何固定安裝？深海鑽油平台有張力腳（tension leg）的安裝方式，費用很高，但因為開發石油的產值很高，是可以負擔的。可是海流發電回收不高，必須找到經濟有效的方式，否則就不可行。

### 海流流速的機率分布
> ![](https://i.imgur.com/GHLwL4N.jpg)
> 台灣附近海域之海流發電

這篇只做了整個台灣周邊海域的分析，說不定我們可以針對各區域做討論
