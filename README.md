# md-date-pre-commit

This is used like this:

```yaml
repos:
  - repo: https://github.com/juliangp/md-date-pre-commit.git
    rev: v1.0.0
    hooks:
      - id: check-last-updated
        stages: [ commit ]
        args: [ "machine-learning.md|machine-learning-cp.md" ]
```
