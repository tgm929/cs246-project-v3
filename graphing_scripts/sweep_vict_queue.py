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
th0 = go.Bar(
    x=benchmarks,
    y=[-3.770675194, -2.573760201, -0.6834434747, -1.645409893, 9.780014593],
    name='0'
)

th1 = go.Bar(
    x=benchmarks,
    y=[-3.598943559, -2.242229117, -0.6921439711, -0.9323813264, 11.09531788],
    name='1'
)

th2 = go.Bar(
    x=benchmarks,
    y=[-3.334641191,
-2.240834116,
-0.6468234747,
1.788826285,
11.57350754] ,
    name='2'
)

th4 = go.Bar(
    x=benchmarks,
    y=[-2.396958419, -0.988351817, -0.00350617021, 2.884267782, 5.094100445],
    name='4'
)

th8 = go.Bar(
    x=benchmarks,
    y=[-2.948330363,
-2.149461504,
-0.6268253187,
2.073268275,
8.607413822],
    name='8'
)

th16 = go.Bar(
    x=benchmarks,
    y=[-1.626234454,
-1.410808099,
-0.003376312054,
2.966518338,
5.560366738],
    name='16'
)

data_tbsz = [th0, th1, th2, th4, th8, th16]
layout = go.Layout(
    barmode='group',
    title = 'LLC Miss Rate Improvement vs. Insertion Decision Threshold Value',
    yaxis = dict(
	        title='Improvement in LLC Miss Rate over <br> Standard LRU Insertion Policy (%)',
	        titlefont=dict(
	            family='Arial',
	            size=16,
	            color='#7f7f7f'
	        )
))

fig = go.Figure(data=data_tbsz, layout=layout)
py.plot(fig, filename='sweep_thresh')