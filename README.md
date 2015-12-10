### 一个简单的蝙蝠飞动画

![](https://github.com/Xiezhichao/CCBatAnimation/blob/master/demo.gif)  

# Usage

拖`CCBatAnimation`文件夹进工程<br>
```
    // OC
    #import "CCBatAnimation.h
    [CCBatAnimation addBatAnimation:self.view withCount:20];
    
    // SWift
    #import "Demo-Swift.h"
    [CCSBatAnimation addBatAnimation:self.view andCount:20];
    
```

# explain
原理很简单：
* 弄一些随机数。
* 利用`UIImageView`自带的`animationImages`属性，设置三张图片循环播放。
* 然后使用`CAKeyframeAnimation`路径动画
