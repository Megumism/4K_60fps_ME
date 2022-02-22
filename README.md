# 4K_60fps_ME

Motion Vector Estimation on 4K@60fps Video 运动向量估计硬件电路设计

## 基本信息

### 名词解释

- ME：Motion Estimation
- SAD：Sum of Absolute Difference
- X帧、X：当前帧
- Y帧、Y：先前帧
- 小块：8x8的X帧小块
- 大块：23x23的Y帧大块，即搜索区域
- 九宫格：大块的中心是小块，延长小块边得到大块的“井”字形分割，是大块的基本复用单位
- 小格：大块九宫格中的一格
- 大核*：独立承担一个大块搜索任务的核心，一般几“核”指几个大核
- 小核*：在大核内，负责进行256次比较的运算单元

> *均为未确定架构

### 常数速查

#### 帧性质

- 4K：3840*2160@60fps
- 像素性质：8bit亮度
- 小块数量：480*270=129600
- 大块总信息量：23^2=529B

#### 面积

- IO：35um X 110um

逻辑单元：高度均为1.8um，其中寄存器（时许逻辑单元）的宽度为5.6um，电路中使用频率最高的几种组合逻辑单元宽度如下（XN表示驱动强度）：

- INVX1：0.6um
- NANDX1：0.8um
- NORX1：0.8um

#### 延时

55nm 工艺库常用cell延迟大约为：

- D flip-flop的Tclk-to-Q：~0.075ns
- 全加器 ADDF：~0.17ns
- NAND2: ~0.02ns
- IO：~2.5ns

> 详见datasheet: "~/Desktop/Workspace/55nm/lped0663_hu55npkllogcasdst000f.pdf"

## 讨论纪要

### 第二周

#### 已定

1. 确定了电路输出的结果可以用脚本重新组织
2. 确定了平均带宽在950MB/s
   <img src="http://chart.googleapis.com/chart?cht=tx&chl=\Large 2\times1\mathrm{B}\times3840\times2160\times60\mathrm{fps}=950\mathrm{MB/s}" style="border:none;">
3. 确定了最高频率不超过100MHz*

#### 未定

1. 探索了在四核架构下的三种搜索方式
   - 斜向排列
   - 线性排列
   - 田字形排列

#### 待定

1. 大块搜索：大块几核？如何排列？如何移动？
2. 小块搜索：

> *：注意到在100MHz下，IO已经需要达到9.5B/周期，可能需要为了IO提高频率
