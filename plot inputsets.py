
# -------------path to the excell file with data-------------

data_file =  r"H:\Wyniki\Mossy Fiber dyspersion\Narzędzia obliczeniowe\Simulink models\DG model for pattern separation\output_data.mat"


# -------------DO NOT CHANGE BELOW THIS LINE-------------

# -------------importing modules-------------

import matplotlib.pyplot as plt
from scipy.io import loadmat
import numpy as np
import seaborn as sns

def plot_inputsets_raster(inputsets, no_inputset):
    time_bins=np.linspace(0.01,2.01,2000,endpoint=False)
    histogram = []
    hist = []
    bins = []
    colorCode  = 'black'
    for i in range(5):
        hist, bins = np.histogram(inputsets[no_inputset][i], bins=time_bins)
        histogram.append(hist)
    R = np.corrcoef(histogram)
    R2 = np.tril(R, k=-1)
    R2[R2  == 0] = 'nan'
    Rmean = str(round(np.nanmean(R2),1))
    fig, axes = plt.subplots()
    axes.tick_params(width=2)

    for axis in ['top','bottom','left','right']:
        axes.spines[axis].set_linewidth(2)

    axes.grid(False)
    axes.spines['top'].set_visible(False)
    axes.spines['right'].set_visible(False)
    axes.spines['left'].set_visible(False)

    axes.set(
        xlim=(0, 2), ylim=(0, 6),
        xticks=[0,0.5,1,1.5,2],
        yticks=[0,1,2,3,4,5,6]
    )
    
    axes.set_title('inputset\nR = ' + Rmean, y=1.10, fontsize=24)
    axes.set_xticklabels([0,0.5,1,1.5,2], fontsize=24)
    axes.set_yticklabels(['', 1, 2, 3, 4, 5, ''], fontsize=24)
    axes.tick_params(axis='y', width=0)
    axes.invert_yaxis()

    axes.set_ylabel("# input train", fontsize=24)
    axes.set_xlabel("time [s]", fontsize=24)

    axes.eventplot(
        inputsets[no_inputset],
        orientation="horizontal",
        lineoffsets=[1,2,3,4,5],
        linewidth=1,
        linelengths=0.8,
        color=colorCode
    )

    plt.show()

def plot_inputsets_matrix(inputsets, no_inputset):  
    # this function bins datasets into 1 ms bins and creates correlation matrices
    time_bins=np.linspace(0.01,2.01,2000,endpoint=False)
    histogram = []
    hist = []
    bins = []
    fig, axes = plt.subplots()
    fig.suptitle('', fontsize = 24)
    fig.subplots_adjust(wspace = 0.5)
    #colormap = sns.color_palette("YlOrBr", as_cmap=True)
    #colormap = sns.color_palette("BuPu", as_cmap=True)
    colormap = sns.color_palette("YlOrRd", as_cmap=True)
    colormap = sns.color_palette("Greys", as_cmap=True)
    for i in range(5):
        hist, bins = np.histogram(inputsets[no_inputset][i], bins=time_bins)
        histogram.append(hist)
    R = np.corrcoef(histogram)
    R2 = np.tril(R, k=-1)
    R2[R2  == 0] = 'nan'
    Rmean = str(round(np.nanmean(R2),1))
    sns.heatmap(R, cmap=colormap, vmax=1, vmin=0, center=0.5, square=True, linewidths=0.5, ax=axes, cbar_kws={"shrink": .5})
    axes.set_title('inputset\nR = ' + Rmean, y=1.10, fontsize=24)
    axes.set_ylabel(u"# input train", fontsize=24)
    axes.set_xlabel(u"# input train", fontsize=24)
    axes.set_xticklabels([1,2,3,4,5],fontsize=24)
    axes.set_yticklabels([1,2,3,4,5],fontsize=24)
    axes.tick_params(axis='x', width=0, colors='black', labelcolor ='black')
    axes.tick_params(axis='y', width=0, colors='black', labelcolor ='black', rotation = 0)
    axes.spines['right'].set_visible(False)
    axes.spines['top'].set_visible(False)       
    cbar = axes.collections[0].colorbar
    cbar.ax.tick_params(labelsize=16)
    cbar.set_label('corr. (R)', fontsize=16)  
    axes.tick_params(width=2)
    plt.show()
        
# load your file
data = loadmat(data_file)
# access variables
my_var = data['inputsets']
flat = my_var[0].ravel().tolist()
inputsets = [[],[],[],[],[]] 
for i in range(5):
    inputsets[i] = np.argwhere(np.array(flat[i])>0)
    inputsets[i] = [inputsets[i][inputsets[i][:, 0] == y, 1] for y in range(5)]
    inputsets[i] = [a / 1000 for a in inputsets[i]]
         
for no_inputset in range(5):
    plot_inputsets_raster(inputsets, no_inputset)
    plot_inputsets_matrix(inputsets, no_inputset)