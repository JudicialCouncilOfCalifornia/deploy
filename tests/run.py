from __future__ import print_function
from multiprocessing import Pool
import os
import sys

def retry_feature(feature_idx):
  print("Trying: "+ str(feature_idx))
  os.system("lettuce --verbosity 1 -s " + str(feature_idx) + " tests/features/TestExamples.feature")

def test_feature(feature_idx):
  for x in range(3):
    try:
      retry_feature(feature_idx)
    except:
      print(sys.exc_info()[0])
      print("Failed: "+ str(feature_idx))
    else:
      print("Success: "+ str(feature_idx))
      return

print("<<START>>")
pool = Pool()
pool.map(test_feature, range(int(sys.argv[-2]), int(sys.argv[-1])))
pool.close()
pool.join()
print("<<END>>")
