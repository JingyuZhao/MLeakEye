# MLeakEye

[![CI Status](https://img.shields.io/travis/JingyuZhao/MLeakEye.svg?style=flat)](https://travis-ci.org/JingyuZhao/MLeakEye)
[![Version](https://img.shields.io/cocoapods/v/MLeakEye.svg?style=flat)](https://cocoapods.org/pods/MLeakEye)
[![License](https://img.shields.io/cocoapods/l/MLeakEye.svg?style=flat)](https://cocoapods.org/pods/MLeakEye)
[![Platform](https://img.shields.io/cocoapods/p/MLeakEye.svg?style=flat)](https://cocoapods.org/pods/MLeakEye)

## 需要

最低支持iOS10

## 安装

通过cocoapods可以直接安装

```ruby
pod 'MLeakEye', :configurations => ['Debug']
```

## 如何使用
第一步：导入框架

```swift
#if DEBUG
import MLeakEye
#endif
```

第二步：开启监听器

```swift
#if DEBUG
MLeakEye.shared.open()
#endif
```

发现有可疑对象泄漏后，会自动有Alert弹窗。

## 感谢
本仓库是修改了[LeakEyeLib](https://github.com/WeMadeCode/LeakEyeLib)的代码，因为和我们的项目库存在冲突，修改了部分代码，感谢

## 原理

LeakEyeLib基于这样一个假设：
> 如果Controller被释放了，但其曾经持有过的子对象如果还存在，那么这些子对象就是泄漏的可疑目标。

那么怎么在Controller被释放之后，知道其持有的对象没有被释放呢:
**子对象（比如view）建立一个对controller的weak引用，如果Controller被释放，这个weak引用也随之置为nil。那怎么知道子对象没有被释放呢？用一个实例对象每个一小段时间（0.5秒）发出一个ping通知去ping这个子对象，如果子对象还活着就会一个ping通知。所以结论就是：如果子对象的controller已不存在，但还能响应这个ping通知，那么这个对象就是可疑的泄漏对象。**


## 许可证
MIT
