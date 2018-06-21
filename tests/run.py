total_tests = 0
for line in open("tests/features/TestExamples.feature"):
  if line.startswith("  Scenario:"):
    total_tests += 1
print (total_tests)
