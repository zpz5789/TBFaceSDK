#
# Be sure to run `pod lib lint TBFaceSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TBFaceSDK'
  s.version          = '0.1.0'
  s.summary          = 'A short description of TBFaceSDK.'

  s.description      = <<-DESC
    百度人脸离线库封装
                       DESC

  s.homepage         = 'https://github.com/zpz5789/TBFaceSDK'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zpz5789' => 'zengpengzhan@tangbull.com' }
  s.source           = { :git => 'https://github.com/zpz5789/TBFaceSDK.git', :tag => s.version }

  s.ios.deployment_target = '9.0'

  s.source_files = 'TBFaceSDK/Classes/**/*'
  s.public_header_files = 'TBFaceSDK/Classes/**/*.h'
  
  s.resources           = ['TBFaceSDK/BDFaceSDK/*.bundle', 'TBFaceSDK/Resource/*.bundle']
  s.vendored_frameworks = 'TBFaceSDK/BDFaceSDK/*.framework'
  s.frameworks = 'CoreTelephony', 'AssetsLibrary', 'UIKit', 'Foundation'
  s.libraries = 'z', 'c++'
  s.pod_target_xcconfig = { 'VALID_ARCHS' => 'armv7 armv7s arm64 arm64e' }
end
