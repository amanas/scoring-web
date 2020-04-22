print("Ejecutando modelo")
print("Ejecutando modelo")
print("Ejecutando modelo")
print("Ejecutando modelo")
print("Ejecutando modelo")
print("Ejecutando modelo")
print("Ejecutando modelo")

print("Parámetros")
args<-commandArgs(trailingOnly = TRUE)
print(args)

print("Loading the library")
library(bigrquery)

print("Authenticating")
bq_auth()

print("Querying")
projectid <- args[1]
table <- args[2]
sql <- paste("select * from", table)
df <- query_exec(sql, projectid, use_legacy_sql = FALSE)

print("Showing result")
df
