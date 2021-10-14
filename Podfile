# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

abstract_target 'IB' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'Alamofire', '~> 5.4'
  pod 'RxSwift', '6.2.0'
  pod 'RxCocoa', '6.2.0'
  pod 'SnapKit', '~> 5.0.0'
  pod 'PKHUD', '~> 5.0'
  
  target 'MyIB'
  target 'MyTarget'

  target 'MyIBTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'MyIBUITests' do
    # Pods for testing
  end

end
