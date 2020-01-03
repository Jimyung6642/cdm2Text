note2Text <- function(note, outputFolder, fileEncoding){
  setwd(outputFolder)
  Encoding(note[,"NOTE_TEXT"]) <- fileEncoding
  invisible(lapply(1:nrow(note), function(i) write.table(note[i,"NOTE_TEXT"], 
                                                             file = paste0(note[i,1], ".txt"),
                                                             row.names = FALSE, col.names = FALSE,
                                                             quote = FALSE)))
}