
# -------------path to the excell file with data-------------

data_file =  r"H:\Wyniki\Mossy Fiber dyspersion\Narzędzia obliczeniowe\Simulink models\DG model for pattern separation\output_data.mat"
no_cell = 13

# -------------DO NOT CHANGE BELOW THIS LINE-------------

# -------------importing modules-------------

import matplotlib.pyplot as plt
from scipy.io import loadmat
import numpy as np
import seaborn as sns
from matplotlib import colors, colormaps 

def blues_to_browns(n=256):
# this function creates brown colormap
    color_list = [(0.0, "#ffffff"),(0.1, "#f3e2c0"),(0.4, "#c08b52"),(1.0, "#4b2e05")]    
    brown_gradient = colors.LinearSegmentedColormap.from_list("BrownBlues_fast", color_list,N=n)
    return brown_gradient

def plot_datasets_raster(dataset, no_inputset):
    #colormap = np.array(['black', 'black', 'black', 'black', 'black', 
    #'#4682B4', '#4682B4', '#4682B4', '#4682B4', '#4682B4', '#4682B4', '#4682B4', '#4682B4', '#4682B4', '#4682B4', 
    #'#4682B4', '#4682B4', '#4682B4', '#4682B4', '#4682B4', '#4682B4', '#4682B4', '#4682B4', '#4682B4', '#4682B4',
    #'#4682B4', '#4682B4', '#4682B4', '#4682B4', '#4682B4', '#4682B4', '#4682B4', '#4682B4', '#4682B4', '#4682B4', 
    #'#4682B4', '#4682B4', '#4682B4', '#4682B4', '#4682B4', '#4682B4', '#4682B4', '#4682B4', '#4682B4', '#4682B4', 
    #'#4682B4', '#4682B4', '#4682B4', '#4682B4', '#4682B4', '#4682B4', '#4682B4', '#4682B4', '#4682B4', '#4682B4'])   
    
    colormap  = np.array(['black', 'black', 'black', 'black', 'black',
   '#993404', '#993404', '#993404', '#993404', '#993404', '#993404', '#993404', '#993404', '#993404', '#993404',                        
   '#993404', '#993404', '#993404', '#993404', '#993404', '#993404', '#993404', '#993404', '#993404', '#993404',
   '#993404', '#993404', '#993404', '#993404', '#993404', '#993404', '#993404', '#993404', '#993404', '#993404',
   '#993404', '#993404', '#993404', '#993404', '#993404', '#993404', '#993404', '#993404', '#993404', '#993404',
   '#993404', '#993404', '#993404', '#993404', '#993404', '#993404', '#993404', '#993404', '#993404', '#993404'])
    
    
    time_bins=np.linspace(0.01,2.01,2000,endpoint=False)
    histogram = []
    hist = []
    bins = []
    for i in range(55):
        hist, bins = np.histogram(dataset[no_inputset][i], bins=time_bins)
        histogram.append(hist)
    R = np.corrcoef(histogram)
    R2 = np.tril(R, k=-1)
    R2[R2  == 0] = 'nan'
    Rmean = str(round(np.nanmean(R2),4))
    fig, axes = plt.subplots()  
    axes.tick_params(width=2)
    for axis in ['top','bottom','left','right']:
        axes.spines[axis].set_linewidth(2)
    axes.grid(False)
    axes.spines['top'].set_visible(False)
    axes.spines['right'].set_visible(False)
    axes.spines['left'].set_visible(False)
    axes.set(xlim=(0, 2), ylim=(-1, 55), xticks=[0,0.5,1,1.5,2], yticks=[2,10,20,30,40,50])
    axes.set_xticklabels([0,0.5,1,1.5,2], fontsize=24)
    axes.set_yticklabels(['input', '1', '2', '3', '4', '5'], fontsize=24)
    axes.tick_params(axis='y', colors='black', labelcolor ='black', width=0)
    axes.set_title('output dataset\nR = ' + Rmean, y=1.10, fontsize=24)
    axes.set_ylabel(u"output subsets    ", fontsize=24)
    axes.set_xlabel(u"time [s]", fontsize=24)
    axes.eventplot(dataset[no_inputset], orientation="horizontal", linewidth=2, linelengths = 0.8, color=colormap)
    axes.invert_yaxis()
    axes.axhspan(4,15, facecolor='#993404', alpha=0.2)
    axes.axhspan(24, 35, facecolor='#993404', alpha=0.2)
    axes.axhspan(44, 55, facecolor='#993404', alpha=0.2)
    #axes.axhspan(4,15, facecolor='#4682B4', alpha=0.2)
    #axes.axhspan(24, 35, facecolor='#4682B4', alpha=0.2)
    #axes.axhspan(44, 55, facecolor='#4682B4', alpha=0.2)
    plt.show()

