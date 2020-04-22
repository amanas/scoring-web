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


tryCatch(
    {            
        print("Authenticating")
        bq_auth()
        print("Querying")
        projectid <- args[1]
        table <- args[2]
        sql <- paste("select * from", table)
        df <- query_exec(sql, projectid, use_legacy_sql = FALSE)
        print("Showing result")
        df
    },
    error=function(cond) {
        message("Error:")
        message(cond)
        return(NA)
    },
    warning=function(cond) {
        message("Warning:")
        message(cond)
        return(NULL)
    },
    finally={
        message("OK")
    }
)  

