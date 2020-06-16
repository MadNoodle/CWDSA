
Pod::Spec.new do |spec|

  spec.name         = "CWDSA"
  spec.version      = "0.0.6"
  spec.summary      = "This library allows you to Digitally Sign with DSA."

  spec.description  = "DSA signature tools for ios"

  spec.homepage     = "http://www.cityway.fr"

  spec.license      = "MIT"

  spec.author             = { "Mathieu Janneau" => "mjanneau@cityway.fr" }


  spec.source       = { :git => "https://github.com/MadNoodle/CWDSA.git", :tag => "#{spec.version}" }


  spec.source_files  = "Classes", "Classes/**/*.{h,m}"
  spec.exclude_files = "Classes/Exclude"

   #spec.frameworks = "GRKOpenSSLFramework"

   #spec.dependency "GRKOpenSSLFramework"

end
