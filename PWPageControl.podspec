Pod::Spec.new do |s|
  s.name         = "PWPageControl"
  s.version      = "0.0.1"
  s.summary      = "PWPageControl. instand UIPageControl"
  s.description  = <<-DESC
                   use Masonry create PageControl 
                   DESC

  s.homepage     = "https://github.com/ioswangpengwei/PWPageControl"
  s.license      = "MIT"
  s.author             = { "PW" => "ioswangpengwei@163.com" }
  s.platform     = :ios
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/ioswangpengwei/PWPageControl.git", :tag => s.version.to_s }
  s.source_files  = "PWPageControl/PWPageControl/PWPageControl/*.{h,m}"
  s.exclude_files = "PWPageControl/PWPageControl/Masonry"
  s.dependency "Masonry", "~> 1.1.0"

end
