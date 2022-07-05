from tasks import add
import random
for i in range(0,10):
    n1= random.randint(0,22)
    n = random.randint(0,22)
    result = add.delay(n1,n)
    print(result)