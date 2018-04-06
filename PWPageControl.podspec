Pod::Spec.new do |s|
  s.name         = "PWPageControl"
  s.version      = "0.0.1"
  s.summary      = "A short description of PWPageControl."
  s.description  = <<-DESC
                    use Masonry create PageControl 
                   DESC

  s.homepage     = "https://github.com/ioswangpengwei/PWPageControl"
  s.license      = "MIT (example)"
  s.author             = { "PW" => "ioswangpengwei@163.com" }
  s.platform     = :ios
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/ioswangpengwei/PWPageControl.git", :tag => s.version.to_s }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"
  s.public_header_files = "Classes/**/*.h"
  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "Masonry", "~> 1.1.0"

end
