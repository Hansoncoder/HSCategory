Pod::Spec.new do |s|
  s.name         = "HSCategory"
  s.version      = "1.0.0"
  s.platform     = :ios, "7.0"
  s.license      = "MIT"
  s.summary      = "This is a HSCategory.Author is Hanson"

  s.homepage     = "https://github.com/Hansoncoder/HSCategory"
  s.author             = { "Hanson" => "http://weibo.com/3090366734/profile?topnav=1&wvr=6" }
  s.source       = { :git => "https://github.com/Hansoncoder/HSCategory.git", :tag => s.version }
  s.source_files  = "HSCategory/*.{h,m}"
  s.requires_arc = true
end

