import 'dart:io';
import 'dart:convert';

parseRule(String xgbFile, String fileCode, List<String> clazz) {
  List models = json.decode(File(xgbFile).readAsStringSync());
  var nodes = <String, dynamic>{};
  var ruleId = 1;
  var parameters = <String, String>{};
  var ids = [];
  traverse(m, int c, String parentId) {
    String code;
    if (m['leaf'] != null) {
      var id = 'R${ruleId.toString().padLeft(2, '0')}_${clazz[c]}';
      ids.add(id);
      var ret = {
        'class': clazz[c],
        'confident': m['leaf'],
        'rule_id': id,
      };
      code = 'return ${json.encode(ret)};';
      ruleId++;
    } else {
      code = "${m['split']}<${m['split_condition']}";
      parameters[m['split'].toString()] =
          m['split_condition'].runtimeType.toString();
    }
    parentId = '${parentId}>${m['nodeid']}';
    if (parentId.startsWith('>')) {
      parentId = parentId.substring(1);
    }
    nodes[m['nodeid'].toString()] = {
      'id': m['nodeid'],
      'split': m['split'],
      'condition': m['split_condition'],
      'yes': m['yes'],
      'no': m['no'],
      'leaf': m['leaf'],
      'class': m['leaf'] != null ? clazz[c] : null,
      'code': code,
      'flow': parentId
    };
    if (m['children'] != null) {
      for (var i = 0; i < m['children'].length; i++) {
        traverse(m['children'][i], i, parentId);
      }
    }
  }

  traverse(models[0], 0, '');
  // print(json.encode(nodes));
  var leafs = nodes.values.where((it) => it['leaf'] != null).toList();
  var space = '  ';
  var lines = [];
  var ruleIds = ids.toSet().toList();
  var funParams = [];
  for (var i = 0; i < parameters.keys.length; i++) {
    funParams
        .add('${parameters.values.toList()[i]} ${parameters.keys.toList()[i]}');
  }
  lines
      .add('/// Get decision of given parameters ${parameters.keys.join(',')}');
  parameters.keys.forEach((it) {
    lines.add('/// [$it] parameter of $it should be [${parameters[it]}] value');
  });
  lines.add('/// Returns one of $ruleIds');
  lines.add('Map getDecision(${funParams.join(', ')}){');
  var hasCondition = false;
  for (var l in leafs) {
    var flows = l['flow'].toString().split('>');
    var ret = nodes[flows.last]['code'];
    flows.removeLast();
    var conditions = flows.map((it) => nodes[it]['code']).join(' && ');
    var ifCode = !hasCondition ? 'if ' : 'else if';
    lines.add('$ifCode($conditions) {\n$space$space$space$ret\n$space}');
    hasCondition = true;
  }
  lines.add('$space return {};');
  lines.add('}');
  print(lines.join('\n'));
  File(fileCode).writeAsStringSync(lines.join('\n'));
}

main(List<String> args) {
  parseRule('xgb.json', 'trading_rules.dart', ['CALL', 'PUT']);
}
