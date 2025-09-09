import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

temperaturas = np.random.randint(20, 36, size=7)

dias_da_semana = ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado']

df = pd.DataFrame(list(zip(dias_da_semana, temperaturas)), columns=['Dia', 'Temperatura (°C)'])

print("\n📊 Tabela de temperaturas da semana:")
print(df)

print(f" Temperatura média: {df['Temperatura (°C)'].mean():.2f}°C")
print(f" Temperatura máxima: {df['Temperatura (°C)'].max()}°C")
print(f" Temperatura mínima: {df['Temperatura (°C)'].min()}°C")


plt.figure(figsize=(8, 5))
plt.bar(df['Dia'], df['Temperatura (°C)'], color='orange', edgecolor='black')
plt.title('Temperaturas da Semana', fontsize=14)
plt.xlabel('Dia da Semana')
plt.ylabel('Temperatura (°C)')
plt.xticks(rotation=45)
plt.show()
