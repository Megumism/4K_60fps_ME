# 4K_60fps_ME

Motion Vector Estimation on 4K@60fps Video 运动向量估计硬件电路设计

## 1. 总架构

1. 确定了电路的SADPC >= 10*
2. 确定了电路的架构为单大核
3. 确定了工作分为IO buffer与Core两组
4. 确定了大核与IO buffer的通信速率为64B每周期**

> *：129600\*256\*60/200M=9.95
>
> **：(23^2+64)/ceil(256/10)=24 B

## 2. Core

1. 总的架构分为16个SAD Array，外接一个Compare Tree，输出
2. 每个SAD内含64个SD Array，也叫PE阵列，阵列连接到加法树上

> 详见[./core/架构.pdf](./core/架构.pdf)

## 3. Buffer

> 详见[./buffer/buffer.pdf](./buffer/buffer.pdf)

## 4. 其他信息

### 4.1. 名词解释

- ME：Motion Estimation
- SAD：Sum of Absolute Difference
- SADPS：SAD per cycle
- X帧、X：当前帧
- Y帧、Y：先前帧
- 小块：8x8的X帧小块
- 大块：23x23的Y帧大块，即搜索区域
- 九宫格：大块的中心是小块，延长小块边得到大块的“井”字形分割，是大块的基本复用单位
- 小格：大块九宫格中的一格

### 4.2. 常数速查

#### 4.2.1. 帧性质

- 4K：3840*2160@60fps
- 像素性质：8bit亮度
- 小块数量：480*270=129600
- 大块总信息量：23^2=529B

#### 4.2.2. 面积

- IO：35um X 110um

逻辑单元：高度均为1.8um，其中寄存器（时许逻辑单元）的宽度为5.6um，电路中使用频率最高的几种组合逻辑单元宽度如下（XN表示驱动强度）：

- INVX1：0.6um
- NANDX1：0.8um
- NORX1：0.8um

#### 4.2.3. 延时

55nm 工艺库常用cell延迟大约为：

- D flip-flop的Tclk-to-Q：~0.075ns
- 全加器 ADDF：~0.17ns
- NAND2: ~0.02ns
- IO：~2.5ns

> 详见datasheet: "~/Desktop/Workspace/55nm/lped0663_hu55npkllogcasdst000f.pdf"