def plot_datasets_matrix(dataset, no_inputset):  
    # this function bins datasets into 1 ms bins and creates correlation matrices
    time_bins=np.linspace(0.01,2.01,2000,endpoint=False)
    histogram = []
    hist = []
    bins = []
    fig, axes = plt.subplots()
    fig.suptitle('', fontsize = 24)
    fig.subplots_adjust(wspace = 0.5)
    #colormap = sns.color_palette("Blues", as_cmap=True)
    browns_cmap = blues_to_browns()
    colormap = browns_cmap
    for i in range(55):
        hist, bins = np.histogram(dataset[no_inputset][i], bins=time_bins)
        histogram.append(hist)
    R = np.corrcoef(histogram)
    R2 = np.tril(R, k=-1)
    R2[R2  == 0] = 'nan'
    Rmean = str(round(np.nanmean(R2),4))
    sns.heatmap(R, cmap=colormap, vmax=1, vmin=0, center=0.5, square=True, linewidths=0, ax=axes, cbar_kws={"shrink": .5})
    axes.tick_params(axis='x', width=0, colors='black', labelcolor ='black', rotation = 0)
    axes.tick_params(axis='y', width=0, colors='black', labelcolor ='black', rotation = 0)
    axes.set(xticks=[2,10,20,30,40,50], yticks=[2,10,20,30,40,50])
    axes.set_xticklabels(['input', '1', '2', '3', '4', '5'], fontsize=24)
    axes.set_yticklabels(['input', '1', '2', '3', '4', '5'], fontsize=24)
    axes.tick_params(width=0)
    axes.tick_params(axis='x', colors='black', labelcolor ='black')
    axes.spines['right'].set_visible(False)
    axes.spines['top'].set_visible(False)
    axes.set_title('output dataset\nRmean = ' + Rmean, y=1.10, fontsize=24)
    axes.set_ylabel(u"output subsets   ", fontsize=24)
    axes.set_xlabel(u"output subsets", fontsize=24)
    xtick_labels = axes.get_xticklabels()
    xtick_labels[0].set_rotation(90)
    axes.set_xticklabels(xtick_labels)
    # Access and modify the colorbar
    cbar = axes.collections[0].colorbar
    cbar.ax.tick_params(labelsize=16)         # <-- Font size for tick labels
    cbar.set_label('corr. (R)', fontsize=16)  # <-- Font size for colorbar label  
    plt.show()   
    return Rmean
        
# load your file
data = loadmat(data_file)
# access variables
my_var = data['output_datasets']
flat = [None]*5
dataset = [None]*5
for i in range(5):
    flat[i] = my_var[0,i].ravel().tolist()
    dataset[i] = np.argwhere(np.array(flat[i][no_cell])>0)
    dataset[i] = [dataset[i][dataset[i][:, 0] == y, 1] for y in range(55)]
    dataset[i] = [a / 1000 for a in dataset[i]]    
    
for no_inputset in range(5):         
    plot_datasets_raster(dataset, no_inputset)
    plot_datasets_matrix(dataset, no_inputset)