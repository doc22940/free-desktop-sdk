from collections import OrderedDict
from buildstream import Element, ElementError, Scope


def cleanup_provenance(data):
    """
    Remove buildstream provenance data from the output data
    """
    if isinstance(data, dict):
        ret = OrderedDict()
        for k, v in data.items():
            if k != '__bst_provenance_info':
                ret[k] = cleanup_provenance(v)
        return ret
    elif isinstance(data, list):
        return [cleanup_provenance(v) for v in data]
    else:
        return data


class SplitElement(Element):

    def configure(self, node):
        self.node_validate(node, [
            'prefix'
        ])

        self.prefix = self.node_get_member(node, str, 'prefix', None)

    def preflight(self):
        pass

    def get_unique_key(self):
        key = {
            'prefix': self.prefix,
        }
        return key

    def configure_sandbox(self, sandbox):
        pass

    def stage(self, sandbox):
        pass

    def assemble(self, sandbox):
        exported_rules = {}
        def export_rules(name, rules):
            if name not in exported_rules:
                exported_rules[name] = []
            exported_rules[name].extend(rules)

        for dep in self.dependencies(Scope.BUILD, recurse=False):
            bstdata = dep.get_public_data('bst')
            includes = []
            excludes = []
            split_rules = bstdata.get('split-rules', {})
            split_rules = cleanup_provenance(split_rules)
            if self.prefix is None:
                orphans = True
                for rule, patterns in split_rules.items():
                    if '-' in rule:
                        excludes.append(rule)
                    else:
                        export_rules(rule, patterns)
            else:
                orphans = False
                for rule, patterns in split_rules.items():
                    if rule.startswith(self.prefix + '-'):
                        includes.append(rule)
                        exported_rule = rule[len(self.prefix)+1:]
                        if exported_rule:
                            export_rules(exported_rule, patterns)

            dep.stage_artifact(sandbox, exclude=excludes, include=includes, orphans=self.prefix is None)

        bstdata = self.get_public_data('bst')
        if 'split_rules' not in bstdata:
            bstdata['split_rules'] = exported_rules
        else:
            bstdata['split_rules'].update(exported_rules)

        self.set_public_data('bst', bstdata)

        return ""


def setup():
    return SplitElement
