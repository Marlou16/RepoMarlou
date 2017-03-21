## Information on the HADOOP folder ##

This HADOOP folder contains the files created during the Udacity Course: 

				*Introduction to Hadoop and MapReduce*

In this document I collect some learning notes from this course. :)

### ----- Remarks on Big Data ----- ###
/*	Hadoop and MapReduce are mostly used on _Big Data_, data which is too large to process on a single machine.
*	Challenges with Big Data are:
		-> data is created fast
		-> data comes in from different sources, having different formats
	In this sense, one couples big data with the _3 V's_: Volume, Variety, Velocity


### ----- Remarks on HADOOP ----- ###
/*	Shortly: **Hadoop stores data in a distributed way across multiple machines**
*	Officially we have HDFS, the *Hadoop Distributed File System*
*	Hadoop was originally part of an open source project called *Nutch*.
*	The name Hadoop comes from the stuffed elephant Doug Cutting's son played with.
*	Well-known open source products which are built on top of MapReduce too make it easier to work with the HDFS are *Pig* and *Hive*, which allow (standard) SQL queries.
		-> i.o.w. the Hive interpreter turns SQL in MapReduce code which then runs on the (HDFS) cluster
*	*Impala* is an (open source) framework which allows queries, which directly works on HDFS
*	Other ones are *HBase*, *Sqoop*, *Flume* and *Mahout*.
*	The Cloudera created *CDH* which installs everything incl. Hadoop, such that individual installs are not necessary.