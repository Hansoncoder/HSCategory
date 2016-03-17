## HSCategory
　　这是我自己的一个分类，使用了CocoaPods管理,集成过程请参考[Damonvvong](https://github.com/Damonvvong/DWCategory).

## Podfile

- 在你项目中使用CocoaPods集成，在 Podfile文件中写入如下内容:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '7.0'

pod 'HSCategory'
```

- 安装过程,不需要更新仓库

```ruby
pod install --verbose --no-repo-update
```