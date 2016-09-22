# FQBarrageEffect
屏幕弹幕效果使用说明
1.点开 switch 按钮,开启弹幕效果
2.关闭 switch 按钮,关闭弹幕效果
 ![image](https://github.com/CarolineQian/FQBarrageEffect/raw/master/barrage.png)


实现思路:
所需: NSTimer   NSArray   UISwitch
1-打开 Switch: 生成 NSTimer,设置0.2s重复执行步骤2
2-生成 label 并添加动画效果: 5S内从屏幕右侧移动至左侧,动画结束后移除 label
3-关闭 Switch: 停止 NSTimer并置为 nil
