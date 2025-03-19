import pandas as pd

df = pd.read_csv("enjoysport.csv")
concepts = df.values[:, :-1]
target = df.values[:, -1]

def learn(concepts, target):
    specific_h = concepts[0].copy()
    general_h = [["?" for _ in range(len(specific_h))] for _ in range(len(specific_h))]

    for i, h in enumerate(concepts):
        if target[i] == "yes":
            for x in range(len(specific_h)):
                if h[x] != specific_h[x]:
                    specific_h[x] = "?"
                    general_h[x][x] = "?"
        elif target[i] == "no":
            for x in range(len(specific_h)):
                if h[x] != specific_h[x]:
                    general_h[x][x] = specific_h[x]
                else:
                    general_h[x][x] = "?"

    indices = [i for i, val in enumerate(general_h) if val == ["?"] * len(specific_h)]
    for i in indices:
        general_h.remove(["?"] * len(specific_h))

    return specific_h, general_h

s_final, g_final = learn(concepts, target)
print(f"Final S: {s_final}")
print(f"Final G: {g_final}")
