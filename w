import csv
import pandas as pd

a = []
d = pd.read_csv("enjoysport.csv")
print(d)

with open("enjoysport.csv", "r") as csvfile:
    for row in csv.reader(csvfile):
        a.append(row)

print("\nThe total number of training instances is:", len(a))

num_attribute = len(a[0]) - 1
print("\nThe initial hypothesis is:")
hypothesis = ["0"] * num_attribute
print(hypothesis)

for i in range(len(a)):
    if a[i][num_attribute] == "yes":
        for j in range(num_attribute):
            if hypothesis[j] == "0" or hypothesis[j] == a[i][j]:
                hypothesis[j] = a[i][j]
            else:
                hypothesis[j] = "?"

print("\nThe maximally specific hypothesis for the training instance is:")
print(hypothesis)
