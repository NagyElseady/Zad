//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <flutter_localization/flutter_localization_plugin_c_api.h>
#include <share_plus/share_plus_windows_plugin_c_api.h>
#include <url_launcher_windows/url_launcher_windows.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  FlutterLocalizationPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FlutterLocalizationPluginCApi"));
  SharePlusWindowsPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("SharePlusWindowsPluginCApi"));
  UrlLauncherWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("UrlLauncherWindows"));
}
