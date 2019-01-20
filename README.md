# Data Preprocessing Python

## matplotlib --> for plotting graphs

###### Important Things to remember in matplotlib

Import the package: import matplotlib.pyplot as plt

###### Function:

###### Pyplot: 
       It is a module that provide interface for interactive plots

It can be extended to numpy

import numpy as np

Example:

     x = np.arange(0,5,0.1)
     y = np.sin(x)
     plt.plot(x,y)

The above gives the sin curve in the x-axis range 0 to 5

Lets say u want to plot

#### PieChart

Example 

      ax1.pie(sizes, explode=explode, labels=np.unique(datasetname["column name"]),autopct='%1.1f%%',shadow=True, startangle=90)

you have to define each of ax1,explode here ax1 is *subplots()* function in matplotlib's plotly 
