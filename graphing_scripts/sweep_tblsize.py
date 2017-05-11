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
tbsz128 = go.Bar(
    x=benchmarks,
    y=[-2.677721541, -2.381031787, -0.00805120566, 2.74695781, 5.195037293],
    name='128'
)

tbsz256 = go.Bar(
    x=benchmarks,
    y=[-2.544218332, -1.260147914, -0.002337446807, 2.934464083, 4.869752935],
    name='256'
)

tbsz512 = go.Bar(
    x=benchmarks,
    y=[-2.445726312, -0.97905507, -0.004674893614, 2.515922897, 4.757422294] ,
    name='512'
)

tbsz1024 = go.Bar(
    x=benchmarks,
    y=[-2.396958419, -0.988351817, -0.00350617021, 2.884267782, 5.094100445],
    name='1024'
)

tbsz2048 = go.Bar(
    x=benchmarks,
    y=[-2.38835232, -0.7774773231, -0.04337262408, 2.691138343, 5.0852975],
    name='2048'
)

data_tbsz = [tbsz128, tbsz256, tbsz512, tbsz1024, tbsz2048]
layout = go.Layout(
    barmode='group',
    title = 'LLC Miss Rate Improvement vs. Number Entries in each Feature Table',
    yaxis = dict(
	        title='Improvement in LLC Miss Rate over\n Standard LRU Insertion Policy (%)',
	        titlefont=dict(
	            family='Arial',
	            size=16,
	            color='#7f7f7f'
	        )
))

fig = go.Figure(data=data_tbsz, layout=layout)
py.plot(fig, filename='sweep_tblsize')