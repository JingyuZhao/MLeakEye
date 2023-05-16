#
# Be sure to run `pod lib lint MLeakEye.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MLeakEye'
  s.version          = '0.1.1'
  s.summary          = '内存泄漏检测工具'

  s.description      = <<-DESC
Swift版本的内存泄漏检测工具，在LeakEye的基础上继续维护。
                       DESC

  s.homepage         = 'https://github.com/JingyuZhao/MLeakEye'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jory' => '1563686808@qq.com' }
  s.source           = { :git => 'https://github.com/JingyuZhao/MLeakEye.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.swift_version = '5.0'
  s.source_files = 'MLeakEye/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MLeakEye' => ['MLeakEye/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
