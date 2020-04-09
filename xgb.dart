import 'dart:io';
import 'dart:convert';

parseRule(String xgbFile, String fileCode, List<String> clazz) {
  List models = json.decode(File(xgbFile).readAsStringSync());
  var nodes = <String, dynamic>{};
  var ruleId = 1;
  var parameters = <String, String>{};
  var ids = [];
  traverse(m, int c, String parentId) {
    if (parentId.startsWith('>')) {
      parentId = parentId.substring(1);
    }
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
      var splits = parentId.split('>');
      if (splits.length > 1) {
        var realParentId = splits[splits.length - 2];
        var isYes = nodes[realParentId]['yes'] == m['nodeid'].toString();
        var op = isYes ? '<' : '>=';
        code = "${m['split']}${op}${m['split_condition']}";
      } else {
        code = "${m['split']}<${m['split_condition']}";
      }
      parameters[m['split'].toString()] =
          m['split_condition'].runtimeType.toString();
    }
    parentId = '${parentId}>${m['nodeid']}';
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

  for (var i = 0; i < leafs.length; i++) {
    var l = leafs[i];
    var flows = l['flow'].toString().split('>');
    var currentFlows = flows.join('');
    var ret = nodes[flows.last]['code'];
    flows.removeLast();
    var isNextSameRule = false;
    if (i != leafs.length - 1) {
      var nextFlows = leafs[i + 1]['flow'].toString().split('>').join('');
      isNextSameRule = currentFlows == nextFlows;
    }
    if (ret.contains(clazz.first) && isNextSameRule) flows.removeLast();
    var conditions = flows.map((it) => nodes[it]['code']).toList();
    lines.add('if(${conditions.join('&&')}) {$ret}');
  }

  lines.add(' return null;');
  lines.add('}');
  print(lines.join('\n'));
  File(fileCode).writeAsStringSync(lines.join('\n'));
}

main(List<String> args) {
  parseRule('xgb.json', 'trading_rules.dart', ['CALL', 'PUT']);
}
