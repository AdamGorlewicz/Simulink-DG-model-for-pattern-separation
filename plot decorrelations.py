# -------------path to the excell file with data-------------

data_file =  r"H:\Wyniki\Mossy Fiber dyspersion\Narzędzia obliczeniowe\Simulink models\DG model for pattern separation\output_data.mat"

# -------------output folder-------------

output_folder = r"H:\Wyniki\Mossy Fiber dyspersion\Narzędzia obliczeniowe\Simulink models\DG model for pattern separation"


# -------------DO NOT CHANGE BELOW THIS LINE-------------

# -------------importing modules-------------

import pandas as pd
import matplotlib.pyplot as plt
import math
from scipy.io import loadmat
import numpy as np


# load your file
data = loadmat(data_file)
# access variables
my_var = data['output_correlation_coefficients']
flat = my_var.ravel()
arr_2d = np.vstack(flat)
naive_control_data = pd.DataFrame(arr_2d).T

# data construction
x = [0.2, 0.4, 0.6, 0.8, 1]
naive_control_data_decorrelation = (x-naive_control_data)/x
naive_control_data_count = len(naive_control_data_decorrelation)
naive_control_data_mean = naive_control_data_decorrelation.mean(axis = 0, numeric_only = True)
naive_control_data_std = naive_control_data_decorrelation.std()
naive_control_data_sem = naive_control_data_std/math.sqrt(naive_control_data_count)

# data plotting
#clr = '#4682B4'
#clr = '#993404'
#clr = 'grey'
clr = 'black'
fig, ax = plt.subplots()
fig.subplots_adjust(hspace =0.15)

plt.plot(x,naive_control_data_mean, clr)
plt.fill_between(x, naive_control_data_mean - naive_control_data_std, naive_control_data_mean + naive_control_data_std, color=clr, alpha=0.2, label='mean')
ax.plot(x, naive_control_data_mean, 'o', color=clr, markersize=5, zorder = 1, clip_on = False)
ax.plot(x, naive_control_data_decorrelation.T, 'o', color='grey', markersize=5, zorder = 0, clip_on = False)


# setting ticks and labels
ax.tick_params(width=2)
ax.set_xlim((0, 1))
ax.set_xticks([0, 0.2, 0.4, 0.6, 0.8, 1])
ax.set_xticklabels([0, 0.2, 0.4, 0.6, 0.8, 1], fontsize=24)
ax.set_ylim((0, 1))
ax.set_yticks([0, 0.2, 0.4, 0.6, 0.8, 1])
ax.set_yticklabels([0, 20, 40, 60, 80, 100], fontsize=24)
for axis in ['top','bottom','left','right']:
    ax.spines[axis].set_linewidth(2)
    
# hide the right and top spines
ax.spines['right'].set_visible(False)
ax.spines['top'].set_visible(False)

# set titles
ax.set_xlabel('input correlation', fontsize=24)
ax.set_ylabel('decorrelation (%)', fontsize=24)
plt.title('pattern separaration', y=1.10, fontsize=24)

