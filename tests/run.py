from __future__ import print_function
from multiprocessing import Pool
import os

def test_feature(feature_idx):
  print("\tRunning: "+ str(feature_idx + 1))
  os.system("lettuce --verbosity 1 -s "+str(feature_idx + 1))

print("<<START>>")
pool = Pool()
feature_idx = 0
for line in open("tests/features/TestExamples.feature"):
  if line.startswith("  Scenario:"):
    feature_idx += 1
    print("\tQueued: "+str(feature_idx))
pool.map(test_feature, range(feature_idx))
pool.close()
pool.join()
print("<<END>>")
