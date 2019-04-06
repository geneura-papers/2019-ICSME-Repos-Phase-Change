#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""

@author: booort
"""

# Imports: powerlaw
import matplotlib.pylab as plt
import numpy as np
import powerlaw
import pandas as pd

repo = ('cask', 'mojo', 'tty', 'rakudo','django')
# Open file in a dataframe

for name in repo:
    file_name = 'lines_'+name+'_diffs.csv'
    df = pd.read_csv(file_name)

    # Extract pure data from 2º column and transform it to a numpy array
    raw_commits = df['Lines changed']
    data_final = np.array(raw_commits)
    for n in range(1,5):
        data = data_final[0:int(n*len(data_final)/5)]
        # fit the data in a powerlaw (standard  method)
        fit = powerlaw.Fit(data, discrete=True)
        '''
        # plot the raw pdf and the others fitted distributions pdf
        powerlaw.plot_pdf(data[data >= fit.power_law.xmin], label="Data as PDF")
        fit.power_law.plot_pdf(label="Fitted powerlaw PDF", ls=":")
        fit.lognormal.plot_pdf(label="fitted log normal pdf", ls="--")
        fit.truncated_power_law.plot_pdf(label="fitted truncated powerlaw  pdf", ls=":")
        plt.legend(loc=3, fontsize=14)
        plt.show()
        '''
        # Print data from the fitted process, parameters and estimations
        print('------------------------------')
        print('Summary of ',name,' from 0 to ', int(n*len(data_final)/5))
        print('Estimated value of alpha parameter: ', fit.power_law.alpha)
        print('Estimated first value where powerlaw is exposed: ', fit.power_law.xmin)
        print('Estimated last value where powerlaw is exposed: ', fit.power_law.xmax)
        print('Estimated precision of alpha parameter: +/-', fit.power_law.sigma)
        R, p = fit.distribution_compare('power_law', 'lognormal', normalized_ratio=True)
        print('Comparative between powerlaw and lognormal')
        print(R, p)
        R, p = fit.distribution_compare('power_law', 'exponential', normalized_ratio=True)
        print('Comparative between powerlaw and exponential')
        print(R, p)
        R, p = fit.distribution_compare('power_law', 'truncated_power_law', normalized_ratio=True)
        print('Comparative between powerlaw and truncated power law')
        print(R, p)
        R, p = fit.distribution_compare('truncated_power_law', 'lognormal_positive', normalized_ratio=True)
        print('Comparative between truncated powerlaw and lognormal positive ')
        print(R, p,'\n')
