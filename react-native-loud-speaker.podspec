require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name           = package['name']
  s.version        = package['version']
  s.summary        = package['description']
  s.description    = package['description']
  s.license        = package['license']
  s.author         = package['author']
  s.homepage       = package['homepage']
  s.source         = { :git => "https://github.com/kobyleha/react-native-loud-speaker.git", :branch => "feature-pods" }
  s.source_files   = "ios/**/*.{h,m}"

  s.ios.deployment_target = "8.0"

  s.dependency "React"
end