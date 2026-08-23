# Tests

Organize automated tests so that contributors can tell:

- What behavior is being verified
- Which requirement or defect the test protects
- Which test layer it belongs to
- What dependencies or test data it needs
- How to run it locally and in automated validation

Follow `docs/TEST_STRATEGY.md`. Prefer deterministic tests and meaningful assertions. Do not make a failing test pass by weakening the expected behavior unless the requirement itself has been deliberately changed.
