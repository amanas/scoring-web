print("Ejecutando modelo")


tryCatch(
    {
        print("Parámetros")
        args<-commandArgs(trailingOnly = TRUE)
        print(args)
        print("Library")
        library(bigrquery)
        print("Authenticating")
        bq_auth(scopes = "https://www.googleapis.com/auth/bigquery")
        print("Querying")
        project_id <- args[1]
        dataset_table <- args[2]
        sql <- paste("select * from", dataset_table)
        df <- query_exec(sql, project_id, use_legacy_sql = FALSE)
        print("Result")
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
