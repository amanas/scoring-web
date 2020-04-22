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

tryCatch(
    {            
        print("Loading the library")
        library(bigrquery)
        print("Authenticating")
        bq_auth(scopes = "https://www.googleapis.com/auth/bigquery")
        print("Querying")
        projectid <- args[1]
        table <- args[2]
        sql <- paste("select * from", table)
        df <- query_exec(sql, projectid, use_legacy_sql = FALSE)
        print("Showing result")
        df
    },
    error=function(cond) {
        print("Error:")
        message(cond)
        return(NA)
    },
    warning=function(cond) {
        print("Warning:")
        message(cond)
        return(NULL)
    },
    finally={
        print("Done!")
    }
)  

