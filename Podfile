
platform:ios,’9.0’
target ‘LLTankWar’ do
    pod 'LLTankWar', :path => '.'
    pod 'LLRoute', '~> 1.0.0'
    pod 'FDFullscreenPopGesture', '~> 1.1'
    pod 'YYKit'
end

post_install do |installer|
    copy_pods_resources_path = "Pods/Target Support Files/Pods-LLTankWar/Pods-LLTankWar-resources.sh"
    string_to_replace = '--compile "${BUILT_PRODUCTS_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"'
    assets_compile_with_app_icon_arguments = '--compile "${BUILT_PRODUCTS_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}" --app-icon "${ASSETCATALOG_COMPILER_APPICON_NAME}" --output-partial-info-plist "${BUILD_DIR}/assetcatalog_generated_info.plist"'
    text = File.read(copy_pods_resources_path)
    new_contents = text.gsub(string_to_replace, assets_compile_with_app_icon_arguments)
    File.open(copy_pods_resources_path, "w") {|file| file.puts new_contents }
end
