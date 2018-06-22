from __future__ import print_function
from multiprocessing import Pool
import os

def retry_feature(feature_idx):
  print("Trying: "+ str(feature_idx + 1))
  os.system("lettuce --verbosity 1 -s " + str(feature_idx + 1) + " tests/features/TestExamples.feature")

def test_feature(feature_idx):
  for x in range(3):
    try:
      retry_feature(feature_idx)
    except:
      print(sys.exc_info()[0])
      print("Failed: "+ str(feature_idx + 1))
    else:
      print("Success: "+ str(feature_idx + 1))
      return

print("<<START>>")
pool = Pool()
feature_idx = 0
for line in open("tests/features/TestExamples.feature"):
  if line.startswith("  Scenario:"):
    feature_idx += 1
    print("Queued: " + str(feature_idx))
pool.map(test_feature, range(feature_idx))
pool.close()
pool.join()
print("<<END>>")
