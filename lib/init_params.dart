import 'package:universal_html/html.dart' as html;

void ensureInitParams([Map<String, String> additionalInitParams = const {}]) {
  final href = html.window.location.href;
  final uri = Uri.parse(href);
  _initialParameters
    ..addAll(additionalInitParams)
    ..addAll(uri.queryParameters);
}

final Map<String, String> _initialParameters = {};

Map<String, String> get initParameters => _initialParameters;

bool hasInitParam(String key) => _initialParameters.containsKey(key);

bool allGameInitParamsSet(List<String> keys) {
  for (final key in keys) {
    if (!_initialParameters.containsKey(key)) return false;
  }
  return true;
}

String? getParameterValue(String key) => _initialParameters[key];

bool get hasUserId {
  final String? userId = _initialParameters['user_id'];
  return userId != null && userId.isNotEmpty;
}

List<String> getParameterValueAsList(String key, [String separator = ',']) {
  return _initialParameters[key]?.split(separator) ?? [];
}
