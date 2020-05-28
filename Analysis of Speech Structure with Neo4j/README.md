# Graphing Cycles of Sentence Similarity with neo4j in 2016 Presidential Campaign Speeches 


## Problem Statement:
I will use Neo4j to graph texts with sentence nodes connected by both temporal order and Bag-of-Words cosine similarity edges to draw insight on their structure. I will specifically compare recent campaign speeches from Hillary Clinton and Donald Trump.  My hypothesis is that I will find relatively more short, higher similarity cycles in Donald Trump speeches and long, lower similarity cycles in Hillary Clinton speeches.  This should correspond with the more repetitive and unscripted feel of Mr. Trump speeches and the more structured and focused feel of Ms. Clinton’s. 

## Technology:
Neo4j is a graph database optimized for connected data. It can traverse paths of connectedness much faster than RDBMSs and scales with little impact on performance. Natural language is one form of data that is usefully modeled with many connecting nodes. I will use Python with py2neo to split text into sentences and write to Neo4j where it can be analyzed and visualized.  Specifically, I’m interested in modelling cycles between sentences of similar meaning.

## Overview of steps:
* Install and configure Neo4j, Anaconda and Python packages
* Retrieve and prepare data by tokenizing into sentences and vectorizing those sentences 
* Write sentences to neo4j database and create temporal and cosine similarity connections between them. 
* Collect metrics on data in neo4j
* Visualize parts of the speech graph

## Data
Clinton Trump Corpus: http://www.thegrammarlab.com/?nor-portfolio=corpus-of-presidential-speeches-cops-and-a-clintontrump-corpus
The dataset consists of plain text documents of speeches delivered at campaign events by Hillary Clinton and Donald Trump. After unzipping, there are 37 Hillary Clinton speeches totaling 737 KB and 83 Donald Trump Speeches totaling 2.6 MB. 


## Hardware:
2014 MacBook Air running OS X

## Software:
* Neo4j 3.0.5 (neo4j.com/download/)
* Anaconda 4.3.30 (www.anaconda.com/download/)
    * Contains Python 3.6.3 and Jupyter Notebook 5.2.2
* Python Packages: 
    * Scikit-learn (scikit-learn.org/) 
    * NLTK (www.nltk.org/)
    * Py2Neo (py2neo.org/v3/)
    * Numpy (www.numpy.org/)
    * Pandas (pandas.pydata.org/)
    * Scipy (www.scipy.org/)
    * Matplotlib (https://matplotlib.org/) 

## Lessons Learned:
* Donald Trump speeches contain many more similar sentences than Hillary Clinton’s
* This method is great at measuring repetition but not yet effective in finding themes or other structural patterns
* Multiple similar sentences, especially said in close proximity (ie “thank you”) add lots of noise to results

## Video Presentations:
Short: https://youtu.be/ZhZqxxkMmu0
Long: https://youtu.be/8xwWGrvepig
