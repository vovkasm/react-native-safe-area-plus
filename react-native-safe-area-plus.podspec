require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = "react-native-safe-area-plus"
  s.version      = package['version']
  s.summary      = package['description']

  s.description  = <<-DESC
SafeArea tracking for React Native done right
                   DESC

  s.homepage     = package['homepage']
  s.license      = package['license']
  s.author       = { "Vladimir Timofeev" => "vovkasm@gmail.com" }

  s.platform     = :ios, '9.0'
  s.source       = { :git => 'https://github.com/vovkasm/react-native-safe-area-plus.git', :tag => "v#{s.version}" }

  s.source_files        = 'ios/Classes/**/*.{h,m}'

  s.framework    = 'UIKit'

  s.dependency 'React'
end
