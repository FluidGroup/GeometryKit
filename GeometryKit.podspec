Pod::Spec.new do |spec|
  spec.name = "GeometryKit"
  spec.version = "1.0.0"
  spec.summary = "A set of geometry"
  spec.description = <<-DESC
  A tool to calculate geometry.
                   DESC

  spec.homepage = "https://github.com/muukii/GeometryKit"
  spec.license = "MIT"
  spec.author = { "Muukii" => "muukii.app@gmail.com" }
  spec.social_media_url = "https://twitter.com/muukii_app"

  spec.ios.deployment_target = "12.0"

  spec.source = { :git => "https://github.com/muukii/GeometryKit.git", :tag => "#{spec.version}" }
  spec.source_files = "GeometryKit/**/*.swift"  
  spec.framework = "UIKit"
  spec.requires_arc = true
  spec.swift_versions = ["5.3", "5.4", "5.5"]
end

