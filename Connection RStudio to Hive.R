install.packages("RJDBC")
library(RJDBC)

# 
# drv <- JDBC(driverClass = "org.apache.hive.jdbc.HiveDriver",
#             classPath = "/usr/lib/hive/lib/hive-jdbc.jar",
#             identifier.quote="`")
# conn <- dbConnect(drv, "jdbc:hive2://:10000/gzb", "goldfish", "goldfish2508")

# 
# conn <- dbConnect(drv,
#                   "jdbc:hive2://54.171.159.29:10000/gzb;auth=noSasl",
#                   "goldfish",
#                   "goldfish2508")

options( java.parameters = "-Xmx8g" )
library(rJava)
library(RJDBC)
library(DBI)

cp = c("/opt/cloudera/parcels/CDH/lib/hive/lib/hive-jdbc.jar", 
       "/opt/cloudera/parcels/CDH/lib/hadoop/hadoop-common.jar",
       "/opt/cloudera/parcels/CDH/lib/hive/lib/hive-jdbc.jar",
       "/opt/cloudera/parcels/CDH/lib/hive/lib/libthrift-0.9.3.jar",
       "/opt/cloudera/parcels/CDH/lib/hive/lib/hive-service.jar",
       "/opt/cloudera/parcels/CDH/lib/hive/lib/httpclient-4.2.5.jar",
       "/opt/cloudera/parcels/CDH/lib/hive/lib/httpcore-4.2.5.jar",
       "/opt/cloudera/parcels/CDH/lib/hive/lib/hive-jdbc-standalone.jar")
.jinit(classpath=cp) 

drv <- JDBC("org.apache.hive.jdbc.HiveDriver", "/opt/cloudera/parcels/CDH/lib/hive/lib/hive-jdbc.jar",identifier.quote="`")

conn <- dbConnect(drv, "jdbc:hive2://ip-172-31-35-144.eu-west-1.compute.internal:10000/gzb", "goldfish", "goldfish2508")

show_databases <- dbGetQuery(conn, "show databases")

show_databases
