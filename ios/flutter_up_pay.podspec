#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_up_pay.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_up_pay'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter project.'
  s.description      = <<-DESC
A new Flutter project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  
  s.source_files = 'Classes/**/*','**/Framework/*.h'
  s.ios.vendored_frameworks = '**/Framework/*.framework'
  s.ios.vendored_libraries = '**/Framework/*.a'
  
  s.preserve_paths = '**/Framework/*.h'
  
  s.frameworks = 'CFNetwork', 'SystemConfiguration'
  s.libraries = 'z', 'c++'
  
  s.dependency 'Flutter'
  s.platform = :ios, '11.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386 arm64',
  }

end
