#Dorothy-SSR  
&emsp;&emsp;Dorothy SSR是一个新的2D游戏开发框架，目标是沿用原Dorothy项目的Lua API和游戏编辑器，使用跨平台的bgfx图形接口和SDL2框架重写底层代码，让Dorothy游戏框架更具有发展力。目前仍处于约等于零的初级开发阶段。以下先对一些相关知识做一些介绍。  
* **bgfx**  
&emsp;&emsp;是一个跨平台，对各种图形API做wrapper的一套新的图形API。它的backend底层可以对接各版本的OpenGL，各版本的Direct3D，Metal甚至WebGL等等。使用C++编写统一的图形渲染代码通过使用不同的编译配置来切换底层对接的backend。同时自带sort-based draw call bucketing，简单说就是相同状态的draw call自动合并功能。API自带多线程渲染支持，可以自由地开多线程直接调API各自发送渲染指令。总之投入之前单平台底层图形编码的工作量，并且不用做复杂的设计就能完成多平台的图形开发并自动获得很多性能优化上的支持。  
* **SDL**  
&emsp;&emsp;是一个跨平台，对各操作系统API做wrapper的一套系统API。从创建窗体，处理系统事件，到调用各类输入输出设备，提供出平台无关的统一接口。如果一句CreateWindow就能在Win、Mac、iOS、Android等等平台上创建应用；一句PollEvent就能获得键盘、鼠标、触摸屏、游戏手柄等等的事件消息。那这就是好东西用吧。
* **Dorothy**  
&emsp;&emsp;是一个玩具，一个用来制作玩具的玩具。制作这个玩具的过程让制作人玩得很开心。因为底层技术框架的落后，预计有一天会再也无法兼容或是稳定运行在新的硬件或是系统上，所以不得不打算进行彻底重构。这个重构项目预计大量的老代码的核心逻辑是可以复用的，尤其是Dorothy自身框架以及Lua绑定的部分，用作图形渲染的Cocos2D的底层则是需要进行完全重写的。Dorothy的目标是提供一套完善的2D游戏制作工具，带有全图形化的动画、物理、场景、地形、游戏逻辑、AI、游戏单位等等的全套编辑器，并且可以在各类PC和移动设备上运行，让大家能随时随地不受限制地在各式设备上，使用易用的图形工具，自由制作自己的游戏玩具。并告诉大家，想抽SSR也就是在自己的玩具上调一个数字就能实现的事，充钱是不会强身健体树立精神的。  

-- 2016-12-8  
&emsp;&emsp;目前该项目的Basic分支上传了一个整合bgfx和SDL2带一小段渲染测试代码的基础示例，提供xCode，Android Studio，VS2015工程，并且在Win、OSX、iOS和Android上编译运行测试通过。接下来就要进入SSR项目的开发，各位希望参与这个框架设计和开发可以联系我，QQ：dragon-fly@qq.com，我的博客是：www.luvfight.me ，请说明来意，谢谢啦。真诚欢迎各位的加入。  
-- 2016-12-9  
&emsp;&emsp;开始进行项目准备，对原Dorothy项目的Lua代码部分进行分析，并粗略统计出实际所用的API种类以及代码中的出现次数。并以此作为后期开发排优先级和统计进度的一个参考，预计有228个接口需要重写，251个接口只用做迁移并复用代码。以后会把开发进度也更新在Readme上。

##当前进度  
```
Redo: 63/243 25.93%
```
```
Ship: 43/251 17.13%
```
```
Total: [ ###             ] 21.46%
```
