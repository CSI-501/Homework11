import matplotlib.pyplot as plt
import glob
import random

random.seed(1)

def gen_random_hex_color():
    hex_digits = '0123456789ABCDEF'

    return '#' + ''.join(
        random.choices(hex_digits, k=6)
    )

#############################
### Display Runge Results ### 
#############################
files = glob.glob('rungeresults/*.txt')

plt.style.use('seaborn-v0_8-whitegrid')
plt.figure(figsize=(15,10))

# Read through all our files
for file in files:
    fileread = open(file, 'r')
    lines = fileread.readlines()

    x = []
    y = []
    for line in lines:
        row = line.strip().split()
        x.append(float(row[0]))
        y.append(float(row[1]))

    # Plot the data for that estimation.
    plt.plot(x, y, color=gen_random_hex_color())

plt.title('Plot of Runge Kutta Method')
plt.xlabel('X')
plt.ylabel('Y')
plt.savefig('display_runge')

#############################
### Display Runge Results ### 
#############################

files = glob.glob('backeulerresults/*.txt')

plt.style.use('seaborn-v0_8-whitegrid')
plt.figure(figsize=(15,10))

# Read through all our files
for file in files:
    fileread = open(file, 'r')
    lines = fileread.readlines()

    x = []
    y = []
    for line in lines:
        row = line.strip().split()
        x.append(float(row[0]))
        y.append(float(row[1]))

    # Plot the data for that estimation.
    plt.plot(x, y, color=gen_random_hex_color())

plt.title('Plot of Back Euler Method')
plt.xlabel('X')
plt.ylabel('Y')
plt.savefig('display_backeuler')