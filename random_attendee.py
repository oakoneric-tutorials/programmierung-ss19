import random
print('-----------------------------------------------')
num = int(input('number of attendees: '))
print('the next task is reserved for student no. ' + str(random.randint(1,num)))
print('-----------------------------------------------')