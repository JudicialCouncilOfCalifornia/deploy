from multiprocessing import Pool
import os

def test_feature(feature_idx):
  os.system("lettuce --verbosity 1 -s "+feature_idx)
  print (feature_idx)

pool = Pool()
total_tests = 0
for line in open("tests/features/TestExamples.feature"):
  if line.startswith("  Scenario:"):
    total_tests += 1
    pool.apply_async(test_feature, total_tests)
pool.close()
pool.join()
