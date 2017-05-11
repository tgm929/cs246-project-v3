# Tim McNamara
# CS246 Final Project
# Graph Results

import numpy
import plotly
import plotly.plotly as py
import plotly.graph_objs as go

plotly.tools.set_credentials_file(username='tgm929', api_key='cQK2zEHXceBIpbYS2BmZ')

benchmarks = ['bzip2', 'graph-analytics', 'libquantum', 'mcf', 'xalancbmk']

# varying table size
ctr2 = go.Bar(
    x=benchmarks,
    y=[-3.228881308,
-1.896268694,
-0.7305819853,
0.2046165839,
12.46309372],
    name='2'
)

ctr4 = go.Bar(
    x=benchmarks,
    y=[-3.151426418,
-1.992523812,
-0.591244184,
2.034875383,
10.59645383],
    name='4'
)

ctr8 = go.Bar(
    x=benchmarks,
    y=[-2.948330363,
-2.149461504,
-0.6268253187,
2.073268275,
8.607413822],
    name='8'
)

ctr16 = go.Bar(
    x=benchmarks,
    y=[-2.897068385,
-2.066458902,
-0.6496803541,
2.348858387,
5.839624477],
    name='16'
)

ctr32 = go.Bar(
    x=benchmarks,
    y=[-2.975479508,
-1.780483552,
-0.6447457442,
2.739041361,
4.395956097],
    name='32'
)

data_tbsz = [ctr2, ctr4, ctr8, ctr16, ctr32]
layout = go.Layout(
    barmode='group',
    title = 'LLC Miss Rate Improvement vs. Maximum Table Counter Value',
    yaxis = dict(
	        title='Improvement in LLC Miss Rate over <br> Standard LRU Insertion Policy (%)',
	        titlefont=dict(
	            family='Arial',
	            size=16,
	            color='#7f7f7f'
	        )
))

fig = go.Figure(data=data_tbsz, layout=layout)
py.plot(fig, filename='sweep_maxctr')