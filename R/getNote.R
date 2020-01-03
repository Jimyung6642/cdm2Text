getNote <- function(connection, database, noteType, num, removeXMLTaggers = FALSE){
  # dbms <- connection$dbms
  sql <- 'select top @num * from @database.dbo.NOTE where note_type_concept_id in (@noteType)'
  sql <- SqlRender::render(sql = sql, num = num, noteType = noteType, database = database)
  
  note <<- DatabaseConnector::querySql(connection = con, 
                                      sql = sql,
                                      errorReportFile = file.path(getwd(), "errorReport.txt"))
  if(removeXMLTaggers == TRUE){
    note$NOTE_TEXT <<- gsub('<[^<>]*>', ' ', note$NOTE_TEXT)
    note$NOTE_TEXT <<- gsub('&#x0D;', ' ', note$NOTE_TEXT)
    note$NOTE_TEXT <<- gsub('&lt;', ' ', note$NOTE_TEXT)
    note$NOTE_TEXT <<- gsub('&gt;', ' ', note$NOTE_TEXT)
    note$NOTE_TEXT <<- gsub('&amp;', ' ', note$NOTE_TEXT)
    note$NOTE_TEXT <<- gsub('&quot;', ' ', note$NOTE_TEXT)
  }
}