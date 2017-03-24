# This is a simple R file
# RW Taggart
# 2017.3.16
# CS632v - Midterm

## Convert a character with the proper shift.
mod.char <- function(c, shift) {
  stopifnot((length(c) == 1 && 0 <= abs(shift) && abs(shift) <= 25))
  if (! ((utf8ToInt('A') <= utf8ToInt(c) && utf8ToInt(c) <= utf8ToInt('Z'))
      || (utf8ToInt('a') <= utf8ToInt(c) && utf8ToInt(c) <= utf8ToInt('z'))
     )) {
    return(c)
  }
  if (c == toupper(c)) {
    norm <- utf8ToInt('A')
  }
  else {
    norm <- utf8ToInt('a')
  }

  mc <- intToUtf8(((utf8ToInt(c) - norm + shift) %% 26) + norm)
  return(mc)
}

## Encrypt the plain text into a cypher text.
enc.str <- function(plain) {
  cypher <- c()
  sp <- strsplit(plain, "")
  for (ch in sp[[1]]) {
    cypher <- c(cypher, mod.char(ch, 13))
  }
  cypher <- paste(cypher, collapse="")
  return(cypher)
}

## Decrypt the cypher text into plain text.
dec.str <- function(cypher) {
  plain <- c()
  sp <- strsplit(cypher, "")
  for (ch in sp[[1]]) {
    plain <- c(plain, mod.char(ch, -13))
  }
  plain <- paste(plain, collapse="")
  return(plain)
}

## The main execution.
main <- function() {
  cat("Test output:\n")
  testlst <- c('A', 'Z', 'B', 'Y', 'a', 'z', 'n', 'm', 'b', 'y', '.', '_', '?', 'è')
  testout <- c()
  for (ch in testlst) {
    testout <- c(testout, mod.char(ch, 13))
  }
  testout <- paste(testout, collapse="")
  print(testout)
  cat("\n")

  cat("Running...\n")
  plain  <- "Hey! This is cool, and you have no idea what I'm saying. Boo!"
  cypher <- enc.str(plain)
  cat("Encoding string:\n")
  print(plain)
  print(cypher)
  cat("\n")

  cat("Decoding string:\n")
  cypher <- "Pnrfne pvcure? V zhpu cersre Pnrfne fnynq!"
  plain  <- dec.str(cypher)
  print(cypher)
  print(plain)
  cat("\n")
}
main()
